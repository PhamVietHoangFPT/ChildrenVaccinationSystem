using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using Microsoft.EntityFrameworkCore;

namespace ChildrenVaccinationSystem.Services
{
	public class CountryService : ICountryService
	{
		private readonly IUnitOfWork _unitOfWork;

		public CountryService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}

		public async Task<BasePaginatedList<Country>> GetCountriesAsync(int pageNumber, int pageSize)
		{
			IQueryable<Country> query = _unitOfWork.GetRepository<Country>().Entities;

			// If either pageNumber or pageSize is <= 0, retrieve all data
			if (pageNumber <= 0 || pageSize <= 0)
			{
				var allItems = await query.ToListAsync(); // Fetch all records
				return new BasePaginatedList<Country>(allItems, allItems.Count, 1, allItems.Count);
			}

			// Otherwise, apply pagination
			var resultQuery = await _unitOfWork.GetRepository<Country>().GetPaging(query, pageNumber, pageSize);

			return new BasePaginatedList<Country>(resultQuery.Items, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}
	}
}
