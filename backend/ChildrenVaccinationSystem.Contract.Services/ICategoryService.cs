using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface ICategoryService
	{
		Task<BasePaginatedList<CategoryViewDto>> GetCategories(int pageNumber, int pageSize);
		Task<CategoryViewDto> GetCategoryById(string id);
		Task CreateCategory(CategoryCreateDto blog);
		Task UpdateCategory(string id, CategoryUpdateDto blog);
		Task DeleteCategory(string id);

	}
}
