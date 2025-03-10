using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineInventoryDtos
{
	public class VaccineInventoryViewDto
	{
		public string Stock { get; set; } = default!;
		public DateOnly ImportedDate { get; set; } = default!;
		public DateOnly ExpiryDate { get; set; } = default!;
		public string BatchNumber { get; set; } = default!;
		public SimpleViewDto Facility { get; set; } = default!;
	}
}
