using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
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
		private IChildService _childService;

		public AccountService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService, IChildService childService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
			_childService = childService;
		}

		public async Task ForceUpdateAccountProfile(AccountForceUpdateDto accountForceUpdateDto)
		{
			string accountId = _authenticationService.GetCurrentAccountId();

			Account account = _unitOfWork.GetRepository<Account>().GetById(accountId)!;

			_mapper.Map(accountForceUpdateDto.Account, account);
			_authenticationService.UpdateAudits(account, false);

			Child child = new();
			_mapper.Map(accountForceUpdateDto.Child, child);

			child.ChildCode = _childService.GenerateChildCode();
			child.AccountId = accountId;

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

			foreach(var account in expiredResetPasswordTokenAccounts)
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
