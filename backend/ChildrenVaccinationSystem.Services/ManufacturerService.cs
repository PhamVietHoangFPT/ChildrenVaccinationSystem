using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
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
	public class ManufacturerService : IManufacturerService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAccountService _authenticationService;

		public ManufacturerService(IUnitOfWork unitOfWork, IMapper mapper, IAccountService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}

		public Task CreateManufacturer(ManufacturerCreateDto blog)
		{
			throw new NotImplementedException();
		}

		public Task DeleteManufacturer(string id)
		{
			throw new NotImplementedException();
		}

		public Task<ManufacturerViewDto> GetManufacturerById(string id)
		{
			throw new NotImplementedException();
		}

		public Task<BasePaginatedList<ManufacturerViewDto>> GetManufacturers(int pageNumber, int pageSize)
		{
			throw new NotImplementedException();
		}

		public Task UpdateManufacturer(string id, ManufacturerUpdateDto blog)
		{
			throw new NotImplementedException();
		}
	}
}
