namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos
{
	public class VaccineUpdateDto
	{
		public string Name { get; set; } = default!;
		public double Price { get; set; }
		public string? Description { get; set; }
		public int? StartRecommendedAge { get; set; }
		public int? EndRecommendedAge { get; set; }
		public int? Sequence { get; set; }
		public double? Dosage { get; set; } // mililitres
		public int? DosageInterval { get; set; } // months
		public string CategoryId { get; set; } = default!;
		public string ManufacturerId { get; set; } = default!;
	}
}
