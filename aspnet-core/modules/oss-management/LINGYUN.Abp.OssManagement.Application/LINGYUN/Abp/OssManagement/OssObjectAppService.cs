﻿using LINGYUN.Abp.OssManagement.Permissions;
using Microsoft.AspNetCore.Authorization;
using System.IO;
using System.Threading.Tasks;
using System.Web;

namespace LINGYUN.Abp.OssManagement
{
    [Authorize(AbpOssManagementPermissions.OssObject.Default)]
    public class OssObjectAppService : OssManagementApplicationServiceBase, IOssObjectAppService
    {
        protected FileUploadMerger Merger { get; }
        protected IOssContainerFactory OssContainerFactory { get; }

        public OssObjectAppService(
            FileUploadMerger merger,
            IOssContainerFactory ossContainerFactory)
        {
            Merger = merger;
            OssContainerFactory = ossContainerFactory;
        }

        [Authorize(AbpOssManagementPermissions.OssObject.Create)]
        public virtual async Task<OssObjectDto> CreateAsync(CreateOssObjectInput input)
        {
            // 内容为空时建立目录
            if (input.Content.IsNullOrEmpty())
            {
                var oss = CreateOssContainer();
                var request = new CreateOssObjectRequest(
                    HttpUtility.UrlDecode(input.Bucket),
                    HttpUtility.UrlDecode(input.Object),
                    input.Content,
                    HttpUtility.UrlDecode(input.Path));
                var ossObject = await oss.CreateObjectAsync(request);

                return ObjectMapper.Map<OssObject, OssObjectDto>(ossObject);
            } 
            else
            {
                var ossObject = await Merger.MergeAsync(input);

                return ObjectMapper.Map<OssObject, OssObjectDto>(ossObject);
            }
        }

        [Authorize(AbpOssManagementPermissions.OssObject.Delete)]
        public virtual async Task BulkDeleteAsync(BulkDeleteOssObjectInput input)
        {
            var oss = CreateOssContainer();

            await oss.BulkDeleteObjectsAsync(input.Bucket, input.Objects, input.Path);
        }

        [Authorize(AbpOssManagementPermissions.OssObject.Delete)]
        public virtual async Task DeleteAsync(GetOssObjectInput input)
        {
            var oss = CreateOssContainer();

            await oss.DeleteObjectAsync(input.Bucket, input.Object, input.Path);
        }

        public virtual async Task<OssObjectDto> GetAsync(GetOssObjectInput input)
        {
            var oss = CreateOssContainer();

            var ossObject = await oss.GetObjectAsync(input.Bucket, input.Object, input.Path);

            return ObjectMapper.Map<OssObject, OssObjectDto>(ossObject);
        }

        protected virtual IOssContainer CreateOssContainer()
        {
            return OssContainerFactory.Create();
        }
    }
}
