﻿using Dapr.Client;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Threading;
using System.Threading.Tasks;
using Volo.Abp;
using Volo.Abp.Content;
using Volo.Abp.DependencyInjection;
using Volo.Abp.DynamicProxy;
using Volo.Abp.Http;
using Volo.Abp.Http.Client;
using Volo.Abp.Http.Client.Authentication;
using Volo.Abp.Http.Client.DynamicProxying;
using Volo.Abp.Http.Modeling;
using Volo.Abp.Http.ProxyScripting.Generators;
using Volo.Abp.Json;
using Volo.Abp.MultiTenancy;
using Volo.Abp.Threading;
using Volo.Abp.Tracing;

namespace LINGYUN.Abp.Dapr.Client.DynamicProxying
{
    public class DynamicDaprClientProxyInterceptor<TService> : AbpInterceptor, ITransientDependency
    {
        protected static MethodInfo MakeRequestAndGetResultAsyncMethod { get; }

        protected IDaprClientFactory DaprClientFactory { get; }
        protected ICancellationTokenProvider CancellationTokenProvider { get; }
        protected ICorrelationIdProvider CorrelationIdProvider { get; }
        protected ICurrentTenant CurrentTenant { get; }
        protected AbpCorrelationIdOptions AbpCorrelationIdOptions { get; }
        protected IDynamicProxyHttpClientFactory HttpClientFactory { get; }
        protected IDaprApiDescriptionFinder ApiDescriptionFinder { get; }
        protected AbpDaprRemoteServiceOptions AbpRemoteServiceOptions { get; }
        protected AbpDaprClientProxyOptions ClientProxyOptions { get; }
        protected IJsonSerializer JsonSerializer { get; }
        protected IRemoteServiceHttpClientAuthenticator ClientAuthenticator { get; }

        public ILogger<DynamicDaprClientProxyInterceptor<TService>> Logger { get; set; }

        static DynamicDaprClientProxyInterceptor()
        {
            MakeRequestAndGetResultAsyncMethod = typeof(DynamicDaprClientProxyInterceptor<TService>)
                .GetMethods(BindingFlags.NonPublic | BindingFlags.Instance)
                .First(m => m.Name == nameof(MakeRequestAndGetResultAsync) && m.IsGenericMethodDefinition);
        }

        public DynamicDaprClientProxyInterceptor(
            IDaprClientFactory daprClientFactory,
            IOptions<AbpDaprClientProxyOptions> clientProxyOptions,
            IOptionsSnapshot<AbpDaprRemoteServiceOptions> remoteServiceOptions,
            IDaprApiDescriptionFinder apiDescriptionFinder,
            IJsonSerializer jsonSerializer,
            IDynamicProxyHttpClientFactory dynamicProxyHttpClientFactory,
            IRemoteServiceHttpClientAuthenticator clientAuthenticator,
            ICancellationTokenProvider cancellationTokenProvider,
            ICorrelationIdProvider correlationIdProvider,
            IOptions<AbpCorrelationIdOptions> correlationIdOptions,
            ICurrentTenant currentTenant)
        {
            DaprClientFactory = daprClientFactory;
            CancellationTokenProvider = cancellationTokenProvider;
            CorrelationIdProvider = correlationIdProvider;
            CurrentTenant = currentTenant;
            HttpClientFactory = dynamicProxyHttpClientFactory;
            AbpCorrelationIdOptions = correlationIdOptions.Value;
            ApiDescriptionFinder = apiDescriptionFinder;
            JsonSerializer = jsonSerializer;
            ClientAuthenticator = clientAuthenticator;
            ClientProxyOptions = clientProxyOptions.Value;  
            AbpRemoteServiceOptions = remoteServiceOptions.Value;

            Logger = NullLogger<DynamicDaprClientProxyInterceptor<TService>>.Instance;
        }

        public override async Task InterceptAsync(IAbpMethodInvocation invocation)
        {
            if (invocation.Method.ReturnType.GenericTypeArguments.IsNullOrEmpty())
            {
                await MakeRequestAsync(invocation);
            }
            else
            {
                var result = (Task)MakeRequestAndGetResultAsyncMethod
                    .MakeGenericMethod(invocation.Method.ReturnType.GenericTypeArguments[0])
                    .Invoke(this, new object[] { invocation });

                invocation.ReturnValue = await GetResultAsync(
                    result,
                    invocation.Method.ReturnType.GetGenericArguments()[0]
                );
            }
        }

