using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IPackageService
	{
        Task CreatePackage(PackageCreateDto packageCreateDto);
        Task DeletePackage(string id);
        Task UpdatePackage(string id, PackageUpdateDto packageUpdateDto);
        Task RemoveVaccineFromPackage(string packageId, string vaccineId);
        Task AddVaccineToPackage(string packageId, string vaccineId);
        Task<BasePaginatedList<PackageViewDto>> GetPackages(string? name, int pageNumber, int pageSize);
        Task<BasePaginatedList<object>> GetPackagesMinimal(int pageNumber, int pageSize);
		Task<PackageViewDto> GetPackageById(string id);   
        
    }
}
