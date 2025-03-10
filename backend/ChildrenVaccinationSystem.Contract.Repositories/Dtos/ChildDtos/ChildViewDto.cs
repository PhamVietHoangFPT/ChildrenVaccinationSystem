namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos
{
	public class ChildViewDto
	{
		public string Id { get; set; } = default!;
		public string Name { get; set; } = default!;
		public string ChildCode { get; set; } = default!;
		public DateOnly? DateOfBirth { get; set; }
		public double? Height { get; set; }
		public double? Weight { get; set; }
		public bool? Gender { get; set; }
		public string? MedicalNote { get; set; }

		public SimpleViewDto Account { get; set; } = default!;
		public ICollection<SimpleViewDto>? Vaccinations { get; set; }
	}
}
