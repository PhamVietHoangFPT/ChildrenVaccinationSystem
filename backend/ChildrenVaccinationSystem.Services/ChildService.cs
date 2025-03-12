using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CountryDtos;
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
	public class ChildService : IChildService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAuthenticationService _authenticationService;
		public ChildService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}

		public async Task AddChildProfile(ChildCreateDto childCreateDto)
		{
			_authenticationService.AuthorizeCustomer();

			Child child = new Child();

			_mapper.Map(childCreateDto, child);
			child.ChildCode = GenerateChildCode();
			_authenticationService.UpdateAudits(child, true);

			await _unitOfWork.GetRepository<Child>().InsertAsync(child);
			await _unitOfWork.SaveAsync();
		}

		public string GenerateChildCode()
		{
			// Find the highest existing ChildCode number
			List<Child> childList = _unitOfWork.GetRepository<Child>().Entities.ToList();

			int maxCode = childList
				.Select(c => int.TryParse(c.ChildCode.Replace("C-", ""), out int num) ? num : 0)
				.DefaultIfEmpty(0)
				.Max();

			// Increment for the new child
			int newCode = maxCode + 1;

			// Format as C-000001, C-000002, etc.
			return $"C-{newCode:D6}";
		}

		public async Task<ChildViewDto> GetChildByCode(string childCode)
		{
			Child? child = await _unitOfWork.GetRepository<Child>().Entities.Where(c => c.ChildCode == childCode && c.DeletedBy == null).FirstOrDefaultAsync();

			if (child == null)
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy child id");

			return _mapper.Map<ChildViewDto>(child);
		}

		public async Task<BasePaginatedList<ChildViewDto>> GetChildren(int pageNumber, int pageSize)
		{
			IQueryable<Child> query = _unitOfWork.GetRepository<Child>().Entities.Where(c => c.DeletedBy == null);

			BasePaginatedList<Child> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Child>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Child>().GetPaging(query, pageNumber, pageSize);

			List<ChildViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<ChildViewDto>).ToList();

			return new BasePaginatedList<ChildViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<ChildViewDto>> GetMyChildren(int pageNumber, int pageSize)
		{
			string accountId = _authenticationService.GetCurrentAccountId();

			IQueryable<Child> query = _unitOfWork.GetRepository<Child>().Entities.Where(c => c.AccountId == accountId && c.DeletedBy == null);

			BasePaginatedList<Child> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Child>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Child>().GetPaging(query, pageNumber, pageSize);

			List<ChildViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<ChildViewDto>).ToList();

			return new BasePaginatedList<ChildViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task UpdateChildProfile(string id, ChildUpdateDto childUpdateDto)
		{

		}
	}
}
