using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Core.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class VaccinationService : IVaccinationService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMapper _mapper;
		private readonly IAuthenticationService _authenticationService;

		public VaccinationService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
		{
			_unitOfWork = unitOfWork;
			_mapper = mapper;
			_authenticationService = authenticationService;
		}


		public async Task<BasePaginatedList<VaccinationViewDto>> GetVaccinations(string? childId, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize)
		{
			IQueryable<Vaccination> query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(childId) || v.ChildId == childId) && (status == null || v.Status == status) && (scheduleFrom == null || scheduleTo == null || (v.Schedule >= scheduleFrom && v.Schedule <= scheduleTo)))
				.OrderByDescending(v => v.CreatedTime);

			BasePaginatedList<Vaccination> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, pageNumber, pageSize);

			List<VaccinationViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<VaccinationViewDto>).ToList();

			return new BasePaginatedList<VaccinationViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}

		public async Task<BasePaginatedList<object>> GetVaccinationsMinimal(string? childId, DateOnly? scheduleFrom, DateOnly? scheduleTo, VaccinationStatusEnum? status, int pageNumber, int pageSize)
		{
			IQueryable<Vaccination> query = _unitOfWork.GetRepository<Vaccination>().Entities
				.Where(v => (string.IsNullOrWhiteSpace(childId) || v.ChildId == childId) && (status == null || v.Status == status) && (scheduleFrom == null || scheduleTo == null || (v.Schedule >= scheduleFrom && v.Schedule <= scheduleTo)))
				.OrderByDescending(v => v.CreatedTime);

			BasePaginatedList<Vaccination> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Vaccination>().GetPaging(query, pageNumber, pageSize);

			var responseItems = resultQuery.Items.Select(v => new
			{
				v.Id,
				v.Schedule,
				v.Note,
				v.Status,
				Child = new { v.Child.Name },
				Doctor = new { v.Doctor?.Name},
				Vaccinator = new { v.Vaccinator?.Name }
			}).ToList();

			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}
	}
}
