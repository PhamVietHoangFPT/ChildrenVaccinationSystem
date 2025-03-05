using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class CountryController : ControllerBase
	{
		private ICountryService _countryService;
		private IAuthenticationService _authenticationService;

		public CountryController(ICountryService countryService, IAuthenticationService authenticationService)
		{
			_countryService = countryService;
			_authenticationService = authenticationService;

        }
		[HttpGet]
		public async Task<IActionResult> GetCountries(int pageNumber = -1, int pageSize = -1)
		{
			var countries = await _countryService.GetCountriesAsync(pageNumber, pageSize);
			return Ok(BaseResponse<BasePaginatedList<Country>>.OkResponse(countries));
		}

	}
}
