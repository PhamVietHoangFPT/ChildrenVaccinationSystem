using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ChildrenController : ControllerBase
	{
		private readonly IChildService _childrenService;
		public ChildrenController(IChildService childrenService)
		{
			_childrenService = childrenService;
		}


	}
}
