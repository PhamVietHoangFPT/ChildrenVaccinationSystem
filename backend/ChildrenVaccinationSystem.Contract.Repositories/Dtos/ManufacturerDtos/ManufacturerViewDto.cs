using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CountryDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos
{
	public class ManufacturerViewDto
	{

		public string Id { get; set; } = default!;
		public string Name { get; set; } = default!;
		public CountryViewDto Country { get; set; } = default!;

	}
}
