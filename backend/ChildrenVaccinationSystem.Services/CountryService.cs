using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CountryDtos;
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
		private readonly IMapper _mapper;

		public CountryService(IUnitOfWork unitOfWork, IMapper mapper)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
		}

		public async Task<BasePaginatedList<CountryViewDto>> GetCountriesAsync(int pageNumber, int pageSize)
		{
			IQueryable<Country> query = _unitOfWork.GetRepository<Country>().Entities.Where(c => c.DeletedBy == null);

			BasePaginatedList<Country> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Country>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Country>().GetPaging(query, pageNumber, pageSize);

			List<CountryViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<CountryViewDto>).ToList();

			return new BasePaginatedList<CountryViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public Task<BasePaginatedList<Country>> SearchCountriesAsync(int pageNumber, int pageSize)
		{
			throw new NotImplementedException();
		}
	}
}
