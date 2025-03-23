namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos
{
	public class FacilityImportDto
	{
		public string FacilityId { get; set; } = default!;
		public List<VaccineImport> VaccineImports { get; set; } = default!;

	}
}
