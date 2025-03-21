using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageItemDtos
{
	public class PackageItemViewDto
	{
		public VaccineViewMiniDto Vaccine { get; set; } = default!;
	}
}