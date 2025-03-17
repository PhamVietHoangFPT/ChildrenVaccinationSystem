using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class AccountUpdateDto
	{
		public DateOnly DateOfBirth { get; set; }
		public string PhoneNumber { get; set; } = default!;
		public string Address { get; set; } = default!;
		public bool Gender { get; set; }
	}
}
