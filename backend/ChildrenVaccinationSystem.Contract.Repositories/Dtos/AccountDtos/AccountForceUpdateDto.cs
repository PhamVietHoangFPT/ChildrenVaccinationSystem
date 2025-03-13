#nullable disable
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class AccountForceUpdateDto
	{
		public AccountUpdateDto Account { get; set; }
		public ChildCreateDto  Child { get; set; }

	}
}
