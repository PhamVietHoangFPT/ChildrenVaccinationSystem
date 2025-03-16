using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Core.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using Org.BouncyCastle.Utilities;
using System;
using System.CodeDom;
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
		private readonly IVnPayService _vnPayService;

		public VaccinationService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService, IVnPayService vnPayService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
			_vnPayService = vnPayService;
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


		public async Task<string> RegisterVaccination(HttpContext context, VaccinationRegisterDto dto)
		{
			if (dto.PaymentChoice < 1 || dto.PaymentChoice > 3)
			{
				throw new ErrorException(400, "bad_request", "Phương thức không phù hợp");
			}

			if ((dto.VaccineIds == null || !dto.VaccineIds.Any()) && (string.IsNullOrWhiteSpace(dto.PackageId)))
			{
				throw new ErrorException(400, "bad_request", "Vui lòng chọn vaccine");
			}

			if ((dto.VaccineIds != null && dto.VaccineIds.Any()) && !string.IsNullOrWhiteSpace(dto.PackageId))
			{
				throw new ErrorException(400, "bad_request", "Bạn chỉ được lựa chọn vaccine/1 gói vaccine");
			}

			double price = 0;

			List<string> vaccineIds = new();
			List<Vaccination> vaccinations = new();

			if (dto.VaccineIds != null && dto.VaccineIds.Any())
			{
				Vaccine selecetedVaccine = (await _unitOfWork.GetRepository<Vaccine>().GetByIdAsync(dto.VaccineId))!;
				if (dto.PaymentChoice == 1)
					price = selecetedVaccine.Price;
				vaccineIds = dto.VaccineIds;
				foreach (string vaccineId in vaccineIds)
				{
					Vaccine vaccine = (await _unitOfWork.GetRepository<Vaccine>().GetByIdAsync(vaccineId))!;
					for (int i = 0; i < vaccine.Sequence; i++)
					{
						if (dto.PaymentChoice == 2)
							price += vaccine.Price;
						Vaccination vaccination = new()
						{
							Price = vaccine.Price,
							Schedule = dto.Schedule,
							VaccineId = vaccineId,
							Note = "",
							Status = (dto.PaymentChoice == 2)
										? VaccinationStatusEnum.Paid
										: (i == 0 && dto.PaymentChoice == 1 && dto.VaccineId == vaccine.Id)
											? VaccinationStatusEnum.Paid
											: VaccinationStatusEnum.Pending,
							ChildId = dto.ChildId
						};
						vaccinations.Add(vaccination);
					}
				}
			}

			if (!string.IsNullOrWhiteSpace(dto.PackageId))
			{
				Package package = (await _unitOfWork.GetRepository<Package>().GetByIdAsync(dto.PackageId))!;
				price = package.Price;
				foreach (var item in package.PackageItems!)
				{
					vaccineIds.Add(item.VaccineId);
				}
				foreach (string vaccineId in vaccineIds)
				{
					Vaccine vaccine = (await _unitOfWork.GetRepository<Vaccine>().GetByIdAsync(vaccineId))!;

					for (int i = 0; i < vaccine.Sequence; i++)
					{
						Vaccination vaccination = new()
						{
							Price = (i == 0 && dto.VaccineId == vaccine.Id) ? price : 0, // Chỉ bản đầu tiên có giá, còn lại là 0
							Schedule = dto.Schedule,
							VaccineId = vaccineId,
							Note = "",
							Status = VaccinationStatusEnum.Paid,
							ChildId = dto.ChildId
						};
						vaccinations.Add(vaccination);
					}
				}
			}

			//_unitOfWork.GetRepository<Vaccination>().InsertRange(vaccinations);
			//await _unitOfWork.SaveAsync();
			// Extracting a list of IDs

			return _vnPayService.CreatePaymentUrl(context, vaccinations, price);
		}
	}
}
