namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos
{
	public class VaccinationRegisterDto
	{
		public string FacilityId { get; set; } = default!;
		public string ChildId { get; set; } = default!;
		public List<string>? VaccineIds { get; set; }
		public string? PackageId { get; set; }
		
		public DateOnly Schedule { get; set; }
		public string VaccineId { get; set; } = default!;
		public int PaymentChoice {  get; set; } // 1. pay only the selected vaccine 2. pay everything 3. pay only the package
	}
}
