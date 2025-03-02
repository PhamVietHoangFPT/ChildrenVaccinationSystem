using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class AuthenticationController : ControllerBase
	{
		private readonly IAuthenticationService _authenticationService;
		private readonly IEmailService _emailService;
		public AuthenticationController(IAuthenticationService authenticationService, IEmailService emailService)
		{
			_authenticationService = authenticationService;
			_emailService = emailService;
		}

		[HttpPost("login")]
		public async Task<IActionResult> LoginAsync(LoginDto loginDto)
		{
			string? token = await _authenticationService.LoginAsync(loginDto);

			if (token == null)
			{
				return BadRequest(new BaseResponse<string>(
					statusCode: StatusCodeEnum.BadRequest,
					code: StatusCodeEnum.BadRequest.ToString(),
					message: "Log in unsuccessfully",
					data: null
				));
			}

			return Ok(new BaseResponse<string>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Log in successfully",
				data: token
			));
		}

		[HttpPost("register")]
		public async Task<IActionResult> RegisterAsync(RegisterDto registerDto)
		{
			bool result = await _authenticationService.RegisterAsync(registerDto);

			if (!result)
			{
				return BadRequest(new BaseResponse<string>(
					statusCode: StatusCodeEnum.BadRequest,
					code: StatusCodeEnum.BadRequest.ToString(),
					message: "Register unsuccessfully, the email or phone number you provided already exists",
					data: null
				));
			}

			return Ok(new BaseResponse<string>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Register successfully, please check email to confirm",
				data: null
			));
		}

		[HttpGet("verify-account")]
		public async Task<IActionResult> VerifyAccountAsync(string token)
		{
			bool result = await _authenticationService.VerifyAccountAsync(token);

			if (!result)
			{
				return BadRequest(new BaseResponse<string>(
					statusCode: StatusCodeEnum.BadRequest,
					code: StatusCodeEnum.BadRequest.ToString(),
					message: "Fail to verify your account",
					data: null
				));
			}

			return Ok(new BaseResponse<string>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Your account has been verified",
				data: null
			));
		}
	}
}