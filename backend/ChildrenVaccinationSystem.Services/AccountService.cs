using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static ChildrenVaccinationSystem.Core.Base.BaseException;

namespace ChildrenVaccinationSystem.Services
{
	public class AccountService : IAccountService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAuthenticationService _authenticationService;
		private readonly IConfiguration _config;
		private IChildService _childService;

		public AccountService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService, IConfiguration config, IChildService childService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
			_config = config;
			_childService = childService;
		}

		public async Task ForceUpdateAccountProfile(AccountForceUpdateDto accountForceUpdateDto)
		{
			Console.WriteLine(accountForceUpdateDto.Account.PhoneNumber);
			Account? existingAccount = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.PhoneNumber == accountForceUpdateDto.Account.PhoneNumber && a.DeletedBy == null).FirstOrDefaultAsync();
			if (existingAccount != null)
			{
				throw new ErrorException(409, "conflict", "Số điện thoại này đã được sử dụng, vui lòng thử lại");
			}

			string accountId = _authenticationService.GetCurrentAccountId();

			Account account = _unitOfWork.GetRepository<Account>().GetById(accountId)!;

			_mapper.Map(accountForceUpdateDto.Account, account);
			_authenticationService.UpdateAudits(account, false);

			Child child = new();
			_mapper.Map(accountForceUpdateDto.Child, child);

			child.ChildCode = _childService.GenerateChildCode();
			child.AccountId = accountId;
			_authenticationService.UpdateAudits(child, true);

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.GetRepository<Child>().InsertAsync(child);
			await _unitOfWork.SaveAsync();
		}

		public async Task IsValidForProfileUpdate()
		{
			string accountId = _authenticationService.GetCurrentAccountId();

			Account? account = await _unitOfWork.GetRepository<Account>().GetByIdAsync(accountId);
			if (account == null)
			{
				throw new ErrorException(401, "unauthorized", "Không tìm thấy account id");

			}

			if (account!.CreatedTime != account.LastUpdatedTime)
				throw new ErrorException(400, "bad_request", "Không thể cập nhật tài khoản!");
		}

		public async Task IsValidForEmailReset()
		{
			string accountId = _authenticationService.GetCurrentAccountId();

			Account? account = await _unitOfWork.GetRepository<Account>().GetByIdAsync(accountId);
			if (account == null)
			{
				throw new ErrorException(401, "unauthorized", "Không tìm thấy account id");

			}

			DateTime sixMonthsAgo = DateTime.UtcNow.AddMonths(-6);

			// Check if LastUpdatedTime is different from CreatedTime and within the last 6 months
			if (account.CreatedTime != account.EmailLastUpdatedTime && account.EmailLastUpdatedTime > sixMonthsAgo)
			{
				throw new ErrorException(400, "bad_request", "Không thể cập nhật tài khoản! Chưa đủ 6 tháng từ lần cập nhật trước.");
			}
		}

		public async Task<BasePaginatedList<AccountViewDto>> GetCustomerAccounts(string? phoneNumber, int pageNumber, int pageSize)
		{
			IQueryable<Account> query = _unitOfWork.GetRepository<Account>().Entities.Where(a => ((string.IsNullOrWhiteSpace(phoneNumber) || (!string.IsNullOrWhiteSpace(a.PhoneNumber) && a.PhoneNumber.StartsWith(phoneNumber)))) && a.Role == RoleEnum.Customer && a.VerificationToken == null && a.DeletedBy == null);

			BasePaginatedList<Account> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Account>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Account>().GetPaging(query, pageNumber, pageSize);

			List<AccountViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<AccountViewDto>).ToList();

			return new BasePaginatedList<AccountViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task CreateCustomerAccount(CustomerCreateDto customerCreateDto)
		{
			Account? existingAccount = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.PhoneNumber == customerCreateDto.PhoneNumber && a.DeletedBy == null).FirstOrDefaultAsync();

			if (existingAccount != null)
			{
				throw new ErrorException(409, "conflict", "Số điện thoại này đã được sử dụng, vui lòng thử lại");
			}

			Account account = new()
			{
				Password = BCrypt.Net.BCrypt.HashPassword(customerCreateDto.PhoneNumber),
				Role = RoleEnum.Customer,
			};

			_mapper.Map(customerCreateDto, account);

			_authenticationService.UpdateAudits(account, true);

			await _unitOfWork.GetRepository<Account>().InsertAsync(account);
			await _unitOfWork.SaveAsync();
		}


		public async Task<BasePaginatedList<object>> GetCustomerAccountsMinimal(string? phoneNumber, int pageNumber, int pageSize)
		{
			IQueryable<Account> query = _unitOfWork.GetRepository<Account>().Entities.Where(a => ((string.IsNullOrWhiteSpace(phoneNumber) || (!string.IsNullOrWhiteSpace(a.PhoneNumber) && a.PhoneNumber.StartsWith(phoneNumber)))) && a.Role == RoleEnum.Customer && a.VerificationToken == null && a.DeletedBy == null);

			BasePaginatedList<Account> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Account>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Account>().GetPaging(query, pageNumber, pageSize);

			var responseItems = resultQuery.Items.Select(a => new
			{
				a.Id,
				a.Name,
				a.PhoneNumber,
				a.Email,
				a.Gender
			}).ToList();
			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<AccountViewDto>> GetPersonnelAccounts(string? facilityId, RoleEnum? role, int pageNumber, int pageSize)
		{

			IQueryable<Account> query = _unitOfWork.GetRepository<Account>().Entities.Where(a => (a.Role == RoleEnum.Staff || a.Role == RoleEnum.Doctor || a.Role == RoleEnum.Vaccinator) && (facilityId == null || a.FacilityId == facilityId) && (role == null || a.Role == role) && a.DeletedBy == null);
			BasePaginatedList<Account> resultQuery = (pageNumber <= 0 || pageSize <= 0)
			? await _unitOfWork.GetRepository<Account>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Account>().GetPaging(query, pageNumber, pageSize);

			List<AccountViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<AccountViewDto>).ToList();

			return new BasePaginatedList<AccountViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<object>> GetPersonnelAccountsMinimal(string? facilityId, RoleEnum? role, int pageNumber, int pageSize)
		{
			IQueryable<Account> query = _unitOfWork.GetRepository<Account>().Entities.Where(a => (a.Role == RoleEnum.Staff || a.Role == RoleEnum.Doctor || a.Role == RoleEnum.Vaccinator) && (facilityId == null || a.FacilityId == facilityId) && (role == null || a.Role == role) && a.DeletedBy == null);

			BasePaginatedList<Account> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Account>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Account>().GetPaging(query, pageNumber, pageSize);

			var responseItems = resultQuery.Items.Select(a => new
			{
				a.Id,
				a.Name,
				a.PhoneNumber,
				a.Email,
				a.Gender,
				Role = a.Role.ToString(),
				Facility = new { a.Facility!.Name }
			}).ToList();
			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task CreatePersonnelAccount(PersonnelCreateDto personnelCreateDto)
		{

			Account? existingAccount = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.Email == personnelCreateDto.Email && a.DeletedBy == null).FirstOrDefaultAsync();

			if (existingAccount != null)
			{
				throw new BaseException.ErrorException(409, "conflict", "Email này đã được sử dụng, vui lòng thử lại");
			}

			if (personnelCreateDto.Role != RoleEnum.Staff && personnelCreateDto.Role != RoleEnum.Vaccinator && personnelCreateDto.Role != RoleEnum.Doctor)
				throw new ErrorException(404, "not_found", "Nhập sai role của nhân sự");
			if (!_unitOfWork.IsValid<Facility>(personnelCreateDto.FacilityId))
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");

			Account account = new();
			var hashedPassword = BCrypt.Net.BCrypt.HashPassword(_config["DefaultPassword"]);

			_mapper.Map(personnelCreateDto, account);
			account.Password = hashedPassword;
			_authenticationService.UpdateAudits(account, true);

			await _unitOfWork.GetRepository<Account>().InsertAsync(account);
			await _unitOfWork.SaveAsync();
		}


		public async Task UpdatePersonnelAccount(string id, PersonnelUpdateDto personnelUpdateDto)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.Id == id && a.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null || (account.Role != RoleEnum.Staff && account.Role != RoleEnum.Vaccinator && account.Role != RoleEnum.Doctor))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy account id");
			}

			if (personnelUpdateDto.Email != null && personnelUpdateDto.Email != account.Email)
			{
				Account? existingAccount = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.Email == personnelUpdateDto.Email && a.DeletedBy == null).FirstOrDefaultAsync();

				if (existingAccount != null)
				{
					throw new ErrorException(409, "conflict", "Email này đã được sử dụng, vui lòng thử lại");
				}
			}

			if (personnelUpdateDto.FacilityId != null && !_unitOfWork.IsValid<Facility>(personnelUpdateDto.FacilityId))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			}

			if (personnelUpdateDto.Role != null && personnelUpdateDto.Role != RoleEnum.Staff && personnelUpdateDto.Role != RoleEnum.Doctor && personnelUpdateDto.Role != RoleEnum.Vaccinator)
			{
				throw new ErrorException(400, "bad_request", "Role không hợp lệ");
			}

			_mapper.Map(personnelUpdateDto, account);

			if (personnelUpdateDto.IsResettingPassword)
			{
				var hashedPassword = BCrypt.Net.BCrypt.HashPassword(_config["DefaultPassword"]);

				account.Password = hashedPassword;
			}
			_authenticationService.UpdateAudits(account, false);

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.SaveAsync();
		}

		public async Task<AccountViewDto> GetAccountById(string id)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(c => c.Id == id && c.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null)
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy account id");

			return _mapper.Map<AccountViewDto>(account);
		}

		public async Task UpdateCustomerAccount(string id, CustomerUpdateDto customerUpdateDto)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.Id == id && a.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null)
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy account id");


			_mapper.Map(customerUpdateDto, account);

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.SaveAsync();

		}

		public async Task BgRemoveUnverifiedAccounts()
		{
			int minutes = 15;

			var expiredUnverifiedAccounts = _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.VerificationToken != null && a.CreatedTime <= DateTime.UtcNow.AddMinutes(-minutes))
				.ToList();

			foreach (var account in expiredUnverifiedAccounts)
			{
				await _unitOfWork.GetRepository<Account>().DeleteAsync(account);
			}
			await _unitOfWork.SaveAsync();
		}

		public async Task BgRemoveExpiredResetPasswordToken()
		{
			var expiredResetPasswordTokenAccounts = _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.ResetPasswordToken != null).ToList();

			foreach (var account in expiredResetPasswordTokenAccounts)
			{
				account.ResetPasswordToken = null;
			}
			await _unitOfWork.SaveAsync();
		}

		public async Task BgRemoveExpiredOTP()
		{
			int minutes = 15;

			var expiredOTPAccounts = _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.UpdateEmailOTP != null && a.EmailLastUpdatedTime <= DateTime.UtcNow.AddMinutes(-minutes)).ToList();

			foreach (var account in expiredOTPAccounts)
			{
				account.UpdateEmailOTP = null;
				account.TempUpdateEmail = null;
			}
			await _unitOfWork.SaveAsync();
		}
	}
}