        private async Task<object> GetResultAsync(Task task, Type resultType)
        {
            await task;
            return typeof(Task<>)
                .MakeGenericType(resultType)
                .GetProperty(nameof(Task<object>.Result), BindingFlags.Instance | BindingFlags.Public)
                .GetValue(task);
        }

        private async Task<T> MakeRequestAndGetResultAsync<T>(IAbpMethodInvocation invocation)
        {
            var responseContent = await MakeRequestAsync(invocation);

            if (typeof(T) == typeof(IRemoteStreamContent))
            {
                /* returning a class that holds a reference to response
                 * content just to be sure that GC does not dispose of
                 * it before we finish doing our work with the stream */
                return (T)(object)new RemoteStreamContent(await responseContent.ReadAsStreamAsync())
                {
                    ContentType = responseContent.Headers.ContentType?.ToString()
                };
            }

            var stringContent = await responseContent.ReadAsStringAsync();
            if (typeof(T) == typeof(string))
            {
                return (T)(object)stringContent;
            }

            if (stringContent.IsNullOrWhiteSpace())
            {
                return default;
            }

            return JsonSerializer.Deserialize<T>(stringContent);
        }

        private async Task<HttpContent> MakeRequestAsync(IAbpMethodInvocation invocation)
        {
            var clientConfig = ClientProxyOptions.DaprClientProxies.GetOrDefault(typeof(TService)) ?? throw new AbpException($"Could not get DynamicDaprClientProxyConfig for {typeof(TService).FullName}.");
            var remoteServiceConfig = AbpRemoteServiceOptions.RemoteServices.GetConfigurationOrDefault(clientConfig.RemoteServiceName);

            // 遵循远端   api/abp/api-definition
            var action = await ApiDescriptionFinder.FindActionAsync(
                clientConfig.RemoteServiceName,
                remoteServiceConfig.AppId,
                typeof(TService),
                invocation.Method
            );

            var apiVersion = GetApiVersionInfo(action);

            // See: https://docs.dapr.io/reference/api/service_invocation_api/#examples
            // 需要合并端点作为dapr远程调用的方法名称
            var methodName = UrlBuilder.GenerateUrlWithParameters(action, invocation.ArgumentsDictionary, apiVersion);

            var daprClient = DaprClientFactory.CreateClient(clientConfig.RemoteServiceName);
            var requestMessage = daprClient.CreateInvokeMethodRequest(
                action.GetHttpMethod(),
                remoteServiceConfig.AppId,
                methodName);

            requestMessage.Content = RequestPayloadBuilder.BuildContent(action, invocation.ArgumentsDictionary, JsonSerializer, apiVersion);

            AddHeaders(invocation, action, requestMessage, apiVersion);

            var httpClient = HttpClientFactory.Create(AbpDaprClientModule.DaprHttpClient);
            await ClientAuthenticator.Authenticate(
                new RemoteServiceHttpClientAuthenticateContext(
                    httpClient,
                    requestMessage,
                    remoteServiceConfig,
                    clientConfig.RemoteServiceName
                )
            );
            // 其他库可能将授权标头写入到HttpClient中
            if (requestMessage.Headers.Authorization == null &&
                httpClient.DefaultRequestHeaders.Authorization != null) 
            {
                requestMessage.Headers.Authorization = httpClient.DefaultRequestHeaders.Authorization;
            }

            var response = await daprClient.InvokeMethodWithResponseAsync(requestMessage, GetCancellationToken());

            if (!response.IsSuccessStatusCode)
            {
                await ThrowExceptionForResponseAsync(response);
            }

            return response.Content;
        }

