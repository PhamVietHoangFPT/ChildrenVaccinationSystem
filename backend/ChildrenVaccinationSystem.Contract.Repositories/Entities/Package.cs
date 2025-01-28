using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Package : BaseEntity
	{
		public string Name { get; set; } = default!;
		public double Price { get; set; }
		public virtual ICollection<PackageItem>? PackageItems { get; set; }
		public virtual ICollection<VaccinationDetail>? VaccinationDetails { get; set; }
	}
}