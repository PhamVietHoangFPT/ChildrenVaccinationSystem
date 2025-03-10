using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class AccountsController : ControllerBase
	{
		private readonly IAccountService _authenticationService;
		private readonly IConfiguration _configuration;
		public AccountsController(IAccountService authenticationService, IConfiguration configuration)
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
			return Redirect(_configuration["VerifySuccessUrl"]!);
		}
	}
}