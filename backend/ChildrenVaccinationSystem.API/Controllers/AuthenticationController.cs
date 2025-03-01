using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class AuthenticationController : ControllerBase
	{
		private readonly IAuthenticationService _authenticationService;

		public AuthenticationController(IAuthenticationService authenticationService)
		{
			_authenticationService = authenticationService;
		}

		[HttpPost("login")]
		public async Task<IActionResult> LoginAsync([FromBody] LoginDto loginDto)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			// Authenticate and generate token
			string? token = await _authenticationService.LoginAsync(loginDto);
			if (token == null)
			{
				return BadRequest(ModelState);
			}
			return Ok(new { Token = token });
		}

	}
}
