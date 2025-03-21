using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
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
using System.Reflection.PortableExecutable;
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


		public async Task<BasePaginatedList<VaccinationViewDto>> GetVaccinations(string? childId, string? childCode, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize)
		{
			IQueryable<Vaccination> query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(childId) || v.ChildId == childId) && (string.IsNullOrWhiteSpace(childCode) || v.Child.ChildCode == childCode) && (status == null || v.Status == status) && (scheduleFrom == null || scheduleTo == null || (v.Schedule >= scheduleFrom && v.Schedule <= scheduleTo)))
				.OrderByDescending(v => v.Schedule);

			BasePaginatedList<Vaccination> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, pageNumber, pageSize);

			List<VaccinationViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<VaccinationViewDto>).ToList();

			return new BasePaginatedList<VaccinationViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<object>> GetVaccinationsMinimal(string? childId, string? childCode, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize)
		{
			IQueryable<Vaccination> query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(childId) || v.ChildId == childId) && (string.IsNullOrWhiteSpace(childCode) || v.Child.ChildCode == childCode) && (status == null || v.Status == status) && (scheduleFrom == null || scheduleTo == null || (v.Schedule >= scheduleFrom && v.Schedule <= scheduleTo)))
				.OrderByDescending(v => v.Schedule);

			BasePaginatedList<Vaccination> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, pageNumber, pageSize);
			var responseItems = resultQuery.Items.Select(v => new
			{
				v.Id,
				v.Price,
				v.Schedule,
				v.Note,
				v.Status,
				Child = new { v.Child.Id, v.Child.Name },
				Doctor = new { v.Doctor?.Id, v.Doctor?.Name },
				Vaccinator = new { v.Vaccinator?.Id, v.Vaccinator?.Name },
				Vaccine = new { v.Vaccine.Id, v.Vaccine.Name },
			}).ToList();

			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<object> GetVaccinationById(string id)
		{
			Vaccination? vaccination = await _unitOfWork.GetRepository<Vaccination>().Entities.Where(v => v.Id == id && v.DeletedBy == null).FirstOrDefaultAsync();

			if (vaccination == null)
				throw new ErrorException(404, "not_found", "Không tìm thấy vaccine id");

			return new
			{
				vaccination.Id,
				vaccination.Price,
				vaccination.Schedule,
				vaccination?.Note,
				vaccination?.Status,
				Child = new { vaccination!.Child.Id, vaccination.Child.Name },
				Doctor = new { vaccination.Doctor?.Id, vaccination.Doctor?.Name },
				Vaccinator = new { vaccination.Vaccinator?.Id, vaccination.Vaccinator?.Name },
				Vaccine = new { vaccination.Vaccine.Id, vaccination.Vaccine.Name },
			};
		}

		public async Task<string> PayPendingVaccinations(HttpContext context, List<string> vaccinationIds)
		{
			List<Vaccination> vaccinations = new();
			double price = 0;
			foreach (string id in vaccinationIds)
			{
				Vaccination? vaccination = await _unitOfWork.GetRepository<Vaccination>().GetByIdAsync(id);

				if (vaccination == null)
					throw new ErrorException(401, "not_found", "Đơn tiêm chủng không tồn tại");
				if (vaccination.Status != VaccinationStatusEnum.Pending)
					throw new ErrorException(400, "bad_request", "Trạng thái không hợp lệ để thanh toán");

				Vaccine? vaccine = await _unitOfWork.GetRepository<Vaccine>().Entities.Where(v => v.Id == vaccination.VaccineId && v.DeletedBy == null).FirstOrDefaultAsync();
				if (vaccine == null)
					throw new ErrorException(401, "bad_request", "Vaccine không tồn tại, yêu cầu hủy đơn tiêm chủng ngay lập tức");

				price += vaccination.Price;
				vaccinations.Add(new Vaccination
				{
					Id = id,
					Price = vaccination.Price,
					Schedule = vaccination.Schedule,
					Note = vaccination.Note,
					Status = vaccination.Status,
					ChildId = vaccination.ChildId,
					CreatedBy = vaccination.CreatedBy,
					LastUpdatedBy = vaccination.LastUpdatedBy,
					CreatedTime = vaccination.CreatedTime,
					LastUpdatedTime = vaccination.LastUpdatedTime,
					VaccineId = vaccination.VaccineId
				});
			}

			return _vnPayService.CreatePaymentUrl(context, vaccinations, price, 2);
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

					if (vaccine.DeletedBy != null)
						continue;

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

			return _vnPayService.CreatePaymentUrl(context, vaccinations, price, 1);
		}

		public async Task UpdateVaccinationByStaff(string id, VaccinationUpdateDto dto)
		{
			Vaccination? vaccination = await _unitOfWork.GetRepository<Vaccination>().GetByIdAsync(id);
			if (vaccination == null)
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy vaccination id");
			}

			if (vaccination.Status != VaccinationStatusEnum.Pending && vaccination.Status != VaccinationStatusEnum.Paid)
			{
				throw new ErrorException(400, "bad_request", "Đã quá hạn để cập nhật");
			}

			if (dto.DoctorId != null)
			{
				Account? doctor = await _unitOfWork.GetRepository<Account>().Entities.Where(d => d.Id == dto.DoctorId && d.Role == RoleEnum.Doctor && d.DeletedBy == null).FirstOrDefaultAsync();
				if (doctor == null)
					throw new ErrorException(404, "not_found", "Không tìm thấy doctor id");
			}

			if (dto.VaccinatorId != null)
			{
				Account? vaccinator = await _unitOfWork.GetRepository<Account>().Entities.Where(d => d.Id == dto.VaccinatorId && d.Role == RoleEnum.Vaccinator && d.DeletedBy == null).FirstOrDefaultAsync();
				if (vaccinator == null)
					throw new ErrorException(404, "not_found", "Không tìm thấy vaccinator id");
			}

			_mapper.Map(dto, vaccination);

			_authenticationService.UpdateAudits(vaccination, false);
			await _unitOfWork.GetRepository<Vaccination>().UpdateAsync(vaccination);

			await _unitOfWork.SaveAsync();
		}

		public async Task ShiftVaccinationStatus(string id, VaccinationStatusEnum status)
		{
			Vaccination? vaccination = await _unitOfWork.GetRepository<Vaccination>().GetByIdAsync(id);
			if (vaccination == null)
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy vaccination id");
			}

			VaccinationStatusEnum currentStatus = vaccination.Status;

			if (currentStatus == VaccinationStatusEnum.Pending && status == VaccinationStatusEnum.Paid)
			{
				throw new ErrorException(400, "bad_request", "Không thể chuyển đổi trạng thái của đơn hàng chưa thanh toán");
			}



			if ((currentStatus == VaccinationStatusEnum.Pending && (status == VaccinationStatusEnum.Paid || status == VaccinationStatusEnum.Canceled)) || (currentStatus == VaccinationStatusEnum.Paid && (status == VaccinationStatusEnum.Consulting || status == VaccinationStatusEnum.Refunded)) || (currentStatus == VaccinationStatusEnum.Consulting && (status == VaccinationStatusEnum.Paid || status == VaccinationStatusEnum.Queued)) || (currentStatus == VaccinationStatusEnum.Queued && status == VaccinationStatusEnum.Injecting) || (currentStatus == VaccinationStatusEnum.Injecting && status == VaccinationStatusEnum.Monitoring) || (currentStatus == VaccinationStatusEnum.Monitoring && (status == VaccinationStatusEnum.Completed || status == VaccinationStatusEnum.Emergency)) || (currentStatus == VaccinationStatusEnum.Emergency && status == VaccinationStatusEnum.Refunded))
			{

				vaccination.Status = status;

				_authenticationService.UpdateAudits(vaccination, false);
				await _unitOfWork.GetRepository<Vaccination>().UpdateAsync(vaccination);

				await _unitOfWork.SaveAsync();
			}
			else
				throw new ErrorException(400, "bad_request", "Trạng thái không hợp lệ");

		}
	}
}
