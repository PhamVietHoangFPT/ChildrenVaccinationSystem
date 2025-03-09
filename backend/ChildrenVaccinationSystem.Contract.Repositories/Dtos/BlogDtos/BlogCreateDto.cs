namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos
{
	public class BlogCreateDto
	{
		public string Title { get; set; } = default!;
		public string? Content { get; set; }
	}
}
