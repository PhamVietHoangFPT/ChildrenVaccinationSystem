using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class Manufacturers : ControllerBase
	{
		private readonly IManufacturerService _manufacturerService;

		public Manufacturers(IManufacturerService manufacturerService)
        {
            _manufacturerService = manufacturerService;
		}

        [HttpGet]
        public async Task<IActionResult> GetManufacturers(int pageNumber = -1, int pageSize = -1)
        {
            BasePaginatedList<ManufacturerViewDto> manufacturers = await _manufacturerService.GetManufacturers(pageNumber, pageSize);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy danh sách nhà sản xuất thành công",
                data: manufacturers
            ));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetManufacturerById(string id)
        {
            ManufacturerViewDto manufacturer = await _manufacturerService.GetManufacturerById(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy nhà sản xuất thành công",
                data: manufacturer
            ));
        }

        [HttpPost]
        public async Task<IActionResult> AddManufacturer(ManufacturerCreateDto manufacturerDto)
        {
            await _manufacturerService.CreateManufacturer(manufacturerDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Thêm nhà sản xuất thành công",
                data: null
            ));
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateManufacturer(string id, ManufacturerUpdateDto manufacturerDto)
        {
            await _manufacturerService.UpdateManufacturer(id, manufacturerDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Cập nhật nhà sản xuất thành công",
                data: null
            ));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteManufacturer(string id)
        {
            await _manufacturerService.DeleteManufacturer(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Xóa nhà sản xuất thành công",
                data: null
            ));
        }
    }
}
