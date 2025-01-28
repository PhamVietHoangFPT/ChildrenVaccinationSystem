namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class PackageItem
	{
		public string PackageId { get; set; } = default!;
		public virtual Package Package { get; set; } = default!;
		public string VaccineId { get; set; } = default!;
		public virtual Vaccine Vaccine { get; set; } = default!;
	}
}