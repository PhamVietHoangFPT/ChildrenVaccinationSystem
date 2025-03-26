using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class DashboardService
	{
		private readonly IUnitOfWork _unitOfWork;
		
		public DashboardService(IUnitOfWork unitOfWork)
		{
			_unitOfWork = unitOfWork;
		}

		//public async Task<long> GetVaccinationsAdministered()
		//{

		//}


	}
}
