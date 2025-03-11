using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ImageDtos;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos
{
	public class BlogViewDto
	{
		public string Id { get; set; } = default!;
		public string Title { get; set; } = default!;
		public string? Content { get; set; }
		public ICollection<ImageViewDto>? Images;
	}
}
