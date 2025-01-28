using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Image : BaseEntity
	{
		public string ImageSource { get; set; } = default!;

		public string? BlogId { get; set; }
		public virtual Blog? Blog { get; set; }
		public string? VaccineId { get; set; }
		public virtual Vaccine? Vaccine { get; set; }
	}
}