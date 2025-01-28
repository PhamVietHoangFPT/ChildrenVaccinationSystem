namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class VaccinationDetail
	{
		public string? VaccineId { get; set; }
		public virtual Vaccine? Vaccine { get; set; }
		public string? PackageId { get; set; }
		public virtual Package? Package { get; set; }
		public string VaccinationId { get; set; } = default!;
		public virtual Vaccination Vaccination { get; set; } = default!;
	}
}