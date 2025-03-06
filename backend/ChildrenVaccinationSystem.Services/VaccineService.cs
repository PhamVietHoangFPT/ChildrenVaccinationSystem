using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
    public class VaccineService : IVaccineService
    {
        private readonly IUnitOfWork _unitOfWork;

        public VaccineService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public Task<bool> CreateVaccineAsync(VaccineCreateDto vaccineCreateDto)
        {
            throw new NotImplementedException();
        }

        public Task<Vaccine?> CreateVaccineAsync(Vaccine vaccine)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteVaccineAsync(string id)
        {
            throw new NotImplementedException();
        }

        public async Task<BasePaginatedList<Vaccine>> GetVaccinesAsync(int pageNumber, int pageSize)
        {
            IQueryable<Vaccine> query = _unitOfWork.GetRepository<Vaccine>().Entities;
            // If either pageNumber or pageSize is <= 0, retrieve all data
            if (pageNumber <= 0 || pageSize <= 0)
            {
                var allItems = await query.ToListAsync(); // Fetch all records
                return new BasePaginatedList<Vaccine>(allItems, allItems.Count, 1, allItems.Count);
            }

            // Otherwise, apply pagination
            var resultQuery = await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, pageNumber, pageSize);

            return new BasePaginatedList<Vaccine>(resultQuery.Items, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
        }

        public Task<bool> UpdateVaccineAsync(VaccineUpdateDto vaccineUpdateDto)
        {
            throw new NotImplementedException();
        }
    }
}
