using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class CustomerUpdateDto
	{
		public string? Name { get; set; }
		public DateOnly? DateOfBirth { get; set; }
		public string? PhoneNumber { get; set; }
		public string? Address { get; set; }
		public bool? Gender { get; set; }
	}
}
