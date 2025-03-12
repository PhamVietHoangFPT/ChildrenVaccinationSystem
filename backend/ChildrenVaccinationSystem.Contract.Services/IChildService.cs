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
		Task<BasePaginatedList<ChildViewDto>> GetMyChildren();
		Task<BasePaginatedList<ChildViewDto>> GetChildren();
		Task AddChildProfile(ChildCreateDto childCreateDto);
		Task UpdateChildProfile(string id, ChildUpdateDto childUpdateDto);
	}
}
