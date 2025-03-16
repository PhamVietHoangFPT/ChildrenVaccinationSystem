using ChildrenVaccinationSystem.Core.Enum;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class PersonnelUpdateDto
	{
		public string? Name { get; set; }
		public DateOnly? DateOfBirth { get; set; }
		public string? Email { get; set; }
		public bool? Gender { get; set; }
		public string? FacilityId { get; set; }
		public RoleEnum? Role { get; set; }
		public bool IsResettingPassword { get; set; }
	}
}
