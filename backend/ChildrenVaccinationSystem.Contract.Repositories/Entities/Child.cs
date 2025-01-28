using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Child : BaseEntity
	{
		public string Name { get; set; } = default!;
		public string ChildCode { get; set; } = default!;
		public DateOnly? DateOfBirth { get; set; }
		public double? Height { get; set; }
		public double? Weight { get; set; }
		public bool? Gender { get; set; }

		public string AccountId { get; set; } = default!;
		public virtual Account Account { get; set; } = default!;
		public virtual ICollection<Vaccination>? Vaccinations { get; set; }
	}
}