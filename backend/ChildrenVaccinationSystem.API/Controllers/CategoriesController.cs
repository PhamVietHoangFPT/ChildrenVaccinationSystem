using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class CategoriesController : ControllerBase
	{
		private readonly ICategoryService _categoryService;

		public CategoriesController(ICategoryService categoryService) 
		{
			_categoryService = categoryService;
		}

        [HttpGet]
        public async Task<IActionResult> GetCategories(int pageNumber = -1, int pageSize = -1)
        {
            BasePaginatedList<CategoryViewDto> categories = await _categoryService.GetCategories(pageNumber, pageSize);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy danh mục thành công",
                data: categories
            ));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetCategoryById(string id)
        {
            CategoryViewDto category = await _categoryService.GetCategoryById(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy danh mục thành công",
                data: category
            ));
        }

        [HttpPost]
        public async Task<IActionResult> AddCategory(CategoryCreateDto categoryDto)
        {
            await _categoryService.CreateCategory(categoryDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Thêm danh mục thành công",
                data: null
            ));
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateCategory(string id, CategoryUpdateDto categoryDto)
        {
            await _categoryService.UpdateCategory(id, categoryDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Cập nhật danh mục thành công",
                data: null
            ));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCategory(string id)
        {
            await _categoryService.DeleteCategory(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Xóa danh mục thành công",
                data: null
            ));
        }

	}
}
