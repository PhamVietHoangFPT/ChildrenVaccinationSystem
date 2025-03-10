using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FacilitiesController : ControllerBase
    {
        private IFacilityService _facilityService;
        public FacilitiesController(IFacilityService facilityService)
        {
            _facilityService = facilityService;
        }

        [HttpGet]
        public async Task<IActionResult> GetFacilities(int pageNumber = -1, int pageSize = -1)
        {
            BasePaginatedList<FacilityViewDto> facilities = await _facilityService.GetFacilities(pageNumber, pageSize);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy Facility thành công",
                data: facilities
            ));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetFacilityById(string id)
        {
            FacilityViewDto facilitíe = await _facilityService.GetFacilityById(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Lấy Facility thành công",
                data: facilitíe
            ));
        }

        [HttpPost]
        public async Task<IActionResult> AddFacility(FacilityCreateDto facilityDto)
        {
            await _facilityService.CreateFacility(facilityDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Thêm Facility thành công",
                data: null
            ));
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateFacility(string id, FacilityUpdateDto facilityDto)
        {
            await _facilityService.UpdateFacility(id, facilityDto);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Cập nhật Facility thành công",
                data: null
            ));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFacility(string id)
        {
            await _facilityService.DeleteFacility(id);

            return Ok(new BaseResponse<object>(
                statusCode: StatusCodeEnum.OK,
                code: StatusCodeEnum.OK.ToString(),
                message: "Xóa Facility thành công",
                data: null
            ));
        }
    }
}
