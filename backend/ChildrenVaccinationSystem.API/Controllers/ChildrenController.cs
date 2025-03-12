using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ChildrenController : ControllerBase
	{
		private readonly IChildService _childService;

		public ChildrenController(IChildService childService)
		{
			_childService = childService;
		}
	}
}
