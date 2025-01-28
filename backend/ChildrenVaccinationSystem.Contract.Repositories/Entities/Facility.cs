using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Facility : BaseEntity
	{
		public string? Name { get; set; }
		public string Address { get; set; } = default!;
		public virtual ICollection<VaccineInventory>? VaccineInventories { get; set; }
	}
}