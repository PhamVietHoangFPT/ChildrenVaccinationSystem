using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
using ChildrenVaccinationSystem.Core.Enum;
namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class AccountViewDto
	{
		public string Id { get; set; } = default!;
		public string Name { get; set; } = default!;
		public DateOnly? DateOfBirth { get; set; }
		public string Email { get; set; } = default!;
		public string? PhoneNumber { get; set; }
		public string? Address { get; set; }
		public bool? Gender { get; set; }
		public string? Role { get; set; }
		public FacilityViewDto? Facility { get; set; }
		public ICollection<ChildViewDto>? Children { get; set; }
		public ICollection<SimpleViewDto>? DoctorVaccinations { get; set; }
		public ICollection<SimpleViewDto>? VaccinatorVaccinations { get; set; }
	}
}
