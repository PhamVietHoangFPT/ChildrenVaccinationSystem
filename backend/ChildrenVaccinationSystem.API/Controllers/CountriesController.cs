using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class CountriesController : ControllerBase
	{
		private ICountryService _countryService;
		private IAccountService _authenticationService;

		public CountriesController(ICountryService countryService, IAccountService authenticationService)
		{
			_countryService = countryService;
			_authenticationService = authenticationService;

        }
		[HttpGet]
		public async Task<IActionResult> GetCountries(int pageNumber = -1, int pageSize = -1)
		{
			var countries = await _countryService.GetCountriesAsync(pageNumber, pageSize);
			return Ok(countries);
		}

	}
}
