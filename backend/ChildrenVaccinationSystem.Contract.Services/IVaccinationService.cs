using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.AspNetCore.Http;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IVaccinationService
	{
		Task<BasePaginatedList<VaccinationViewDto>> GetVaccinations(string? childId, string? childCode, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize);
		Task<BasePaginatedList<object>> GetVaccinationsMinimal(string? childId, string? childCode, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize);
		Task<string> RegisterVaccination(HttpContext context, VaccinationRegisterDto dto);
		Task UpdateVaccinationByStaff(string id, VaccinationUpdateDto dto);
		Task ShiftVaccinationStatus(string id, VaccinationStatusEnum status);
	}
}
