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
		private readonly IConfiguration _configuration;
		public AuthenticationController(IAuthenticationService authenticationService, IConfiguration configuration)
		{
			_authenticationService = authenticationService;
			_configuration = configuration;
		}

		[HttpPost("login")]
		public async Task<IActionResult> LoginAsync(LoginDto loginDto)
		{
			string? token = await _authenticationService.LoginAsync(loginDto);

			if (token == "Unauthenticated")
			{
				return BadRequest(new BaseResponse<string>(
					statusCode: StatusCodeEnum.BadRequest,
					code: StatusCodeEnum.BadRequest.ToString(),
					message: "Sai mật khẩu hoặc tài khoản!",
					data: null
				));
			}

			if (token == "Unverified")
			{
				return BadRequest(new BaseResponse<string>(
					statusCode: StatusCodeEnum.BadRequest,
					code: StatusCodeEnum.BadRequest.ToString(),
					message: "Tài khoản chưa được xác thực, khách hàng vui lòng kiểm tra hộp mail!",
					data: null
				));
			}

			return Ok(new BaseResponse<string>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Đăng nhập thành công",
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

			//return Ok(new BaseResponse<string>(
			//	statusCode: StatusCodeEnum.OK,
			//	code: StatusCodeEnum.OK.ToString(),
			//	message: "Your account has been verified",
			//	data: null
			//));
			return Redirect(_configuration["VerifySuccessUrl"]!);
		}
	}
}