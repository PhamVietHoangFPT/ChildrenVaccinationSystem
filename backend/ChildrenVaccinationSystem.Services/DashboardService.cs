using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class DashboardService
	{
		private readonly IUnitOfWork _unitOfWork;

		public DashboardService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}

		public async Task<long> GetVaccinationsAdministered(DateOnly start, DateOnly end, string? facilityId)
		{
			long count = await _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (facilityId == null || v.FacilityId == facilityId) && v.Status == VaccinationStatusEnum.Completed && v.Schedule >= start && v.Schedule < end).CountAsync();

			return count;
		}

		public async Task<object> GetVaccinationsByStatus(DateOnly start, DateOnly end, string? facilityId)
		{
			var result = await _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (facilityId == null || v.FacilityId == facilityId) && (v.Status == VaccinationStatusEnum.Pending || v.Status == VaccinationStatusEnum.Canceled || v.Status == VaccinationStatusEnum.Refunded || v.Status == VaccinationStatusEnum.Completed) && v.Schedule >= start && v.Schedule <= end)
				.GroupBy(v => v.Status)
				.Select(g => new
				{
					Status = g.Key,
					Count = g.Count()
				})
				.ToListAsync();

			return result;
		}

		public async Task<object> GetCompletionRate(DateOnly start, DateOnly end, string? facilityId)
		{
			var query = _unitOfWork.GetRepository<Vaccination>().Entities.AsQueryable();

			query = query.Where(v => (facilityId == null || v.FacilityId == facilityId) && v.Schedule >= start && v.Schedule <= end);

			int totalCompleted = await query.CountAsync(v => v.Status == VaccinationStatusEnum.Completed);
			int totalFailed = await query.CountAsync(v => v.Status == VaccinationStatusEnum.Canceled || v.Status == VaccinationStatusEnum.Refunded);
			int totalVaccinations = totalCompleted + totalFailed;

			double completionRate = (totalVaccinations > 0) ? ((double)totalCompleted / totalVaccinations) * 100 : 0;

			return new
			{
				CompletionRate = Math.Round(completionRate, 2),
				TotalCompleted = totalCompleted,
				TotalFailed = totalFailed
			};
		}


		public async Task<object> GetStockData(string? facilityId)
		{
			var query = _unitOfWork.GetRepository<VaccineInventory>().Entities.Where(vi => facilityId == null || vi.FacilityId == facilityId);

			// Group by VaccineId to get the current stock per vaccine
			var stockData = await query
				.GroupBy(vi => new { vi.VaccineId, vi.Vaccine.Name })
				.Select(g => new
				{
					VaccineId = g.Key.VaccineId,
					VaccineName = g.Key.Name,
					CurrentStock = g.Sum(vi => vi.Stock)
				})
				.ToListAsync();

			return stockData;
		}

		public async Task<object> GetRegistrations(DateOnly start, DateOnly end)
		{
			var query = _unitOfWork.GetRepository<Child>().Entities.Where(c => c.DeletedBy == null).AsQueryable();

			query = query.Where(r => r.CreatedTime >= start.ToDateTime(TimeOnly.MinValue) && r.CreatedTime <= end.ToDateTime(TimeOnly.MaxValue));

			var totalRegistrations = await query.CountAsync();

			var registrationsByDate = await query
				.GroupBy(r => r.CreatedTime.Date)
				.Select(g => new
				{
					Date = g.Key,
					Count = g.Count()
				})
				.OrderBy(g => g.Date)
				.ToListAsync();

			return new
			{
				TotalRegistrations = totalRegistrations,
				RegistrationsByDate = registrationsByDate
			};
		}

		public async Task<object> GetRevenue(DateOnly start, DateOnly end, string? facilityId)
		{
			var query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => v.Status == VaccinationStatusEnum.Completed && (facilityId == null || v.FacilityId == facilityId) && v.Schedule >= start && v.Schedule <= end);

			var totalRevenue = await query.SumAsync(v => v.Price);

			var revenueByDate = await query
				.GroupBy(v => v.Schedule)
				.Select(g => new
				{
					Date = g.Key,
					Revenue = g.Sum(v => v.Price)
				})
				.OrderBy(g => g.Date)
				.ToListAsync();

			return new
			{
				TotalRevenue = totalRevenue,
				RevenueByDate = revenueByDate
			};
		}

	}
}
