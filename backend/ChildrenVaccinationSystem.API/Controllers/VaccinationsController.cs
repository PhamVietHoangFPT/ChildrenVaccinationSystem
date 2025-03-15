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
		public async Task<IActionResult> GetVaccinations(string? childId, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<VaccinationViewDto> vaccinations = await _vaccinationService.GetVaccinations(childId, scheduleFrom, scheduleTo, status, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy vaccinations thành công",
				data: vaccinations
			));
		}


		[HttpGet("minimal")]
		public async Task<IActionResult> GetVaccinationsMinimal(string? childId, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<object> vaccinations = await _vaccinationService.GetVaccinationsMinimal(childId, scheduleFrom, scheduleTo, status, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy vaccinations thành công",
				data: vaccinations
			));
		}



	}
}
