using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageItemDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos
{
	public class PackageViewDto
	{
		public string Id { get; set; } = default!;
		public string Name { get; set; } = default!;
		public double Price { get; set; }
		public ICollection<PackageItemViewDto>? PackageItems { get; set; }
	}
}
