using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Utils;
using ChildrenVaccinationSystem.Repositories.UOW;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
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



            await _unitOfWork.GetRepository<Vaccine>().InsertAsync(vaccine);

            await _unitOfWork.SaveAsync();
			if (vaccineCreateDto.ImageSource != null)
			{
				string imageSource = await CoreHelper.CreateImage(vaccineCreateDto.ImageSource);
				Image image = new()
				{
					ImageSource = imageSource,
					VaccineId = vaccine.Id
				};
				await _unitOfWork.GetRepository<Image>().InsertAsync(image);
				await _unitOfWork.SaveAsync();
			}
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

			if (vaccineUpdateDto.ImageSource != null)
			{
				Image? image = await _unitOfWork.GetRepository<Image>().Entities.Where(i => i.VaccineId == vaccine.Id).FirstOrDefaultAsync();

				if (image != null)
				{
					CoreHelper.DeleteImage(image.ImageSource);
					await _unitOfWork.GetRepository<Image>().DeleteAsync(image);
					await _unitOfWork.SaveAsync();
				}

				image = new()
				{
					ImageSource = await CoreHelper.CreateImage(vaccineUpdateDto.ImageSource),
					VaccineId = vaccine.Id
				};

				await _unitOfWork.GetRepository<Image>().InsertAsync(image);
				await _unitOfWork.SaveAsync();
			}
		}

		public async Task<BasePaginatedList<VaccineViewDto>> GetVaccines(string? name, string? categoryName, string? manufacturerCountry, int pageNumber, int pageSize)
        {

            IQueryable<Vaccine> query = _unitOfWork.GetRepository<Vaccine>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(name) || v.Name.ToLower().Contains(name.ToLower())) && (string.IsNullOrWhiteSpace(categoryName) || (v.Category.Name.Contains(categoryName))) && (string.IsNullOrWhiteSpace(manufacturerCountry) || (v.Manufacturer.Country.Name.Contains(manufacturerCountry))) && v.DeletedBy == null);



            BasePaginatedList<Vaccine> resultQuery = (pageNumber <= 0 || pageSize <= 0)
                ? await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, 1, query.Count())
                : await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, pageNumber, pageSize);


            List<VaccineViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<VaccineViewDto>).ToList();

            return new BasePaginatedList<VaccineViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
        }

        public async Task<BasePaginatedList<object>> GetVaccinesMinimal(string? name, string? categoryName, string? manufacturerCountry, int pageNumber, int pageSize)
        {
			IQueryable<Vaccine> query = _unitOfWork.GetRepository<Vaccine>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(name) || (v.Name.Contains(name))) && (string.IsNullOrWhiteSpace(categoryName) || (v.Category.Name.Contains(categoryName))) && (string.IsNullOrWhiteSpace(manufacturerCountry) || (v.Manufacturer.Country.Name.Contains(manufacturerCountry))) && v.DeletedBy == null);

			BasePaginatedList<Vaccine> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, pageNumber, pageSize);

			var responseItems = resultQuery.Items.Select(v => new
			{
				v.Id,
				v.Name,
				Category = new { v.Category.Name},
				Manufacturer = new { v.Manufacturer.Name, Country = new { v.Manufacturer.Country.Name } },
				v.Price,
				v.StartRecommendedAge,
				v.EndRecommendedAge,
				v.Dosage,
				v.DosageInterval
			}).ToList();

			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<object>> GetVaccinesMini()
		{
			IQueryable<Vaccine> query = _unitOfWork.GetRepository<Vaccine>().Entities
				.Where(v => v.DeletedBy == null);

			BasePaginatedList<Vaccine> resultQuery = await _unitOfWork.GetRepository<Vaccine>().GetPaging(query, 1, query.Count());

			var responseItems = resultQuery.Items.Select(v => new
			{
				v.Id,
				v.Name,
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
