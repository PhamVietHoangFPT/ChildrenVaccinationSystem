using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Core.Utils;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static ChildrenVaccinationSystem.Core.Base.BaseException;

namespace ChildrenVaccinationSystem.Services
{
	public class VaccinationService : IVaccinationService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAuthenticationService _authenticationService;

		public VaccinationService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}


		public async Task<BasePaginatedList<VaccinationViewDto>> GetVaccinations(string? childId, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize)
		{
			IQueryable<Vaccination> query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(childId) || v.ChildId == childId) && (status == null || v.Status == status) && (scheduleFrom == null || scheduleTo == null || (v.Schedule >= scheduleFrom && v.Schedule <= scheduleTo)))
				.OrderByDescending(v => v.CreatedTime);

			BasePaginatedList<Vaccination> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, pageNumber, pageSize);

			List<VaccinationViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<VaccinationViewDto>).ToList();

			return new BasePaginatedList<VaccinationViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<object>> GetVaccinationsMinimal(string? childId, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize)
		{
			IQueryable<Vaccination> query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(childId) || v.ChildId == childId) && (status == null || v.Status == status) && (scheduleFrom == null || scheduleTo == null || (v.Schedule >= scheduleFrom && v.Schedule <= scheduleTo)))
				.OrderByDescending(v => v.CreatedTime);

			BasePaginatedList<Vaccination> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, pageNumber, pageSize);
			var responseItems = resultQuery.Items.Select(v => new
			{
				v.Id,
				v.Schedule,
				v.Note,
				v.Status,
				Child = new { v.Child.Name },
				Doctor = new { v.Doctor?.Name },
				Vaccinator = new { v.Vaccinator?.Name },
				Vaccine = new { v.Vaccine.Name },
			}).ToList();

			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}


		public async Task RegisterVaccination(VaccinationRegisterDto dto)
		{
			if ((dto.Vaccines == null || !dto.Vaccines.Any()) && (dto.Packages == null || !dto.Packages.Any()))
			{
				throw new ErrorException(400, "bad_request", "Vui lòng chọn vaccine");
			}

			List<string> vaccineIds = new List<string>();

			if (dto.Vaccines != null && dto.Vaccines.Any())
			{
				vaccineIds = dto.Vaccines;
			}

			foreach (string vaccineId in vaccineIds)
			{
				Vaccine vaccine = (await _unitOfWork.GetRepository<Vaccine>().GetByIdAsync(vaccineId))!;

				Vaccination vaccination = new()
				{
					TotalPrice = (dto.PaymentChoice == 1 && dto.VaccineId == vaccine.Id) ? 0 : vaccine.Price,
					VaccineId = vaccineId,
					Note = "",
					Status = (dto.PaymentChoice == 1 && dto.VaccineId == vaccine.Id) ? VaccinationStatusEnum.Paid : VaccinationStatusEnum.Pending,

				};
			}



			if (dto.Packages != null && dto.Packages.Any())
			{
				List<Package> packages = new List<Package>();
				foreach (string packageId in dto.Packages) 
				{
					Package package = (await _unitOfWork.GetRepository<Package>().GetByIdAsync(packageId))!;
					foreach(PackageItem item in package.PackageItems!)
					{
						if (vaccineIds.Contains(item.VaccineId))
						{
							throw new ErrorException(400, "bad_request", "Các loại vaccine/gói vaccine của bạn đã bị trùng lặp, vui lòng lựa chọn lại");
						}
						vaccineIds.Add(item.VaccineId);
					}
				}
			}


		}
	}
}
