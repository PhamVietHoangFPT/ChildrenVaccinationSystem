using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
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
		private readonly IAccountService _accountService;

		public AccountsController(IAccountService accountService)
		{
			_accountService = accountService;
		}

		[HttpPost("force-update")]
		public async Task<IActionResult> ForceUpdateAccountProfile(AccountForceUpdateDto accountForceUpdateDto)
		{
			await _accountService.ForceUpdateAccountProfile(accountForceUpdateDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật hồ sơ người dùng thành công",
				data: null
			));
		}


		[HttpGet("profile-update-valid")]
		public async Task<IActionResult> IsValidForProfileUpdate()
		{
			await _accountService.IsValidForProfileUpdate();

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Hợp lệ",
				data: null
			));
		}


		[HttpGet("email-reset-valid")]
		public async Task<IActionResult> IsValidForEmailReset()
		{
			await _accountService.IsValidForEmailReset();

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Hợp lệ",
				data: null
			));
		}

	}
}
