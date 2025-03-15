using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CountryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface ICountryService
	{
		Task<BasePaginatedList<CountryViewDto>> GetCountries(int pageNumber, int pageSize);
		Task<BasePaginatedList<CountryViewDto>> GetManufacturerCountries(int pageNumber, int pageSize);
	}
}
