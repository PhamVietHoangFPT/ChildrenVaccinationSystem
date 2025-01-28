using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Account : BaseEntity
	{
		public string Name { get; set; } = default!;
		public DateOnly? DateOfBirth { get; set; }
		public string Email { get; set; } = default!;
		public string Password { get; set; } = default!;
		public string? PhoneNumber { get; set; }
		public string? Address { get; set; }
		public bool? Gender { get; set; }
		public RoleEnum Role { get; set; }

		public virtual ICollection<Child>? Children { get; set; }
		public virtual ICollection<Vaccination>? DoctorVaccinations { get; set; }
		public virtual ICollection<Vaccination>? VaccinatorVaccinations { get; set; }

	}
}