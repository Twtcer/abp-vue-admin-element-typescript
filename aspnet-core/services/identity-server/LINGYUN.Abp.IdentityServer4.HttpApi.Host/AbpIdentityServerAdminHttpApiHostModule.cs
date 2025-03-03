using LINGYUN.Abp.AspNetCore.HttpOverrides;
using LINGYUN.Abp.AuditLogging.Elasticsearch;
using LINGYUN.Abp.EventBus.CAP;
using LINGYUN.Abp.ExceptionHandling.Emailing;
using LINGYUN.Abp.LocalizationManagement.EntityFrameworkCore;
using LINGYUN.Abp.MultiTenancy.DbFinder;
using LINGYUN.Abp.Serilog.Enrichers.Application;
using LINGYUN.Abp.Sms.Aliyun;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Volo.Abp;
using Volo.Abp.AspNetCore.Authentication.JwtBearer;
using Volo.Abp.AspNetCore.MultiTenancy;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.Autofac;
using Volo.Abp.Caching.StackExchangeRedis;
using Volo.Abp.EntityFrameworkCore.MySQL;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;
using Volo.Abp.SettingManagement.EntityFrameworkCore;
using Volo.Abp.TenantManagement.EntityFrameworkCore;

namespace LINGYUN.Abp.IdentityServer4
{
    [DependsOn(
        typeof(AbpSerilogEnrichersApplicationModule),
        typeof(AbpAspNetCoreSerilogModule),
        typeof(AbpAspNetCoreMultiTenancyModule),
        typeof(LINGYUN.Abp.Account.AbpAccountApplicationModule),
        typeof(LINGYUN.Abp.Account.AbpAccountHttpApiModule),
        typeof(LINGYUN.Abp.Identity.AbpIdentityApplicationModule),
        typeof(LINGYUN.Abp.Identity.AbpIdentityHttpApiModule),
        typeof(LINGYUN.Abp.IdentityServer.AbpIdentityServerApplicationModule),
        typeof(LINGYUN.Abp.IdentityServer.AbpIdentityServerHttpApiModule),
        typeof(LINGYUN.Abp.Identity.EntityFrameworkCore.AbpIdentityEntityFrameworkCoreModule),
        typeof(LINGYUN.Abp.IdentityServer.EntityFrameworkCore.AbpIdentityServerEntityFrameworkCoreModule),
        typeof(AbpEntityFrameworkCoreMySQLModule),
        typeof(AbpTenantManagementEntityFrameworkCoreModule),
        typeof(AbpSettingManagementEntityFrameworkCoreModule),
        typeof(AbpPermissionManagementEntityFrameworkCoreModule),
        typeof(AbpLocalizationManagementEntityFrameworkCoreModule),
        typeof(AbpAspNetCoreAuthenticationJwtBearerModule),
        typeof(AbpAuditLoggingElasticsearchModule),
        typeof(AbpEmailingExceptionHandlingModule),
        typeof(AbpCAPEventBusModule),
        typeof(AbpAliyunSmsModule),
        typeof(AbpDbFinderMultiTenancyModule),
        typeof(AbpCachingStackExchangeRedisModule),
        typeof(AbpAspNetCoreHttpOverridesModule),
        typeof(AbpAutofacModule)
        )]
    public partial class AbpIdentityServerAdminHttpApiHostModule : AbpModule
    {
        public override void PreConfigureServices(ServiceConfigurationContext context)
        {
            var configuration = context.Services.GetConfiguration();

            PreConfigureApp();
            PreConfigureCAP(configuration);
            PreConfigureIdentity();
        }

        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            var hostingEnvironment = context.Services.GetHostingEnvironment();
            var configuration = hostingEnvironment.BuildConfiguration();

            ConfigureDbContext();
            ConfigureJsonSerializer();
            ConfigurePermissionManagement();
            ConfigreExceptionHandling();
            ConfigureAuditing(configuration);
            ConfigureCaching(configuration);
            ConfigureVirtualFileSystem();
            ConfigureMultiTenancy(configuration);
            ConfigureSwagger(context.Services);
            ConfigureLocalization();
            ConfigureSecurity(context.Services, configuration, hostingEnvironment.IsDevelopment());
        }

        public override void OnApplicationInitialization(ApplicationInitializationContext context)
        {
            var app = context.GetApplicationBuilder();
            // http调用链
            app.UseCorrelationId();
            // 虚拟文件系统
            app.UseStaticFiles();
            // 本地化
            app.UseAbpRequestLocalization();
            //路由
            app.UseRouting();
            // 认证
            app.UseAuthentication();
            app.UseAbpClaimsMap();
            // jwt
            app.UseJwtTokenMiddleware();
            // 多租户
            app.UseMultiTenancy();
            // Swagger
            app.UseSwagger();
            // Swagger可视化界面
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "Support IdentityServer4 API");
            });
            // 审计日志
            app.UseAuditing();
            app.UseAbpSerilogEnrichers();
            // 路由
            app.UseConfiguredEndpoints();
        }
    }
}