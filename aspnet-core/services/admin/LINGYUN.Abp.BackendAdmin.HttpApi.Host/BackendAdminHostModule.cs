﻿using LINGYUN.Abp.AspNetCore.HttpOverrides;
using LINGYUN.Abp.Auditing;
using LINGYUN.Abp.AuditLogging.Elasticsearch;
using LINGYUN.Abp.Data.DbMigrator;
using LINGYUN.Abp.EventBus.CAP;
using LINGYUN.Abp.ExceptionHandling.Emailing;
using LINGYUN.Abp.FeatureManagement;
using LINGYUN.Abp.LocalizationManagement.EntityFrameworkCore;
using LINGYUN.Abp.Logging.Serilog.Elasticsearch;
using LINGYUN.Abp.MultiTenancy.DbFinder;
using LINGYUN.Abp.PermissionManagement.Identity;
using LINGYUN.Abp.Serilog.Enrichers.Application;
using LINGYUN.Abp.SettingManagement;
using LINGYUN.Abp.Sms.Aliyun;
using LINGYUN.Abp.TenantManagement;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Volo.Abp;
using Volo.Abp.AspNetCore.Authentication.JwtBearer;
using Volo.Abp.AspNetCore.Mvc.UI.MultiTenancy;
using Volo.Abp.AspNetCore.Serilog;
using Volo.Abp.Autofac;
using Volo.Abp.Caching.StackExchangeRedis;
using Volo.Abp.EntityFrameworkCore.MySQL;
using Volo.Abp.FeatureManagement;
using Volo.Abp.FeatureManagement.EntityFrameworkCore;
using Volo.Abp.Identity.EntityFrameworkCore;
using Volo.Abp.IdentityServer.EntityFrameworkCore;
using Volo.Abp.Modularity;
using Volo.Abp.PermissionManagement;
using Volo.Abp.PermissionManagement.EntityFrameworkCore;
using Volo.Abp.PermissionManagement.HttpApi;
using Volo.Abp.PermissionManagement.IdentityServer;
using Volo.Abp.SettingManagement.EntityFrameworkCore;
using Volo.Abp.TenantManagement.EntityFrameworkCore;

namespace LINGYUN.Abp.BackendAdmin
{
    [DependsOn(
        typeof(AbpSerilogEnrichersApplicationModule),
        typeof(AbpAspNetCoreSerilogModule),
        typeof(AbpLoggingSerilogElasticsearchModule),
        typeof(AbpAuditLoggingElasticsearchModule),
        typeof(AbpAspNetCoreMvcUiMultiTenancyModule),
        typeof(AbpSettingManagementApplicationModule),
        typeof(AbpSettingManagementHttpApiModule),
        typeof(AbpPermissionManagementApplicationModule),
        typeof(AbpPermissionManagementHttpApiModule),
        typeof(AbpFeatureManagementApplicationModule),
        typeof(AbpFeatureManagementHttpApiModule),
        typeof(AbpFeatureManagementClientModule),
        typeof(AbpAuditingApplicationModule),
        typeof(AbpAuditingHttpApiModule),
        typeof(AbpTenantManagementApplicationModule),
        typeof(AbpTenantManagementHttpApiModule),
        typeof(AbpEntityFrameworkCoreMySQLModule),
        typeof(AbpIdentityEntityFrameworkCoreModule),// 用户角色权限需要引用包
        typeof(AbpIdentityServerEntityFrameworkCoreModule), // 客户端权限需要引用包
        typeof(AbpTenantManagementEntityFrameworkCoreModule),
        typeof(AbpSettingManagementEntityFrameworkCoreModule),
        typeof(AbpPermissionManagementDomainIdentityModule),
        typeof(AbpPermissionManagementDomainIdentityServerModule),
        typeof(AbpPermissionManagementEntityFrameworkCoreModule),
        typeof(AbpFeatureManagementEntityFrameworkCoreModule),
        typeof(AbpLocalizationManagementEntityFrameworkCoreModule),
        typeof(AbpDataDbMigratorModule),
        typeof(AbpAspNetCoreAuthenticationJwtBearerModule),
        typeof(AbpEmailingExceptionHandlingModule),
        typeof(AbpCAPEventBusModule),
        typeof(AbpAliyunSmsModule),
        typeof(AbpDbFinderMultiTenancyModule),
        typeof(AbpCachingStackExchangeRedisModule),
        typeof(AbpAspNetCoreHttpOverridesModule),
        typeof(AbpAutofacModule)
        )]
    public partial class BackendAdminHostModule : AbpModule
    {
        public override void PreConfigureServices(ServiceConfigurationContext context)
        {
            var configuration = context.Services.GetConfiguration();

            PreConfigureApp();
            PreConfigureCAP(configuration);
        }

        public override void ConfigureServices(ServiceConfigurationContext context)
        {
            var hostingEnvironment = context.Services.GetHostingEnvironment();
            var configuration = hostingEnvironment.BuildConfiguration();

            ConfigureDbContext();
            ConfigureJsonSerializer();
            ConfigurePermissionManagement();
            ConfigureExceptionHandling();
            ConfigureCaching(configuration);
            ConfigureVirtualFileSystem();
            ConfigureMultiTenancy(configuration);
            ConfigureAuditing(configuration);
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
            // jwt
            app.UseJwtTokenMiddleware();
            // 多租户
            app.UseMultiTenancy();
            // Swagger
            app.UseSwagger();
            // Swagger可视化界面
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "Support BackendAdmin API");
            });
            // 审计日志
            app.UseAuditing();
            app.UseAbpSerilogEnrichers();
            UseDevelopment(app, context);
            // 路由
            app.UseConfiguredEndpoints();

            SeedData(context);
        }
    }
}
