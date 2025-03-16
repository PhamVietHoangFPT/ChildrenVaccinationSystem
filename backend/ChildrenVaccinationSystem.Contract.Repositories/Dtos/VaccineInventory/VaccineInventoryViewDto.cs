using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineInventoryDtos
{
	public class VaccineInventoryViewDto
	{
		public int Stock { get; set; } = default!;
		public DateOnly ImportedDate { get; set; } = default!;
		public DateOnly ExpiryDate { get; set; } = default!;
		public string BatchNumber { get; set; } = default!;
		public FacilityViewDto Facility { get; set; } = default!;
	}
}
