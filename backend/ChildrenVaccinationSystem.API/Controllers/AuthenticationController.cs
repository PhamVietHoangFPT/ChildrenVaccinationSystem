using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
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
		public async Task<IActionResult> Login(LoginDto loginDto)
		{
			string token = await _authenticationService.Login(loginDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Đăng nhập thành công",
				data: token
			));
		}

		[HttpPost("register")]
		public async Task<IActionResult> Register(RegisterDto registerDto)
		{
			await _authenticationService.Register(registerDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Đăng ký thành công, bạn vui lòng kiểm tra mail để xác nhận tài khoản",
				data: null
			));
		}

		[HttpGet("verify-account")]
		public async Task<IActionResult> VerifyAccount(string token)
		{
			bool result = await _authenticationService.VerifyAccount(token);

			if (!result)
			{
				return BadRequest(new BaseResponse<string>(
					statusCode: StatusCodeEnum.BadRequest,
					code: StatusCodeEnum.BadRequest.ToString(),
					message: "Fail to verify your account",
					data: null
				));
			}
			return Redirect(_configuration["ProductWeb"]+"/login");
		}

		[HttpPost("forget-password")]
		public async Task<IActionResult> Register(string email)
		{
			await _authenticationService.ForgetPassword(email);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Khách hàng vui lòng kiểm tra email và làm theo hướng dẫn để khôi phục tài khoản",
				data: null
			));
		}

		[HttpGet("verify-reset-password")]
		public async Task<IActionResult> VerifyResetPassowrd(string token)
		{
			await _authenticationService.VerifyResetPassowrd(token);

			return Redirect(_configuration["VerifySuccessUrl"]!);
		}

		[HttpPost("reset-password")]
		public async Task<IActionResult> ResetPassword(string token, string newPassword)
		{
			await _authenticationService.ResetPassword(token, newPassword);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Thay đổi mật khẩu thành công",
				data: null
			));
		}


		[HttpPost("update-password")]
		public async Task<IActionResult> UpdatePassword(string password, string newPassword)
		{
			await _authenticationService.UpdatePassword(password, newPassword);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Thay đổi mật khẩu thành công",
				data: null
			));
		}

		[HttpPost("update-email")]
		public async Task<IActionResult> UpdateEmail(string newEmail)
		{
			await _authenticationService.UpdateEmail(newEmail);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Khách hàng vui lòng kiểm tra email và làm theo hướng dẫn để xác thực email mới",
				data: null
			));
		}

		[HttpPost("confirm-update-email")]
		public async Task<IActionResult> ConfirmUpdateEmail(string otp)
		{
			await _authenticationService.ConfirmUpdateEmail(otp);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật email mới thành công",
				data: null
			));
		}

	}
}