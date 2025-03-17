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


		[HttpGet("customer")]
		public async Task<IActionResult> GetCustomerAccounts(string? phoneNumber, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<AccountViewDto> accounts = await _accountService.GetCustomerAccounts(phoneNumber, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy thông tin ba/mẹ thành công",
				data: accounts
			));
		}

		[HttpPost("customer")]
		public async Task<IActionResult> CreateCustomerAccount(CustomerCreateDto customerCreateDto)
		{
			await _accountService.CreateCustomerAccount(customerCreateDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Tạo tài khoản thành công",
				data: null
			));
		}


		[HttpPut("customer/{id}")]
		public async Task<IActionResult> UpdateCustomerAccount(string id, CustomerUpdateDto customerUpdateDto)
		{
			await _accountService.UpdateCustomerAccount(id, customerUpdateDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật thông tin ba/mẹ thành công",
				data: null
			));
		}

		[HttpGet("customer/minimal")]
		public async Task<IActionResult> GetCustomerAccountsMinimal(string? phoneNumber, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<object> accounts = await _accountService.GetCustomerAccountsMinimal(phoneNumber, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy thông tin ba/mẹ thành công",
				data: accounts
			));
		}

		[HttpGet("personnel")]
		public async Task<IActionResult> GetPersonnelAccounts(int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<AccountViewDto> accounts = await _accountService.GetPersonnelAccounts(pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy thông tin nhân sự thành công",
				data: accounts
			));
		}

		[HttpGet("personnel/minimal")]
		public async Task<IActionResult> GetPersonnelAccountsMinimal(int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<object> accounts = await _accountService.GetPersonnelAccountsMinimal(pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy thông tin nhân sự thành công",
				data: accounts
			));
		}

		[HttpPost("personnel")]
		public async Task<IActionResult> CreatePersonnelAccount(PersonnelCreateDto personnelCreateDto)
		{
			await _accountService.CreatePersonnelAccount(personnelCreateDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Tạo nhân sự thành công",
				data: null
			));
		}

		[HttpPut("personnel")]
		public async Task<IActionResult> UpdatePersonnelAccount(string id, PersonnelUpdateDto personnelUpdateDto)
		{
			await _accountService.UpdatePersonnelAccount(id, personnelUpdateDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật nhân sự thành công",
				data: null
			));
		}

		[HttpGet("{id}")]
		public async Task<IActionResult> GetAccountById(string id)
		{
			AccountViewDto account = await _accountService.GetAccountById(id);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy thông tin tài khoản thành công",
				data: account
			));
		}
	}
}
