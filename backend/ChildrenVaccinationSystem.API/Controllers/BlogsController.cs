using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class BlogsController : ControllerBase
	{
		private readonly IBlogService _blogService;

		public BlogsController(IBlogService blogService) 
		{
			_blogService = blogService;
		}
	}
}
