using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Repositories.UOW;
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
		private readonly IMapper _mapper;
        private readonly IAuthenticationService _authenticationService;

		public VaccineService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _authenticationService = authenticationService;
        }

        public async Task CreateVaccine(VaccineCreateDto vaccineCreateDto)
        {
            if (!_unitOfWork.IsValid<Category>(vaccineCreateDto.CategoryId))
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy category id");

			if (!_unitOfWork.IsValid<Manufacturer>(vaccineCreateDto.ManufacturerId))
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy manufacturer id");

            Vaccine vaccine = new Vaccine();

            _mapper.Map(vaccineCreateDto, vaccine);
            _authenticationService.UpdateAudits(vaccine, true);

            await _unitOfWork.GetRepository<Vaccine>().InsertAsync(vaccine);
            await _unitOfWork.SaveAsync();
        }

        public async Task DeleteVaccine(string id)
        {
			Vaccine? vaccine = await _unitOfWork.GetRepository<Vaccine>().Entities.Where(v => v.Id == id && v.DeletedBy == null).FirstOrDefaultAsync();

			if (vaccine == null)
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy vaccine id");

			_authenticationService.UpdateAudits(vaccine, false, true);
			await _unitOfWork.SaveAsync();

		}

		public async Task UpdateVaccine(string id, VaccineUpdateDto vaccineUpdateDto)
        {
            Vaccine? vaccine = await _unitOfWork.GetRepository<Vaccine>().Entities.Where(v => v.Id == id && v.DeletedBy == null).FirstOrDefaultAsync();

            if (vaccine == null)
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy vaccine id");

			if (vaccineUpdateDto.CategoryId != null && !_unitOfWork.IsValid<Category>(vaccineUpdateDto.CategoryId))
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy category id");

			if (vaccineUpdateDto.ManufacturerId != null && !_unitOfWork.IsValid<Manufacturer>(vaccineUpdateDto.ManufacturerId))
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy manufacturer id");

			_mapper.Map(vaccineUpdateDto, vaccine);
			_authenticationService.UpdateAudits(vaccine, false);


			await _unitOfWork.GetRepository<Vaccine>().UpdateAsync(vaccine);
            await _unitOfWork.SaveAsync();
		}

		public async Task<BasePaginatedList<VaccineViewDto>> GetVaccines(int pageNumber, int pageSize)
        {

            IQueryable<Vaccine> query = _unitOfWork.GetRepository<Vaccine>().Entities.Where(v => v.DeletedBy ==null);



            BasePaginatedList<Vaccine> resultQuery = (pageNumber <= 0 || pageSize <= 0)
                ? await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, 1, query.Count())
                : await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, pageNumber, pageSize);


            List<VaccineViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<VaccineViewDto>).ToList();

            return new BasePaginatedList<VaccineViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
        }

        public async Task<BasePaginatedList<object>> GetVaccinesMinimal(int pageNumber, int pageSize)
        {
			IQueryable<Vaccine> query = _unitOfWork.GetRepository<Vaccine>().Entities.Where(v => v.DeletedBy == null);

			BasePaginatedList<Vaccine> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, pageNumber, pageSize);

			var responseItems = resultQuery.Items.Select(v => new
			{
				v.Id,
				v.Name,
				Category = new { v.Category.Name},
				Manufacturer = new { v.Manufacturer.Name },
				v.Price,
				v.StartRecommendedAge,
				v.EndRecommendedAge,
				v.Dosage
			}).ToList();

			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<VaccineViewDto> GetVaccineById(string id)
		{
			Vaccine? vaccine = await _unitOfWork.GetRepository<Vaccine>().Entities.Where(v => v.Id == id && v.DeletedBy == null).FirstOrDefaultAsync();

            if (vaccine == null)
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy vaccine id");

			return _mapper.Map<VaccineViewDto>(vaccine);
		}
	}
}
