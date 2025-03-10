using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface ICategoryService
	{
		Task<BasePaginatedList<CategoryViewDto>> GetCategories(int pageNumber, int pageSize);
		Task<CategoryViewDto> GetCategoryById(string id);
		Task CreateCategory(CategoryCreateDto categoryCreateDto);
		Task UpdateCategory(string id, CategoryUpdateDto categoryUpdateDto);
		Task DeleteCategory(string id);

	}
}
