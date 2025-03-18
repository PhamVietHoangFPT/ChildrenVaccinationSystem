using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos;
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
	public class VaccinationsController : ControllerBase
	{
		private readonly IVaccinationService _vaccinationService;

		public VaccinationsController(IVaccinationService vaccinationService)
		{
			_vaccinationService = vaccinationService;
		}

		[HttpGet]
		public async Task<IActionResult> GetVaccinations(string? childId, string? childCode, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<VaccinationViewDto> vaccinations = await _vaccinationService.GetVaccinations(childId, childCode, scheduleFrom, scheduleTo, status, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy vaccinations thành công",
				data: vaccinations
			));
		}


		[HttpGet("minimal")]
		public async Task<IActionResult> GetVaccinationsMinimal(string? childId, string? childCode, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<object> vaccinations = await _vaccinationService.GetVaccinationsMinimal(childId, childCode, scheduleFrom, scheduleTo, status, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy vaccinations thành công",
				data: vaccinations
			));
		}

		[HttpPatch("payment")]
		public async Task<IActionResult> PayPendingVaccinations(List<string> vaccinationIds)
		{
			string vnPayUrl = await _vaccinationService.PayPendingVaccinations(HttpContext, vaccinationIds);


			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Mời bạn tiến hành thanh toán",
				data: vnPayUrl
			));
		}
		
		[HttpPost("register")]
		public async Task<IActionResult> RegisterVaccination(VaccinationRegisterDto dto)
		{
			string vnPayUrl = await _vaccinationService.RegisterVaccination(HttpContext, dto);


			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Mời bạn tiến hành thanh toán",
				data: vnPayUrl
			));
		}

		[HttpPut("{id}/staff")]
		public async Task<IActionResult> UpdateVaccinationByStaff(string id, VaccinationUpdateDto dto)
		{
			await _vaccinationService.UpdateVaccinationByStaff(id, dto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật thông tin vaccination thành công!",
				data: null
			));
		}

		[HttpPut("{id}/{status}")]
		public async Task<IActionResult> ShiftVaccinationStatus(string id, VaccinationStatusEnum status)
		{
			await _vaccinationService.ShiftVaccinationStatus(id, status);


			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Thay đổi trạng thái thành công!",
				data: null
			));
		}
	}
}
