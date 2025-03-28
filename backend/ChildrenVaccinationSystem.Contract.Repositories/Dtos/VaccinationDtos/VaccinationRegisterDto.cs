using System.ComponentModel.DataAnnotations;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos
{
	public class VaccinationRegisterDto
	{
		public string FacilityId { get; set; } = default!;
		[Required]
		public string ChildId { get; set; } = default!;
		public List<string>? VaccineIds { get; set; }
		public string? PackageId { get; set; }
		[Required]
		public DateOnly Schedule { get; set; }
		[Required]
		public string VaccineId { get; set; } = default!;
		[Required]
		public int PaymentChoice {  get; set; } // 1. pay only the selected vaccine 2. pay everything 3. pay only the package
	}
}
