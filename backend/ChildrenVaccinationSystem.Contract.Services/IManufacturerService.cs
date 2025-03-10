using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IManufacturerService
	{
		Task<BasePaginatedList<ManufacturerViewDto>> GetManufacturers(int pageNumber, int pageSize);
		Task<ManufacturerViewDto> GetManufacturerById(string id);
		Task CreateManufacturer(ManufacturerCreateDto blog);
		Task UpdateManufacturer(string id, ManufacturerUpdateDto blog);
		Task DeleteManufacturer(string id);
	}
}
