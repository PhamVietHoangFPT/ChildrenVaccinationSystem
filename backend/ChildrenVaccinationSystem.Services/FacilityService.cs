using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
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
	public class FacilityService : IFacilityService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAuthenticationService _authenticationService;

		public FacilityService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}

		public async Task CreateFacility(FacilityCreateDto facilityCreateDto)
		{

            Facility facility = new Facility();

            _mapper.Map(facilityCreateDto, facility);
            _authenticationService.UpdateAudits(facility, true);

            await _unitOfWork.GetRepository<Facility>().InsertAsync(facility);
            await _unitOfWork.SaveAsync();
		}


        public async Task DeleteFacility(string id)
		{
            Facility? facility = await _unitOfWork.GetRepository<Facility>().Entities
                .Where(f => f.Id == id && f.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (facility == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy facility id");

            _authenticationService.UpdateAudits(facility, false, true);
            await _unitOfWork.SaveAsync();
		}


        public async Task<BasePaginatedList<FacilityViewDto>> GetFacilities(int pageNumber, int pageSize)
		{
            IQueryable<Facility> query = _unitOfWork.GetRepository<Facility>().Entities.Where(f => f.DeletedBy == null);

            BasePaginatedList<Facility> resultQuery = (pageNumber <= 0 || pageSize <= 0)
                ? await _unitOfWork.GetRepository<Facility>().GetPaging(query, 1, query.Count())
                : await _unitOfWork.GetRepository<Facility>().GetPaging(query, pageNumber, pageSize);

            List<FacilityViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<FacilityViewDto>).ToList();

            return new BasePaginatedList<FacilityViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}


        public async Task<FacilityViewDto> GetFacilityById(string id)
		{
            Facility? facility = await _unitOfWork.GetRepository<Facility>().Entities
                .Where(f => f.Id == id && f.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (facility == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy facility id");

            return _mapper.Map<FacilityViewDto>(facility);
		}


        public async Task UpdateFacility(string id, FacilityUpdateDto facilityUpdateDto)
		{
            Facility? facility = await _unitOfWork.GetRepository<Facility>().Entities
                .Where(f => f.Id == id && f.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (facility == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy facility id");

            _mapper.Map(facilityUpdateDto, facility);
            _authenticationService.UpdateAudits(facility, false);

            await _unitOfWork.GetRepository<Facility>().UpdateAsync(facility);
            await _unitOfWork.SaveAsync();
		}

        public async Task ImportVaccines(FacilityImportDto facilityImportDto)
        {
            

        }

	}
}
