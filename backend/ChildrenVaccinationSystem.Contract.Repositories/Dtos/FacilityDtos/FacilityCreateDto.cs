namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos
{
	public class FacilityCreateDto
	{
		public string? Name { get; set; }
		public string Address { get; set; } = default!;
	}
}
