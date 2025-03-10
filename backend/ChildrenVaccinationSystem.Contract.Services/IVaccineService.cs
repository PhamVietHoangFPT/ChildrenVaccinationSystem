using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IVaccineService
    {
        Task<BasePaginatedList<VaccineViewDto>> GetVaccines(int pageNumber, int pageSize);
        Task<VaccineViewDto> GetVaccineById(string id);

        Task CreateVaccine(VaccineCreateDto vaccineCreateDto);

        Task UpdateVaccine(string id, VaccineUpdateDto vaccineUpdateDto);
        Task DeleteVaccine(string id);
    }
}