using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
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
		Task ForceUpdateAccountProfile(AccountForceUpdateDto accountForceUpdateDto);
		Task IsValidForProfileUpdate();
		Task IsValidForEmailReset();

	}
}
