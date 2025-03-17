using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageItemDtos
{
	public class PackageItemViewDto
	{
		public VaccineViewMiniDto Vaccine { get; set; } = default!;
	}

	public class VaccineViewMiniDto
	{
		public string Id { get; set; } = default!;
		public string Name { get; set; } = default!;
		public double Price { get; set; } = default!;
	}
}