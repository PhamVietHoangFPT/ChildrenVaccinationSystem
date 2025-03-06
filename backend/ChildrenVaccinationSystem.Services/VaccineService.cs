using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
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

        public async Task<bool> CreateVaccineAsync(VaccineCreateDto vaccineCreateDto)
        {
            if (vaccineCreateDto == null)
                return false;

            var vaccine = new Vaccine
            {
                Name = vaccineCreateDto.Name,
                Price = vaccineCreateDto.Price,
                Description = vaccineCreateDto.Description,
                StartRecommendedAge = vaccineCreateDto.StartRecommendedAge,
                EndRecommendedAge = vaccineCreateDto.EndRecommendedAge,
                Sequence = vaccineCreateDto.Sequence,
                Dosage = vaccineCreateDto.Dosage,
                DosageInterval = vaccineCreateDto.DosageInterval,
                CategoryId = vaccineCreateDto.CategoryId,
                ManufacturerId = vaccineCreateDto.ManufacturerId
            };

            await _unitOfWork.GetRepository<Vaccine>().InsertAsync(vaccine);
            return await _unitOfWork.SaveAsync() > 0;
        }

        public async Task<bool> DeleteVaccineAsync(string id)
        {
            var vaccineRepo = _unitOfWork.GetRepository<Vaccine>();
            var vaccine = await vaccineRepo.GetByIdAsync(id);

            if (vaccine == null)
                return false;

            vaccineRepo.Delete(vaccine);
            return await _unitOfWork.SaveAsync() > 0;
        }

        public async Task<bool> UpdateVaccineAsync(VaccineUpdateDto vaccineUpdateDto)
        {
            if (vaccineUpdateDto == null)
                return false;

            var vaccineRepo = _unitOfWork.GetRepository<Vaccine>();
            var vaccine = await vaccineRepo.GetByIdAsync(vaccineUpdateDto.Id);

            if (vaccine == null)
                return false;

            vaccine.Name = vaccineUpdateDto.Name;
            vaccine.Price = vaccineUpdateDto.Price;
            vaccine.Description = vaccineUpdateDto.Description;
            vaccine.StartRecommendedAge = vaccineUpdateDto.StartRecommendedAge;
            vaccine.EndRecommendedAge = vaccineUpdateDto.EndRecommendedAge;
            vaccine.Sequence = vaccineUpdateDto.Sequence;
            vaccine.Dosage = vaccineUpdateDto.Dosage;
            vaccine.DosageInterval = vaccineUpdateDto.DosageInterval;
            vaccine.CategoryId = vaccineUpdateDto.CategoryId;
            vaccine.ManufacturerId = vaccineUpdateDto.ManufacturerId;

            vaccineRepo.Update(vaccine);
            return await _unitOfWork.SaveAsync() > 0;
        }

        public async Task<BasePaginatedList<Vaccine>> GetVaccinesAsync(int pageNumber, int pageSize)
        {
            IQueryable<Vaccine> query = _unitOfWork.GetRepository<Vaccine>().Entities;

            if (pageNumber <= 0 || pageSize <= 0)
            {
                var allItems = await query.ToListAsync();
                return new BasePaginatedList<Vaccine>(allItems, allItems.Count, 1, allItems.Count);
            }

            var resultQuery = await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, pageNumber, pageSize);

            return new BasePaginatedList<Vaccine>(resultQuery.Items, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
        }

        public Task<Vaccine?> CreateVaccineAsync(Vaccine vaccine)
        {
            throw new NotImplementedException();
        }
    }
}
