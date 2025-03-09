using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class FacilityService : IFacilityService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAccountService _authenticationService;

		public FacilityService(IUnitOfWork unitOfWork, IMapper mapper, IAccountService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}

		public Task CreateFacility(FacilityCreateDto blog)
		{
			throw new NotImplementedException();
		}

		public Task DeleteFacility(string id)
		{
			throw new NotImplementedException();
		}

		public Task<BasePaginatedList<FacilityViewDto>> GetFacilities(int pageNumber, int pageSize)
		{
			throw new NotImplementedException();
		}

		public Task<FacilityViewDto> GetFacilityById(string id)
		{
			throw new NotImplementedException();
		}

		public Task UpdateFacility(string id, FacilityUpdateDto blog)
		{
			throw new NotImplementedException();
		}
	}
}
