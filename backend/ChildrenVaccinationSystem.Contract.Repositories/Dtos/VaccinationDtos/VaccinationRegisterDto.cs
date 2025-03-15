namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos
{
	public class VaccinationRegisterDto
	{
		public string FacilityId { get; set; } = default!;
		public string ChildId { get; set; } = default!;
		public List<string>? Vaccines { get; set; }
		public List<string>? Packages { get; set; }
		
		public DateOnly Schedule { get; set; }
		public string VaccineId { get; set; } = default!;
		public int PaymentChoice {  get; set; }
	}
}
