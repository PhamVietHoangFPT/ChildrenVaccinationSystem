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
using static ChildrenVaccinationSystem.Core.Base.BaseException;

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

		//This is for staff-only
		public async Task AddChildProfile(string parentId, ChildCreateDto childCreateDto)
		{
			if (!_unitOfWork.IsValid<Account>(parentId))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy parent id");
			}

			Child child = new Child();

			_mapper.Map(childCreateDto, child);
			child.ChildCode = GenerateChildCode();
			_authenticationService.UpdateAudits(child, true);
			child.AccountId = parentId;

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

		public async Task<ChildViewDto> GetChildById(string id)
		{
			Child? child = await _unitOfWork.GetRepository<Child>().Entities.Where(c => c.Id == id && c.DeletedBy == null).FirstOrDefaultAsync();

			if (child == null)
				throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy child code");

			return _mapper.Map<ChildViewDto>(child);
		}

		public async Task<BasePaginatedList<ChildViewDto>> GetChildren(string? parentId, string? name, string? parentPhoneNumber, int pageNumber, int pageSize)
		{
			IQueryable<Child> query = _unitOfWork.GetRepository<Child>().Entities
				.Where(c => c.DeletedBy == null && (string.IsNullOrWhiteSpace(parentId) || c.AccountId == parentId) && (string.IsNullOrWhiteSpace(name) || c.Name.Contains(name)) && (string.IsNullOrWhiteSpace(parentPhoneNumber) || (!string.IsNullOrWhiteSpace(c.Account.PhoneNumber) && c.Account.PhoneNumber.StartsWith(parentPhoneNumber))));

			if (!string.IsNullOrWhiteSpace(parentId) && !_unitOfWork.IsValid<Account>(parentId))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy parent id");
			}

			BasePaginatedList<Child> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Child>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Child>().GetPaging(query, pageNumber, pageSize);

			List<ChildViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<ChildViewDto>).ToList();

			return new BasePaginatedList<ChildViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<object>> GetChildrenMinimal(string? parentId, string? name, string? parentPhoneNumber, int pageNumber, int pageSize)
		{
			IQueryable<Child> query = _unitOfWork.GetRepository<Child>().Entities
				.Where(c => c.DeletedBy == null && (string.IsNullOrWhiteSpace(parentId) || c.AccountId == parentId) && (string.IsNullOrWhiteSpace(name) || c.Name.Contains(name)) && (string.IsNullOrWhiteSpace(parentPhoneNumber) || (!string.IsNullOrWhiteSpace(c.Account.PhoneNumber) && c.Account.PhoneNumber.StartsWith(parentPhoneNumber))));

			if (!string.IsNullOrWhiteSpace(parentId) && !_unitOfWork.IsValid<Account>(parentId))
			{
				throw new ErrorException(404, "not_found", "Không tìm thấy parent id");
			}

			BasePaginatedList<Child> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Child>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Child>().GetPaging(query, pageNumber, pageSize);

			var responseItems = resultQuery.Items.Select(c => new
			{
				c.Id,
				c.Name,
				c.ChildCode,
				c.Height,
				c.Weight,
				c.DateOfBirth,
				c.Gender,
				c.MedicalNote
			}).ToList();

			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task UpdateChildProfile(string id, ChildUpdateDto childUpdateDto)
		{
			Child? child = await _unitOfWork.GetRepository<Child>().Entities
				.Where(c => c.Id == id && c.DeletedBy == null)
				.FirstOrDefaultAsync();

			if (child == null)
				throw new ErrorException(404, "not_found", "Không tìm thấy child id");

			_mapper.Map(childUpdateDto, child);
			_authenticationService.UpdateAudits(child, false);

			await _unitOfWork.GetRepository<Child>().UpdateAsync(child);
			await _unitOfWork.SaveAsync();

		}
	}
}
