using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Vaccine : BaseEntity
	{
		public string Name { get; set; } = default!;
		public double Price { get; set; }
		public string? Description { get; set; }
		public int? StartRecommendedAge { get; set; }
		public int? EndRecommendedAge { get; set; }
		public int? Sequence { get; set; }
		public double? Dosage { get; set; } // mililitres
		public int? DosageInterval { get; set; } // months

		public string CategoryId { get; set; } = default!;
		public virtual Category Category { get; set;} = default!;
		public string ManufacturerId { get; set; } = default!;
		public virtual Manufacturer Manufacturer { get; set; } = default!;
		public virtual ICollection<Image>? Images { get; set; }
		public virtual ICollection<PackageItem>? PackageItems { get; set; }
		public virtual ICollection<VaccinationDetail>? VaccinationDetails { get; set; }
		public virtual ICollection<VaccineInventory>? VaccineInventories { get; set; }
	}
}