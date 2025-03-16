using ChildrenVaccinationSystem.Core.Enum;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class PersonnelCreateDto
	{
		public string Name { get; set; } = default!;
		public DateOnly DateOfBirth { get; set; }
		public string Email { get; set; } = default!;
		public bool Gender { get; set; } = default;
		public string FacilityId { get; set; } = default!;
		public RoleEnum Role { get; set; }

	}
}
