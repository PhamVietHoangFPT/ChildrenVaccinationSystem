using AutoMapper;
using ChildrenVaccinationSystem.Contract;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Utils;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
    public class PackageService : IPackageService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly IAuthenticationService _authenticationService;

        public PackageService(IUnitOfWork unitOfWork, IMapper mapper, IAuthenticationService authenticationService)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _authenticationService = authenticationService;
        }

        public async Task CreatePackage(PackageCreateDto packageCreateDto)
        {
            Package package = new Package();
            _mapper.Map(packageCreateDto, package);
            _authenticationService.UpdateAudits(package, true);

            await _unitOfWork.GetRepository<Package>().InsertAsync(package);
            await _unitOfWork.SaveAsync();
        }

        public async Task DeletePackage(string id)
        {
            var package = await _unitOfWork.GetRepository<Package>().Entities
                .Where(p => p.Id == id && p.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (package == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy package id");

            _authenticationService.UpdateAudits(package, false, true);
            await _unitOfWork.SaveAsync();
        }

        public async Task UpdatePackage(string id, PackageUpdateDto packageUpdateDto)
        {

            var package = await _unitOfWork.GetRepository<Package>().Entities
                .Where(p => p.Id == id && p.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (package == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy package id");

            _mapper.Map(packageUpdateDto, package);
            _authenticationService.UpdateAudits(package, false);

            await _unitOfWork.GetRepository<Package>().UpdateAsync(package);
            await _unitOfWork.SaveAsync();
        }

        public async Task<BasePaginatedList<PackageViewDto>> GetPackages(string? name, int pageNumber, int pageSize)
        {
            IQueryable<Package> query = _unitOfWork.GetRepository<Package>().Entities
                .Where(p => (string.IsNullOrWhiteSpace(name) || p.Name.Contains(name)) && p.DeletedBy == null);


            BasePaginatedList<Package> resultQuery = (pageNumber <= 0 || pageSize <= 0)
                ? await _unitOfWork.GetRepository<Package>().GetPaging(query, 1, query.Count())
                : await _unitOfWork.GetRepository<Package>().GetPaging(query, pageNumber, pageSize);

            List<PackageViewDto> responseItems = resultQuery.Items.Select(_mapper.Map<PackageViewDto>).ToList();

            return new BasePaginatedList<PackageViewDto>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
        }

		public async Task<BasePaginatedList<object>> GetPackagesMinimal(int pageNumber, int pageSize)
		{
			IQueryable<Package> query = _unitOfWork.GetRepository<Package>().Entities.Where(p => p.DeletedBy == null);

			BasePaginatedList<Package> resultQuery = (pageNumber <= 0 || pageSize <= 0)
				? await _unitOfWork.GetRepository<Package>().GetPaging(query, 1, query.Count())
				: await _unitOfWork.GetRepository<Package>().GetPaging(query, pageNumber, pageSize);

			var responseItems = resultQuery.Items.Select(v => new
			{
				v.Id,
				v.Name,
                v.Price
			}).ToList();

			return new BasePaginatedList<object>(responseItems, resultQuery.TotalItems, resultQuery.CurrentPage, resultQuery.PageSize);
		}


		public async Task<PackageViewDto> GetPackageById(string id)
        {
            var package = await _unitOfWork.GetRepository<Package>().Entities
                .Where(p => p.Id == id && p.DeletedBy == null)
                .FirstOrDefaultAsync();

            if (package == null)
                throw new BaseException.ErrorException(404, "not_found", "Không tìm thấy package id");

            // Map sang DTO
            return _mapper.Map<PackageViewDto>(package);
        }
    }
}