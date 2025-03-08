using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Mvc;

namespace ChildrenVaccinationSystem.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VaccineController : ControllerBase
    {
        private IVaccineService _vaccineService;
        public VaccineController(IVaccineService vaccineService)
        {
            _vaccineService = vaccineService;
        }

        [HttpGet]
        public async Task<IActionResult> GetVaccine(int pageNumber = -1, int pageSize = -1)
        {
            var vaccines = await _vaccineService.GetVaccinesAsync(pageNumber, pageSize);
            return Ok(BaseResponse<BasePaginatedList<Vaccine>>.OkResponse(vaccines));
        }

        [HttpPost]
        public async Task<IActionResult> AddVaccine([FromBody] VaccineCreateDto vaccineDto)
        {
            if (vaccineDto == null)
            {
                return BadRequest(BaseResponse<string>.ErrorResponse("Invalid vaccine data"));
            }

            var isCreated = await _vaccineService.CreateVaccineAsync(vaccineDto);

            if (!isCreated)
            {
                return StatusCode(500, BaseResponse<string>.ErrorResponse("Failed to create vaccine"));
            }

            return Ok(BaseResponse<string>.OkResponse("Vaccine created successfully"));
        }



        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateVaccine(string id, [FromBody] VaccineUpdateDto vaccineDto)
        {
            if (vaccineDto == null || id != vaccineDto.Id)
            {
                return BadRequest(BaseResponse<string>.ErrorResponse("Invalid vaccine data"));
            }

            var isUpdated = await _vaccineService.UpdateVaccineAsync(vaccineDto);

            if (!isUpdated)
            {
                return NotFound(BaseResponse<string>.ErrorResponse("Vaccine not found or update failed"));
            }

            return Ok(BaseResponse<string>.OkResponse("Vaccine updated successfully"));
        }


        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVaccine(string id)
        {
            if (string.IsNullOrWhiteSpace(id))
            {
                return BadRequest(BaseResponse<string>.ErrorResponse("Invalid vaccine ID"));
            }

            var isDeleted = await _vaccineService.DeleteVaccineAsync(id);

            if (!isDeleted)
            {
                return NotFound(BaseResponse<string>.ErrorResponse("Vaccine not found"));
            }

            return Ok(BaseResponse<string>.OkResponse("Vaccine deleted successfully"));
        }

    }

}
