using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IChildService
	{
		Task<BasePaginatedList<ChildViewDto>> GetChildren(string? parentId, string? name, string? parentPhoneNumber, int pageNumber, int pageSize);
		Task<BasePaginatedList<object>> GetChildrenMinimal(string? parentId, string? name, string? parentPhoneNumber, int pageNumber, int pageSize);
		Task<ChildViewDto> GetChildById(string id);
		Task AddChildProfile(string parentId, ChildCreateDto childCreateDto);
		Task UpdateChildProfile(string id, ChildUpdateDto childUpdateDto);
		string GenerateChildCode();
	}
}
