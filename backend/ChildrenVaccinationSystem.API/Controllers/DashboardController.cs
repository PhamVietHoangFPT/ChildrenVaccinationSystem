using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class DashboardController : ControllerBase
	{
		private readonly DashboardService _dashboardService;


		public DashboardController(DashboardService dashboardService) 
		{
			_dashboardService = dashboardService;
		}


		[HttpGet("vaccinations-administered")]
		public async Task<IActionResult> GetVaccinationsAdministered(DateOnly start, DateOnly end, string? facilityId)
		{
			long count = await _dashboardService.GetVaccinationsAdministered(start, end, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: count
			));
		}


		[HttpGet("vaccinations-status")]
		public async Task<IActionResult> GetVaccinationsByStatus(DateOnly start, DateOnly end, string? facilityId)
		{
			var data = await _dashboardService.GetVaccinationsByStatus(start, end, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("completion-rate")]
		public async Task<IActionResult> GetCompletionRate(DateOnly start, DateOnly end, string? facilityId)
		{
			var data = await _dashboardService.GetCompletionRate(start, end, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("stock-data")]
		public async Task<IActionResult> GetStockData(DateOnly start, DateOnly end, string? facilityId)
		{
			var data = await _dashboardService.GetStockData(facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("registrations")]
		public async Task<IActionResult> GetRegistrations(DateOnly start, DateOnly end)
		{
			var data = await _dashboardService.GetRegistrations(start, end);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("revenue")]
		public async Task<IActionResult> GetRevenue(DateOnly start, DateOnly end, string? facilityId)
		{
			var data = await _dashboardService.GetRevenue(start, end, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}


	}
}
