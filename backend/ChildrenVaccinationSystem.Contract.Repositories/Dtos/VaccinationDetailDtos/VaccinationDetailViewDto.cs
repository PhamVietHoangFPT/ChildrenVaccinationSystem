namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDetailDtos
{
	public class VaccinationDetailViewDto
	{
		public SimpleViewDto Vaccine { get; set; } = default!;
		public SimpleViewDto Package { get; set; } = default!;
		public SimpleViewDto Vaccination { get; set; } = default!;
	}
}
