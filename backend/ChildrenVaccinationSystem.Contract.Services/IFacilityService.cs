using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IFacilityService
	{
		Task<BasePaginatedList<FacilityViewDto>> GetFacilities(int pageNumber, int pageSize);
		Task<FacilityViewDto> GetFacilityById(string id);
		Task<object> GetFacilityInventory(string id);
		Task<object> GetFacilityBatches(string id);
		Task CreateFacility(FacilityCreateDto facilityCreateDto);
		Task UpdateFacility(string id, FacilityUpdateDto facilityUpdateDto);
		Task DeleteFacility(string id);
		Task ImportVaccines(FacilityImportDto facilityImportDto);
	}
}
