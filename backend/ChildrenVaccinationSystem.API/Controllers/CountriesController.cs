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
	public class CountriesController : ControllerBase
	{
		private ICountryService _countryService;

		public CountriesController(ICountryService countryService)
		{
			_countryService = countryService;
        }

		[HttpGet]
		public async Task<IActionResult> GetCountries(int pageNumber = -1, int pageSize = -1)
		{
			var countries = await _countryService.GetCountries(pageNumber, pageSize);
			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy countries thành công",
				data: countries
			));
		}

		[HttpGet("manufacturer")]
		public async Task<IActionResult> GetManufacturerCountries(int pageNumber = -1, int pageSize = -1)
		{
			var countries = await _countryService.GetManufacturerCountries(pageNumber, pageSize);
			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy countries thành công",
				data: countries
			));
		}

	}
}
