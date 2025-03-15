namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDetailDtos
{
	public class VaccinationDetailViewDto
	{
		public SimpleViewDto Product{ get; set; } = default!;
		public string Type { get; set; } = default!;
	}
}
