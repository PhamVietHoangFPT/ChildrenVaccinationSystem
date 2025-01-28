using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Country : BaseEntity
	{
		public string Code { get; set; } = default!;
		public string Name { get; set; } = default!;
		public virtual ICollection<Manufacturer>? Manufacturers { get; set; }
	}
}