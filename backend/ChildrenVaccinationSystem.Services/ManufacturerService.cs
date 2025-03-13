using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
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
	public class ManufacturerService : IManufacturerService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAuthenticationService _authenticationService;

		public ManufacturerService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}

        public async Task CreateManufacturer(ManufacturerCreateDto manufacturerCreateDto)
		{
            if (!_unitOfWork.IsValid<Country>(manufacturerCreateDto.CountryId))
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy category id");

            Manufacturer manufacturer = new Manufacturer();
            _mapper.Map(manufacturerCreateDto, manufacturer);
            _authenticationService.UpdateAudits(manufacturer, true);

            await _unitOfWork.GetRepository<Manufacturer>().InsertAsync(manufacturer);
            await _unitOfWork.SaveAsync();
		}

        public async Task DeleteManufacturer(string id)
		{
            Manufacturer? manufacturer = await _unitOfWork.GetRepository<Manufacturer>().Entities
                .Where(m => m.Id == id && m.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (manufacturer == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy manufacturer id");

            _authenticationService.UpdateAudits(manufacturer, false, true);
            await _unitOfWork.SaveAsync();
		}

        public async Task<ManufacturerViewDto> GetManufacturerById(string id)
		{
            Manufacturer? manufacturer = await _unitOfWork.GetRepository<Manufacturer>().Entities.Where(v => v.Id == id && v.DeletedBy == null).FirstOrDefaultAsync();

            if (manufacturer == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy manufacturer id");

            return _mapper.Map<ManufacturerViewDto>(manufacturer);
		}

        public async Task<BasePaginatedList<ManufacturerViewDto>> GetManufacturers(int pageNumber, int pageSize)
		{
            IQueryable<Manufacturer> query = _unitOfWork.GetRepository<Manufacturer>().Entities
                .Where(m => m.DeletedBy == null);

            BasePaginatedList<Manufacturer> resultQuery = (pageNumber <= 0 || pageSize <= 0)
                ? await _unitOfWork.GetRepository<Manufacturer>().GetPaging(query, 1, query.Count())
                : await _unitOfWork.GetRepository<Manufacturer>().GetPaging(query, pageNumber, pageSize);

            List<ManufacturerViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<ManufacturerViewDto>).ToList();

            return new BasePaginatedList<ManufacturerViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

        public async Task UpdateManufacturer(string id, ManufacturerUpdateDto manufacturerUpdateDto)
		{
            Manufacturer? manufacturer = await _unitOfWork.GetRepository<Manufacturer>().Entities.Where(v => v.Id == id && v.DeletedBy == null).FirstOrDefaultAsync();

            if (manufacturer == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy vaccine id");

            if (manufacturerUpdateDto.CountryId != null && !_unitOfWork.IsValid<Country>(manufacturerUpdateDto.CountryId))
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy manufacturer id");

            _mapper.Map(manufacturerUpdateDto, manufacturer);
            _authenticationService.UpdateAudits(manufacturer, false);


            await _unitOfWork.GetRepository<Manufacturer>().UpdateAsync(manufacturer);
            await _unitOfWork.SaveAsync();
		}
	}
}
