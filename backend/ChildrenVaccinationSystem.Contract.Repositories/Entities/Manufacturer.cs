using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Manufacturer : BaseEntity
	{
		public string Name { get; set; } = null!;

		public string CountryId { get; set; } = null!;
		public virtual Country Country { get; set; } = null!;
		public virtual ICollection<Vaccine>? Vaccines { get; set; }
	}
}