        private ApiVersionInfo GetApiVersionInfo(ActionApiDescriptionModel action)
        {
            var apiVersion = FindBestApiVersion(action);

            //TODO: Make names configurable?
            var versionParam = action.Parameters.FirstOrDefault(p => p.Name == "apiVersion" && p.BindingSourceId == ParameterBindingSources.Path) ??
                               action.Parameters.FirstOrDefault(p => p.Name == "api-version" && p.BindingSourceId == ParameterBindingSources.Query);

            return new ApiVersionInfo(versionParam?.BindingSourceId, apiVersion);
        }

        private string FindBestApiVersion(ActionApiDescriptionModel action)
        {
            var configuredVersion = GetConfiguredApiVersion();

            if (action.SupportedVersions.IsNullOrEmpty())
            {
                return configuredVersion ?? "1.0";
            }

            if (action.SupportedVersions.Contains(configuredVersion))
            {
                return configuredVersion;
            }

            return action.SupportedVersions.Last(); //TODO: Ensure to get the latest version!
        }

        protected virtual void AddHeaders(
            IAbpMethodInvocation invocation,
            ActionApiDescriptionModel action,
            HttpRequestMessage requestMessage,
            ApiVersionInfo apiVersion)
        {
            //API Version
            if (!apiVersion.Version.IsNullOrEmpty())
            {
                //TODO: What about other media types?
                requestMessage.Headers.Add("accept", $"{MimeTypes.Text.Plain}; v={apiVersion.Version}");
                requestMessage.Headers.Add("accept", $"{MimeTypes.Application.Json}; v={apiVersion.Version}");
                requestMessage.Headers.Add("api-version", apiVersion.Version);
            }

            //Header parameters
            var headers = action.Parameters.Where(p => p.BindingSourceId == ParameterBindingSources.Header).ToArray();
            foreach (var headerParameter in headers)
            {
                var value = HttpActionParameterHelper.FindParameterValue(invocation.ArgumentsDictionary, headerParameter);
                if (value != null)
                {
                    requestMessage.Headers.Add(headerParameter.Name, value.ToString());
                }
            }

            //CorrelationId
            requestMessage.Headers.Add(AbpCorrelationIdOptions.HttpHeaderName, CorrelationIdProvider.Get());

            //TenantId
            if (CurrentTenant.Id.HasValue)
            {
                //TODO: Use AbpAspNetCoreMultiTenancyOptions to get the key
                requestMessage.Headers.Add(TenantResolverConsts.DefaultTenantKey, CurrentTenant.Id.Value.ToString());
            }

            //Culture
            //TODO: Is that the way we want? Couldn't send the culture (not ui culture)
            var currentCulture = CultureInfo.CurrentUICulture.Name ?? CultureInfo.CurrentCulture.Name;
            if (!currentCulture.IsNullOrEmpty())
            {
                requestMessage.Headers.AcceptLanguage.Add(new StringWithQualityHeaderValue(currentCulture));
            }

            //X-Requested-With
            requestMessage.Headers.Add("X-Requested-With", "XMLHttpRequest");
        }

        private string GetConfiguredApiVersion()
        {
            var clientConfig = ClientProxyOptions.DaprClientProxies.GetOrDefault(typeof(TService))
                               ?? throw new AbpException($"Could not get DynamicDaprClientProxyConfig for {typeof(TService).FullName}.");

            return AbpRemoteServiceOptions.RemoteServices.GetOrDefault(clientConfig.RemoteServiceName)?.Version
                   ?? AbpRemoteServiceOptions.RemoteServices.Default?.Version;
        }

        private async Task ThrowExceptionForResponseAsync(HttpResponseMessage response)
        {
            if (response.Headers.Contains(AbpHttpConsts.AbpErrorFormat))
            {
                var errorResponse = JsonSerializer.Deserialize<RemoteServiceErrorResponse>(
                    await response.Content.ReadAsStringAsync()
                );

                throw new AbpRemoteCallException(errorResponse.Error)
                {
                    HttpStatusCode = (int)response.StatusCode
                };
            }

            throw new AbpRemoteCallException(
                new RemoteServiceErrorInfo
                {
                    Message = response.ReasonPhrase,
                    Code = response.StatusCode.ToString()
                }
            )
            {
                HttpStatusCode = (int)response.StatusCode
            };
        }

        protected virtual CancellationToken GetCancellationToken()
        {
            return CancellationTokenProvider.Token;
        }
    }
}
