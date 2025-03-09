using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
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
	public class CategoryService : ICategoryService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAccountService _authenticationService;

		public CategoryService(IUnitOfWork unitOfWork, IMapper mapper, IAccountService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}


		public Task CreateCategory(CategoryCreateDto blog)
		{
			throw new NotImplementedException();
		}

		public Task DeleteCategory(string id)
		{
			throw new NotImplementedException();
		}

		public Task<BasePaginatedList<CategoryViewDto>> GetCategories(int pageNumber, int pageSize)
		{
			throw new NotImplementedException();
		}

		public Task<CategoryViewDto> GetCategoryById(string id)
		{
			throw new NotImplementedException();
		}

		public Task UpdateCategory(string id, CategoryUpdateDto blog)
		{
			throw new NotImplementedException();
		}
	}
}
