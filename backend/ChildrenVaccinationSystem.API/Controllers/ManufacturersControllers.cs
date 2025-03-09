using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ManufacturersControllers : ControllerBase
	{
		private readonly IManufacturerService _manufacturerService;

		public ManufacturersControllers(IManufacturerService manufacturerService)
		{
			_manufacturerService = manufacturerService;
		}
	}
}
