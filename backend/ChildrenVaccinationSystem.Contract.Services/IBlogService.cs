using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IBlogService
	{
		Task<BasePaginatedList<BlogViewDto>> GetBlogs(int pageNumber, int pageSize);
		Task<BlogViewDto> GetBlogById(string id);
		Task CreateBlog(BlogCreateDto blog);
		Task UpdateBlog(string id, BlogUpdateDto blog);
		Task DeleteBlog(string id);
	}
}
