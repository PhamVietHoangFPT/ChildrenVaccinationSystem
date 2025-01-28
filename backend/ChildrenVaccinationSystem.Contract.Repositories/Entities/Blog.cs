using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Blog : BaseEntity
	{
		public string Title { get; set; } = default!;
		public string? Content { get; set; }
		public virtual ICollection<Image>? Images { get; set; }
	}
}