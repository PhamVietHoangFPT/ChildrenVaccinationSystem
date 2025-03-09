using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class FacilitiesController : ControllerBase
	{
		private IFacilityService _countryService;

		public FacilitiesController(IFacilityService countryService)
		{
			_countryService = countryService;
		}

	}
}
