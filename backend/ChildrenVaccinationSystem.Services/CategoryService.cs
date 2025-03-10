using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
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


		public async Task CreateCategory(CategoryCreateDto categoryCreateDto)
		{
            if (!_unitOfWork.IsValid<Category>(categoryCreateDto.Name))
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy tên Category");

            Category category = new Category();

            _mapper.Map(categoryCreateDto, category);
            _authenticationService.UpdateAudits(category, true);

            await _unitOfWork.GetRepository<Category>().InsertAsync(category);
            await _unitOfWork.SaveAsync();
		}

        public async Task DeleteCategory(string id)
		{
            Category? category = await _unitOfWork.GetRepository<Category>().Entities
                .Where(c => c.Id == id && c.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (category == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy category id");

            _authenticationService.UpdateAudits(category, false, true);
            await _unitOfWork.SaveAsync();
		}


        public async Task<BasePaginatedList<CategoryViewDto>> GetCategories(int pageNumber, int pageSize)
		{
            IQueryable<Category> query = _unitOfWork.GetRepository<Category>().Entities.Where(c => c.DeletedBy == null);

            BasePaginatedList<Category> resultQuery = (pageNumber <= 0 || pageSize <= 0)
                ? await _unitOfWork.GetRepository<Category>().GetPaging(query, 1, query.Count())
                : await _unitOfWork.GetRepository<Category>().GetPaging(query, pageNumber, pageSize);

            List<CategoryViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<CategoryViewDto>).ToList();

            return new BasePaginatedList<CategoryViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}


        public async Task<CategoryViewDto> GetCategoryById(string id)
		{
            Category? category = await _unitOfWork.GetRepository<Category>().Entities
                .Where(c => c.Id == id && c.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (category == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy category id");

            return _mapper.Map<CategoryViewDto>(category);
		}

		public async Task UpdateCategory(string id, CategoryUpdateDto categoryUpdateDto)
		{
            Category? category = await _unitOfWork.GetRepository<Category>().Entities
                .Where(c => c.Id == id && c.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (category == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy category id");

            if (categoryUpdateDto.Name != null && !_unitOfWork.IsValid<Category>(categoryUpdateDto.Name))
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy parent category id");

            _mapper.Map(categoryUpdateDto, category);
            _authenticationService.UpdateAudits(category, false);

            await _unitOfWork.GetRepository<Category>().UpdateAsync(category);
            await _unitOfWork.SaveAsync();
		}

	}
}
