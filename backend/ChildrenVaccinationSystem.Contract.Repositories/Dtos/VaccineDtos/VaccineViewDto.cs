using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ImageDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineInventoryDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos
{
	public class VaccineViewDto
	{
		public string Id { get; set; } = default!;
		public string Name { get; set; } = default!;
		public double Price { get; set; }
		public string? Description { get; set; }
		public int? StartRecommendedAge { get; set; }
		public int? EndRecommendedAge { get; set; }
		public int? Sequence { get; set; }
		public double? Dosage { get; set; }
		public int? DosageInterval { get; set; }
		public SimpleViewDto Category { get; set; } = default!;
		public SimpleViewDto Manufacturer { get; set; } = default!;
		public ICollection<ImageViewDto>? Images { get; set; }
		public ICollection<VaccineInventoryViewDto>? VaccineInventories { get; set; }
	}
}
