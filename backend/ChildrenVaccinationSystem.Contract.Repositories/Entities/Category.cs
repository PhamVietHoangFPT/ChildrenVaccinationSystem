using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Category : BaseEntity
	{
		public string Name { get; set; } = default!;
		public virtual ICollection<Vaccine>? Vaccines { get; set; }
	}
}