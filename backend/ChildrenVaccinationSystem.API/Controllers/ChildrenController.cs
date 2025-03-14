using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ChildrenController : ControllerBase
	{
		private readonly IChildService _childService;

		public ChildrenController(IChildService childService)
		{
			_childService = childService;
		}

		[HttpGet]
		public async Task<IActionResult> GetChildren(string? parentId, string? name, string? parentPhoneNumber, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<ChildViewDto> children = await _childService.GetChildren(parentId, name, parentPhoneNumber, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy children thành công",
				data: children
			));
		}

		[HttpGet("minimal")]
		public async Task<IActionResult> GetChildrenMinimal(string? parentId, string? name,string? parentPhoneNumber, int pageNumber = -1, int pageSize = -1)
		{
			BasePaginatedList<object> children = await _childService.GetChildrenMinimal(parentId, name, parentPhoneNumber, pageNumber, pageSize);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy children thành công",
				data: children
			));
		}

		[HttpGet("{id}")]
		public async Task<IActionResult> GetChildByCode(string id)
		{
			ChildViewDto child = await _childService.GetChildById(id);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Lấy child thành công",
				data: child
			));
		}


		[HttpPost]
		public async Task<IActionResult> AddChildProfile(string parentId, ChildCreateDto childCreateDto)
		{
			await _childService.AddChildProfile(parentId, childCreateDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Thêm child profile thành công",
				data: null
			));
		}

		[HttpPut("{id}")]
		public async Task<IActionResult> UpdateChildProfile(string id, ChildUpdateDto childUpdateDto)
		{
			await _childService.UpdateChildProfile(id, childUpdateDto);

			return Ok(new BaseResponse<object>(
				statusCode: StatusCodeEnum.OK,
				code: StatusCodeEnum.OK.ToString(),
				message: "Cập nhật child profile thành công",
				data: null
			));
		}


	}
}
