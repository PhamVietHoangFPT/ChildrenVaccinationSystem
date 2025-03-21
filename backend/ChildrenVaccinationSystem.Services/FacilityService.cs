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
using static ChildrenVaccinationSystem.Core.Base.BaseException;

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
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");

			return _mapper.Map<FacilityViewDto>(facility);
		}

		public async Task<object> GetFacilityInventory(string id)
		{
			Facility? facility = await _unitOfWork.GetRepository<Facility>().Entities
				.Where(f => f.Id == id && f.DeletedBy == null)
				.FirstOrDefaultAsync();

			if (facility == null)
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			var inventory = await _unitOfWork.GetRepository<VaccineInventory>().Entities
				.Where(vi => vi.FacilityId == id)  // Filter by facility
				.GroupBy(vi => vi.VaccineId)       // Group by VaccineId
				.Select(g => new
				{
					Vaccine = new { g.First().Vaccine.Id, g.First().Vaccine.Name },
					TotalStock = g.Sum(vi => vi.Stock)    // Sum up stock for this vaccine
				})
				.ToListAsync();

			return inventory;
		}

		public async Task<object> GetFacilityBatches(string id)
		{
			Facility? facility = await _unitOfWork.GetRepository<Facility>().Entities
				.Where(f => f.Id == id && f.DeletedBy == null)
				.FirstOrDefaultAsync();

			if (facility == null)
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			var batches = await _unitOfWork.GetRepository<VaccineInventory>().Entities
				.Where(vi => vi.FacilityId == id) // Filter by facility
				.GroupBy(vi => new { vi.BatchNumber, vi.ImportedDate, vi.ExpiryDate }) // Group by batch details
				.Select(g => new
				{
					g.Key.BatchNumber,
					g.Key.ImportedDate,
					g.Key.ExpiryDate,
					Vaccines = g.GroupBy(vi => vi.VaccineId) // Group vaccines within this batch
						.Select(vg => new
						{
							vg.First().Vaccine.Name, // Vaccine name (assumes navigation property exists)
							Stock = vg.Sum(vi => vi.Stock)  // Total stock for this vaccine in this batch
						})
						.ToList()
				})
				.ToListAsync();

			return batches;
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
			Facility? facility = await _unitOfWork.GetRepository<Facility>().Entities.Where(v => v.Id == facilityImportDto.FacilityId && v.DeletedBy == null).FirstOrDefaultAsync();

			if (facility == null)
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			}


			string batchNumber = GenerateBatchNumber();

			foreach (var import in facilityImportDto.VaccineImports)
			{
				Vaccine? vaccine = await _unitOfWork.GetRepository<Vaccine>().Entities.Where(v => v.Id == import.VaccineId && v.DeletedBy == null).FirstOrDefaultAsync();

				if (vaccine == null)
				{
					throw new ErrorException(404, "not_found", "Không tìm thấy vaccine id");
				}

				VaccineInventory inventory = new()
				{
					BatchNumber = batchNumber,
					FacilityId = facilityImportDto.FacilityId,
					VaccineId = import.VaccineId,
					Stock = import.Stock,
					ImportedDate = DateOnly.FromDateTime(DateTime.Now),
					ExpiryDate = DateOnly.FromDateTime(DateTime.Now).AddYears(1),
				};

				await _unitOfWork.GetRepository<VaccineInventory>().InsertAsync(inventory);
			}
			await _unitOfWork.SaveAsync();
		}

		private string GenerateBatchNumber()
		{
			string time = DateTime.Now.ToString("mmss");
			string randomDigits = new Random().Next(100, 999).ToString();
			return $"B{time}{randomDigits}";
		}
	}
}
