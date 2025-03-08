using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
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
    public class VaccineController : ControllerBase
    {
        private IVaccineService _vaccineService;
        public VaccineController(IVaccineService vaccineService)
        {
            _vaccineService = vaccineService;
        }

        [HttpGet]
        public async Task<IActionResult> GetVaccine(int pageNumber = -1, int pageSize = -1)
        {
            BasePaginatedList<VaccineViewDto> vaccines = await _vaccineService.GetVaccinesAsync(pageNumber, pageSize);

            return Ok(new BaseResponse<BasePaginatedList<VaccineViewDto>>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy vaccine thành công",
                data: vaccines
            ));
        }

        [HttpPost]
        public async Task<IActionResult> AddVaccine(VaccineCreateDto vaccineDto)
        {
            await _vaccineService.CreateVaccineAsync(vaccineDto);

            return Ok(new BaseResponse<BasePaginatedList<string>>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Thêm vaccine thành công",
                data: null
            ));
        }



        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateVaccine(string id, VaccineUpdateDto vaccineDto)
        {
			await _vaccineService.UpdateVaccineAsync(id, vaccineDto);

			return Ok(new BaseResponse<BasePaginatedList<string>>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật vaccine thành công",
				data: null
			));
		}


		[HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVaccine(string id)
        {

            await _vaccineService.DeleteVaccineAsync(id);

			return Ok(new BaseResponse<BasePaginatedList<string>>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Xóa vaccine thành công",
				data: null
			));
		}

	}

}
