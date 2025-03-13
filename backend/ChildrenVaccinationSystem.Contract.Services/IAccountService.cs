using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IAccountService
	{
		Task ForceUpdateAccountProfile(AccountForceUpdateDto accountForceUpdateDto);
		Task IsValidForProfileUpdate();
		Task IsValidForEmailReset();
	}
}
