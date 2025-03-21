namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos
{
	public class VaccineViewMiniDto
	{
		public string Id { get; set; } = default!;
		public string Name { get; set; } = default!;
		public double Price { get; set; } = default!;
	}
}