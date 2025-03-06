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
        Task<BasePaginatedList<Vaccine>> GetVaccinesAsync(int pageNumber, int pageSize);

        Task<bool> CreateVaccineAsync(VaccineCreateDto vaccineCreateDto);

        Task<bool> UpdateVaccineAsync(VaccineUpdateDto vaccineUpdateDto);
        Task<bool> DeleteVaccineAsync(string id);

    }
}
