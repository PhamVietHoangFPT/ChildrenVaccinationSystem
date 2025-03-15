using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VaccinesController : ControllerBase
    {
        private IVaccineService _vaccineService;
        public VaccinesController(IVaccineService vaccineService)
        {
            _vaccineService = vaccineService;
        }

        [HttpGet]
        public async Task<IActionResult> GetVaccines(string? name, string? categoryName, string? manufacturerCountry, int pageNumber = -1, int pageSize = -1)
        {
            BasePaginatedList<VaccineViewDto> vaccines = await _vaccineService.GetVaccines(name,categoryName, manufacturerCountry, pageNumber, pageSize);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy vaccines thành công",
                data: vaccines
            ));
        }

		[HttpGet("minimal")]
		public async Task<IActionResult> GetVaccinesMinimal(string? name, string? categoryName, string? manufacturerCountry, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<object> vaccines = await _vaccineService.GetVaccinesMinimal(name, categoryName, manufacturerCountry, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy vaccines thành công",
				data: vaccines
			));
		}


		[HttpGet("{id}")]
		public async Task<IActionResult> GetVaccineById(string id)
		{
			VaccineViewDto vaccine = await _vaccineService.GetVaccineById(id);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy vaccine thành công",
				data: vaccine
			));
		}

		[HttpPost]
        public async Task<IActionResult> AddVaccine([FromForm]VaccineCreateDto vaccineDto)
        {
            await _vaccineService.CreateVaccine(vaccineDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Thêm vaccine thành công",
                data: null
            ));
        }


        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateVaccine(string id, [FromForm]VaccineUpdateDto vaccineDto)
        {
			await _vaccineService.UpdateVaccine(id, vaccineDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật vaccine thành công",
				data: null
			));
		}


		[HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVaccine(string id)
        {

            await _vaccineService.DeleteVaccine(id);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Xóa vaccine thành công",
				data: null
			));
		}

	}

}
