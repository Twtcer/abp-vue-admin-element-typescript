﻿using DotNetCore.CAP;
using LINGYUN.Abp.ExceptionHandling;
using LINGYUN.Abp.ExceptionHandling.Emailing;
using LINGYUN.Abp.Serilog.Enrichers.Application;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.DataProtection;
using Microsoft.Extensions.Caching.StackExchangeRedis;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;
using StackExchange.Redis;
using System;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using Volo.Abp;
using Volo.Abp.Auditing;
using Volo.Abp.Caching;
using Volo.Abp.EntityFrameworkCore;
using Volo.Abp.Json.SystemTextJson;
using Volo.Abp.Localization;
using Volo.Abp.MultiTenancy;
using Volo.Abp.VirtualFileSystem;


namespace LINGYUN.Abp.LocalizationManagement
{
    public partial class AbpLocalizationManagementHttpApiHostModule
    {
        private void PreConfigureApp()
        {
            AbpSerilogEnrichersConsts.ApplicationName = "Localization";
        }

        private void PreConfigureCAP(IConfiguration configuration)
        {
            PreConfigure<CapOptions>(options =>
            {
                options
                .UseMySql(mySqlOptions =>
                {
                    configuration.GetSection("CAP:MySql").Bind(mySqlOptions);
                })
                .UseRabbitMQ(rabbitMQOptions =>
                {
                    configuration.GetSection("CAP:RabbitMQ").Bind(rabbitMQOptions);
                })
                .UseDashboard();
            });
        }

        private void ConfigureDbContext()
        {
            // 配置Ef
            Configure<AbpDbContextOptions>(options =>
            {
                options.UseMySQL();
            });
        }

        private void ConfigureJsonSerializer()
        {
            // 中文序列化的编码问题
            Configure<AbpSystemTextJsonSerializerOptions>(options =>
            {
                options.JsonSerializerOptions.Encoder = JavaScriptEncoder.Create(UnicodeRanges.All);
            });
        }

        private void ConfigreExceptionHandling()
        {
            // 自定义需要处理的异常
            Configure<AbpExceptionHandlingOptions>(options =>
            {
                //  加入需要处理的异常类型
                options.Handlers.Add<Volo.Abp.Data.AbpDbConcurrencyException>();
                options.Handlers.Add<AbpInitializationException>();
                options.Handlers.Add<ObjectDisposedException>();
                options.Handlers.Add<StackOverflowException>();
                options.Handlers.Add<OutOfMemoryException>();
                options.Handlers.Add<System.Data.Common.DbException>();
                options.Handlers.Add<Microsoft.EntityFrameworkCore.DbUpdateException>();
                options.Handlers.Add<System.Data.DBConcurrencyException>();
            });
            // 自定义需要发送邮件通知的异常类型
            Configure<AbpEmailExceptionHandlingOptions>(options =>
            {
                // 是否发送堆栈信息
                options.SendStackTrace = true;
            });
        }

        private void ConfigureAuditing(IConfiguration configuration)
        {
            Configure<AbpAuditingOptions>(options =>
            {
                options.ApplicationName = "Localization";
                // 是否启用实体变更记录
                var entitiesChangedConfig = configuration.GetSection("App:TrackingEntitiesChanged");
                if (entitiesChangedConfig.Exists() && entitiesChangedConfig.Get<bool>())
                {
                    options
                    .EntityHistorySelectors
                    .AddAllEntities();
                }
            });
        }

        private void ConfigureCaching(IConfiguration configuration)
        {
            Configure<AbpDistributedCacheOptions>(options =>
            {
                // 最好统一命名,不然某个缓存变动其他应用服务有例外发生
                options.KeyPrefix = "LINGYUN.Abp.Application";
                // 滑动过期30天
                options.GlobalCacheEntryOptions.SlidingExpiration = TimeSpan.FromDays(30);
                // 绝对过期60天
                options.GlobalCacheEntryOptions.AbsoluteExpiration = DateTimeOffset.Now.AddMinutes(60);
            });

            Configure<RedisCacheOptions>(options =>
            {
                var redisConfig = ConfigurationOptions.Parse(options.Configuration);
                options.ConfigurationOptions = redisConfig;
                options.InstanceName = configuration["Redis:InstanceName"];
            });
        }

        private void ConfigureVirtualFileSystem()
        {
            Configure<AbpVirtualFileSystemOptions>(options =>
            {
                options.FileSets.AddEmbedded<AbpLocalizationManagementHttpApiHostModule>("LINGYUN.Abp.LocalizationManagement");
            });
        }

        private void ConfigureMultiTenancy(IConfiguration configuration)
        {
            // 多租户
            Configure<AbpMultiTenancyOptions>(options =>
            {
                options.IsEnabled = false;
            });
        }

        private void ConfigureSwagger(IServiceCollection services)
        {
            // Swagger
            services.AddSwaggerGen(
                options =>
                {
                    options.SwaggerDoc("v1", new OpenApiInfo { Title = "Localization Management API", Version = "v1" });
                    options.DocInclusionPredicate((docName, description) => true);
                    options.CustomSchemaIds(type => type.FullName);
                    options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                    {
                        Description = "JWT Authorization header using the Bearer scheme. Example: \"Authorization: Bearer {token}\"",
                        Name = "Authorization",
                        In = ParameterLocation.Header,
                        Scheme = "bearer",
                        Type = SecuritySchemeType.Http,
                        BearerFormat = "JWT"
                    });
                    options.AddSecurityRequirement(new OpenApiSecurityRequirement
                    {
                        {
                            new OpenApiSecurityScheme
                            {
                                Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" }
                            },
                            new string[] { }
                        }
                    });
                    options.OperationFilter<TenantHeaderParamter>();
                });
        }

        private void ConfigureLocalization()
        {
            // 默认支持的本地化语言类型
            Configure<AbpLocalizationOptions>(options =>
            {
                options.Languages.Add(new LanguageInfo("en", "en", "English"));
                options.Languages.Add(new LanguageInfo("zh-Hans", "zh-Hans", "简体中文"));

                options.Resources.AddDynamic();
            });
        }

        private void ConfigureSecurity(IServiceCollection services, IConfiguration configuration, bool isDevelopment = false)
        {
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.Authority = configuration["AuthServer:Authority"];
                    options.RequireHttpsMetadata = false;
                    options.Audience = configuration["AuthServer:ApiName"];
                });

            if (!isDevelopment)
            {
                var redis = ConnectionMultiplexer.Connect(configuration["Redis:Configuration"]);
                services
                    .AddDataProtection()
                    .PersistKeysToStackExchangeRedis(redis, "Localization-Protection-Keys");
            }
        }
    }
}
