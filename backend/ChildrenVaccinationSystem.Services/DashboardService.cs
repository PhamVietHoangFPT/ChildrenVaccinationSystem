using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Core.Enum;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static ChildrenVaccinationSystem.Core.Base.BaseException;

namespace ChildrenVaccinationSystem.Services
{
	public class DashboardService
	{
		private readonly IUnitOfWork _unitOfWork;

		public DashboardService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}

		public async Task<object> GetVaccinationsAdministered(int startMonth, int startYear, int endMonth, int endYear, string? facilityId)
		{
			if (facilityId != null && !_unitOfWork.IsValid<Facility>(facilityId))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			}

			var startDate = new DateTime(startYear, startMonth, 1);
			var endDate = new DateTime(endYear, endMonth, 1);

			var vaccinations = await _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (facilityId == null || v.FacilityId == facilityId) &&
							v.Status == VaccinationStatusEnum.Completed &&
							(v.Schedule.Year > startYear || (v.Schedule.Year == startYear && v.Schedule.Month >= startMonth)) &&
							(v.Schedule.Year < endYear || (v.Schedule.Year == endYear && v.Schedule.Month <= endMonth)))
				.GroupBy(v => new { v.Schedule.Year, v.Schedule.Month })
				.Select(g => new { Period = $"{g.Key.Year}-{g.Key.Month:D2}", TotalCount = g.Count() })
				.ToListAsync();

			var result = new List<object>();
			var total = 0;
			var currentDate = startDate;

			while (currentDate <= endDate)
			{
				var period = $"{currentDate.Year}-{currentDate.Month:D2}";
				var count = vaccinations.FirstOrDefault(v => v.Period == period)?.TotalCount ?? 0;
				total += count;

				result.Add(new { Period = period, TotalCount = count });

				currentDate = currentDate.AddMonths(1);
			}

			return new
			{
				Total = total,
				Result = result
			};
		}

		public async Task<object> GetVaccinationsByStatus(int startMonth, int startYear, int endMonth, int endYear, string? facilityId)
		{
			if (facilityId != null && !_unitOfWork.IsValid<Facility>(facilityId))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			}

			// Tạo danh sách các tháng trong khoảng từ start đến end
			var periods = Enumerable.Range(0, ((endYear - startYear) * 12) + (endMonth - startMonth) + 1)
				.Select(offset => new DateOnly(startYear, startMonth, 1).AddMonths(offset))
				.Select(date => new { Period = $"{date.Year}-{date.Month:D2}", Year = date.Year, Month = date.Month })
				.ToList();

			// Lấy dữ liệu từ database
			var data = await _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (facilityId == null || v.FacilityId == facilityId) &&
							(v.Status == VaccinationStatusEnum.Pending ||
							 v.Status == VaccinationStatusEnum.Canceled ||
							 v.Status == VaccinationStatusEnum.Refunded ||
							 v.Status == VaccinationStatusEnum.Completed) &&
							(v.Schedule.Year > startYear || (v.Schedule.Year == startYear && v.Schedule.Month >= startMonth)) &&
							(v.Schedule.Year < endYear || (v.Schedule.Year == endYear && v.Schedule.Month <= endMonth)))
				.GroupBy(v => new { v.Schedule.Year, v.Schedule.Month, v.Status })
				.Select(g => new
				{
					Year = g.Key.Year,
					Month = g.Key.Month,
					Status = g.Key.Status,
					Count = g.Count()
				})
				.ToListAsync();

			// Gộp dữ liệu vào danh sách tháng, nếu không có thì gán Count = 0 cho từng Status
			var allStatuses = new[]
			{
				VaccinationStatusEnum.Pending,
				VaccinationStatusEnum.Canceled,
				VaccinationStatusEnum.Refunded,
				VaccinationStatusEnum.Completed
			};

			var result = periods
				.Select(p => new
				{
					Period = p.Period,
					StatusCounts = allStatuses
						.Select(status => new
						{
							Status = status,
							Count = data.FirstOrDefault(d => d.Year == p.Year && d.Month == p.Month && d.Status == status)?.Count ?? 0
						})
						.ToList()
				})
				.OrderBy(x => x.Period)
				.ToList();

			return result;
		}

		public async Task<object> GetRegistrations(int startMonth, int startYear, int endMonth, int endYear)
		{

			DateOnly start = new DateOnly(startYear, startMonth, 1);
			DateOnly end = new DateOnly(endYear, endMonth, DateTime.DaysInMonth(endYear, endMonth));

			var query = _unitOfWork.GetRepository<Child>().Entities
				.Where(c => c.DeletedBy == null &&
							c.CreatedTime >= start.ToDateTime(TimeOnly.MinValue) &&
							c.CreatedTime <= end.ToDateTime(TimeOnly.MaxValue));

			// Lấy tổng số đăng ký
			var totalRegistrations = await query.CountAsync();

			// Lấy dữ liệu nhóm theo tháng
			var data = await query
				.GroupBy(r => new { r.CreatedTime.Year, r.CreatedTime.Month })
				.Select(g => new
				{
					Year = g.Key.Year,
					Month = g.Key.Month,
					Count = g.Count()
				})
				.ToListAsync();

			// Tạo danh sách tất cả các tháng trong khoảng thời gian từ start đến end
			var periods = Enumerable.Range(0, ((endYear - startYear) * 12) + (endMonth - startMonth) + 1)
				.Select(offset => new DateOnly(startYear, startMonth, 1).AddMonths(offset))
				.Select(date => new { Period = $"{date.Year}-{date.Month:D2}", Year = date.Year, Month = date.Month })
				.ToList();

			// Ghép dữ liệu, đảm bảo tháng nào cũng có số liệu, nếu không có thì Count = 0
			var result = periods
				.Select(p => new
				{
					Period = p.Period,
					Count = data.FirstOrDefault(d => d.Year == p.Year && d.Month == p.Month)?.Count ?? 0
				})
				.OrderBy(x => x.Period)
				.ToList();

			return new
			{
				Total = totalRegistrations,
				Result = result
			};
		}


		public async Task<object> GetRevenue(int startMonth, int startYear, int endMonth, int endYear, string? facilityId)
		{

			if (facilityId != null && !_unitOfWork.IsValid<Facility>(facilityId)) 
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			}

			var startDate = new DateTime(startYear, startMonth, 1);
			var endDate = new DateTime(endYear, endMonth, 1);

			var query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => v.Status == VaccinationStatusEnum.Completed &&
							(facilityId == null || v.FacilityId == facilityId) &&
							(v.Schedule.Year > startYear || (v.Schedule.Year == startYear && v.Schedule.Month >= startMonth)) &&
							(v.Schedule.Year < endYear || (v.Schedule.Year == endYear && v.Schedule.Month <= endMonth)));

			var totalRevenue = await query.SumAsync(v => v.Price);

			var revenueByMonth = await query
				.GroupBy(v => new { v.Schedule.Year, v.Schedule.Month })
				.Select(g => new { Period = $"{g.Key.Year}-{g.Key.Month:D2}", Revenue = g.Sum(v => v.Price) })
				.ToListAsync();

			var result = new List<object>();
			var currentDate = startDate;

			while (currentDate <= endDate)
			{
				var period = $"{currentDate.Year}-{currentDate.Month:D2}";
				var revenue = revenueByMonth.FirstOrDefault(r => r.Period == period)?.Revenue ?? 0;

				result.Add(new { Period = period, Revenue = revenue });

				currentDate = currentDate.AddMonths(1);
			}

			return new
			{
				Total = totalRevenue,
				Result = result
			};
		}


		public async Task<object> GetTopVaccines(int topN = 5, string? facilityId = null)
		{
			if (facilityId != null && !_unitOfWork.IsValid<Facility>(facilityId))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy facility id");
			}

			var query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => v.Status == VaccinationStatusEnum.Completed &&
						   (facilityId == null || v.FacilityId == facilityId));

			var topVaccines = await query
				.GroupBy(v => new { v.VaccineId, v.Vaccine.Name })
				.Select(g => new
				{
					VaccineId = g.Key.VaccineId,
					VaccineName = g.Key.Name,
					TotalCount = g.Count()
				})
				.OrderByDescending(g => g.TotalCount)
				.Take(topN)
				.ToListAsync();

			return topVaccines;
		}

		public async Task<object> GetTopFacilitiesByRevenue(int topN = 5)
		{
			var query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => v.Status == VaccinationStatusEnum.Completed);

			var topFacilities = await query
				.GroupBy(v => new { v.FacilityId, v.Facility.Name })
				.Select(g => new
				{
					FacilityId = g.Key.FacilityId,
					FacilityName = g.Key.Name,
					TotalRevenue = g.Sum(v => v.Price)
				})
				.OrderByDescending(g => g.TotalRevenue)
				.Take(topN)
				.ToListAsync();

			return topFacilities;
		}

	}
}
