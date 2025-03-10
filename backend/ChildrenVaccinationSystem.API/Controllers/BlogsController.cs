using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class BlogsController : ControllerBase
	{
		private readonly IBlogService _blogService;

		public BlogsController(IBlogService blogService) 
		{
			_blogService = blogService;
		}

        [HttpGet]
        public async Task<IActionResult> GetBlogs(int pageNumber = -1, int pageSize = -1)
        {
            BasePaginatedList<BlogViewDto> blogs = await _blogService.GetBlogs(pageNumber, pageSize);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy blogs thành công",
                data: blogs
            ));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetBlogById(string id)
        {
            BlogViewDto blogs = await _blogService.GetBlogById(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy blog theo id thành công",
                data: blogs
            ));
	}

        [HttpPost]
        public async Task<IActionResult> AddBlog(BlogCreateDto blogDto)
        {
            await _blogService.CreateBlog(blogDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Tạo blog thành công",
                data: null
            ));
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateVaccine(string id, BlogUpdateDto blogDto)
        {
            await _blogService.UpdateBlog(id, blogDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Cập nhật blog thành công",
                data: null
            ));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBlog(string id)
        {
            await _blogService.DeleteBlog(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Xóa blog thành công",
                data: null
            ));
        }

    }

}
