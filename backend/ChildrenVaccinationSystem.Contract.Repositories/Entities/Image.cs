using ChildrenVaccinationSystem.Core.Base;
using System.ComponentModel.DataAnnotations;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Image
	{
		[Key]
		public string ImageSource { get; set; } = default!;

		public string? BlogId { get; set; }
		public virtual Blog? Blog { get; set; }
		public string? VaccineId { get; set; }
		public virtual Vaccine? Vaccine { get; set; }
	}
}