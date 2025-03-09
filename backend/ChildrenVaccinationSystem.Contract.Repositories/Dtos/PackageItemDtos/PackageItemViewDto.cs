namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageItemDtos
{
	public class PackageItemViewDto
	{
		public SimpleViewDto Package { get; set; } = default!;
		public SimpleViewDto Vaccine { get; set; } = default!;

	}
}
