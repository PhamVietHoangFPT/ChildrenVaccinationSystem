using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Package : BaseEntity
	{
		public string Name { get; set; } = default!;
		public double Price { get; set; } = 0;
		public int Order { get; set; } = 0;
		public virtual ICollection<PackageItem>? PackageItems { get; set; }
	}
}