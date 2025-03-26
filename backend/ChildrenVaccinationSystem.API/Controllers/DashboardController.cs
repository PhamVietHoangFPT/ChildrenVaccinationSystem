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
		public async Task<IActionResult> GetVaccinationsAdministered(int startMonth, int startYear, int endMonth, int endYear, string? facilityId)
		{
			long count = await _dashboardService.GetVaccinationsAdministered(startMonth, startYear, endMonth, endYear, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: count
			));
		}


		[HttpGet("vaccinations-status")]
		public async Task<IActionResult> GetVaccinationsByStatus(int startMonth, int startYear, int endMonth, int endYear, string? facilityId)
		{
			var data = await _dashboardService.GetVaccinationsByStatus(startMonth, startYear, endMonth, endYear, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("completion-rate")]
		public async Task<IActionResult> GetCompletionRate(int startMonth, int startYear, int endMonth, int endYear, string? facilityId)
		{
			var data = await _dashboardService.GetCompletionRate(startMonth, startYear, endMonth, endYear, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("stock-data")]
		public async Task<IActionResult> GetStockData(string? facilityId)
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
		public async Task<IActionResult> GetRegistrations(int startMonth, int startYear, int endMonth, int endYear)
		{
			var data = await _dashboardService.GetRegistrations(startMonth, startYear, endMonth, endYear);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("revenue")]
		public async Task<IActionResult> GetRevenue(int startMonth, int startYear, int endMonth, int endYear, string? facilityId)
		{
			var data = await _dashboardService.GetRevenue(startMonth, startYear, endMonth, endYear, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}


	}
}
