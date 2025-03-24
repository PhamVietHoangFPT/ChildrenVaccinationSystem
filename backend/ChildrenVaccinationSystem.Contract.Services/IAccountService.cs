using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IAccountService
	{
		Task<BasePaginatedList<AccountViewDto>> GetCustomerAccounts(string? phoneNumber, int pageNumber, int pageSize);
		Task<BasePaginatedList<object>> GetCustomerAccountsMinimal(string? phoneNumber, int pageNumber, int pageSize);
		Task<BasePaginatedList<AccountViewDto>> GetPersonnelAccounts(string? facilityId, RoleEnum? role, int pageNumber, int pageSize);
		Task<BasePaginatedList<object>> GetPersonnelAccountsMinimal(string? facilityId, RoleEnum? role, int pageNumber, int pageSize);
		Task CreatePersonnelAccount(PersonnelCreateDto personnelCreateDto);
		Task UpdatePersonnelAccount(string id, PersonnelUpdateDto personnelUpdateDto);
		Task<AccountViewDto> GetAccountById(string id);
		Task CreateCustomerAccount(CustomerCreateDto customerCreateDto);
		Task UpdateCustomerAccount(string id, CustomerUpdateDto customerUpdateDto);
		Task ForceUpdateAccountProfile(AccountForceUpdateDto accountForceUpdateDto);
		Task IsValidForProfileUpdate();
		Task IsValidForEmailReset();
		Task BgRemoveUnverifiedAccounts();
		Task BgRemoveExpiredResetPasswordToken();
		Task BgRemoveExpiredOTP();
	}
}
