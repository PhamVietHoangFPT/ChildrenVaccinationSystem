using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PackagesController : ControllerBase
    {
        private readonly IPackageService _packageService;

        public PackagesController(IPackageService packageService)
        {
            _packageService = packageService;
        }

        [HttpGet]
        public async Task<IActionResult> GetPackages(string? name, int pageNumber = -1, int pageSize = -1)
        {
            var packages = await _packageService.GetPackages(name, pageNumber, pageSize);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy danh sách packages thành công",
                data: packages
            ));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetPackageById(string id)
        {
            var package = await _packageService.GetPackageById(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy thông tin package thành công",
                data: package
            ));
        }

        [HttpPost]
        public async Task<IActionResult> AddPackage([FromBody] PackageCreateDto packageCreateDto)
        {
            await _packageService.CreatePackage(packageCreateDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Thêm package thành công",
                data: null
            ));
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdatePackage(string id, [FromBody] PackageUpdateDto packageUpdateDto)
        {
            await _packageService.UpdatePackage(id, packageUpdateDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Cập nhật package thành công",
                data: null
            ));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePackage(string id)
        {
            await _packageService.DeletePackage(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Xóa package thành công",
                data: null
            ));
        }
    }
}