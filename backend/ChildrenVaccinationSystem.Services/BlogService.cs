using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class BlogService : IBlogService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAuthenticationService _authenticationService;

		public BlogService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}

		public async Task CreateBlog(BlogCreateDto blogCreateDto)
		{
            Blog blog = new Blog();

            _mapper.Map(blogCreateDto, blog);
            _authenticationService.UpdateAudits(blog, true);

            await _unitOfWork.GetRepository<Blog>().InsertAsync(blog);
            await _unitOfWork.SaveAsync();
		}


        public async Task DeleteBlog(string id)
		{
            Blog? blog = await _unitOfWork.GetRepository<Blog>().Entities
                .Where(b => b.Id == id && b.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (blog == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy blog id");

            _authenticationService.UpdateAudits(blog, false, true);
            await _unitOfWork.SaveAsync();
		}


        public async Task<BlogViewDto> GetBlogById(string id)
		{
            Blog? blog = await _unitOfWork.GetRepository<Blog>().Entities.Where(v => v.Id == id && v.DeletedBy == null).FirstOrDefaultAsync();

            if (blog == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy vaccine id");

            return _mapper.Map<BlogViewDto>(blog);
		}

        public async Task<BasePaginatedList<BlogViewDto>> GetBlogs(int pageNumber, int pageSize)
		{
            IQueryable<Blog> query = _unitOfWork.GetRepository<Blog>().Entities.Where(b => b.DeletedBy == null);

            BasePaginatedList<Blog> resultQuery = (pageNumber <= 0 || pageSize <= 0)
                ? await _unitOfWork.GetRepository<Blog>().GetPaging(query, 1, query.Count())
                : await _unitOfWork.GetRepository<Blog>().GetPaging(query, pageNumber, pageSize);

            List<BlogViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<BlogViewDto>).ToList();

            return new BasePaginatedList<BlogViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}


        public async Task UpdateBlog(string id, BlogUpdateDto blogUpdateDto)
		{
            Blog? blog = await _unitOfWork.GetRepository<Blog>().Entities
                .Where(b => b.Id == id && b.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (blog == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy blog id");

            _mapper.Map(blogUpdateDto, blog);
            _authenticationService.UpdateAudits(blog, false);

            await _unitOfWork.GetRepository<Blog>().UpdateAsync(blog);
            await _unitOfWork.SaveAsync();
		}


	}
}
