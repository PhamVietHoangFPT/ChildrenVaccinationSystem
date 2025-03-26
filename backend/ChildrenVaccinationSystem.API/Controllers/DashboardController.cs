using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

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
		public async Task<IActionResult> GetVaccinationsAdministered([Required] int startMonth, [Required] int startYear, [Required] int endMonth, [Required] int endYear, string? facilityId)
		{
			var data = await _dashboardService.GetVaccinationsAdministered(startMonth, startYear, endMonth, endYear, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}


		[HttpGet("vaccinations-status")]
		public async Task<IActionResult> GetVaccinationsByStatus([Required] int startMonth, [Required] int startYear, [Required] int endMonth, [Required] int endYear, string? facilityId)
		{
			var data = await _dashboardService.GetVaccinationsByStatus(startMonth, startYear, endMonth, endYear, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("registrations")]
		public async Task<IActionResult> GetRegistrations([Required] int startMonth, [Required] int startYear, [Required] int endMonth, [Required] int endYear)
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
		public async Task<IActionResult> GetRevenue([Required] int startMonth, [Required] int startYear, [Required] int endMonth, [Required] int endYear, string? facilityId)
		{
			var data = await _dashboardService.GetRevenue(startMonth, startYear, endMonth, endYear, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("top-vaccines")]
		public async Task<IActionResult> GetTopVaccines(int topN, string? facilityId)
		{
			var data = await _dashboardService.GetTopVaccines(topN, facilityId);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}

		[HttpGet("top-facilities")]
		public async Task<IActionResult> GetTopVaccines(int topN)
		{
			var data = await _dashboardService.GetTopFacilitiesByRevenue(topN);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "",
				data: data
			));
		}


	}
}
