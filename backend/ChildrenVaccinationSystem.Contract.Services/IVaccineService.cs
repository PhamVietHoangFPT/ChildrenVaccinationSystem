using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
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
        Task<BasePaginatedList<VaccineViewDto>> GetVaccinesAsync(int pageNumber, int pageSize);

        Task CreateVaccineAsync(VaccineCreateDto vaccineCreateDto);

        Task UpdateVaccineAsync(string id, VaccineUpdateDto vaccineUpdateDto);
        Task DeleteVaccineAsync(string id);
    }
}
