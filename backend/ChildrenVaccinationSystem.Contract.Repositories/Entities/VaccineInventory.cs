namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class VaccineInventory
	{
		public int Stock {  get; set; }
		public DateOnly ImportedDate { get; set; }
		public DateOnly ExpiryDate { get; set; }

		public string BatchNumber { get; set; } = default!;
		public string FacilityId { get; set; } = default!;
		public virtual Facility Facility { get; set; } = default!;
		public string VaccineId { get; set; } = default!;
		public virtual Vaccine Vaccine { get; set; } = default!;

	}
}
