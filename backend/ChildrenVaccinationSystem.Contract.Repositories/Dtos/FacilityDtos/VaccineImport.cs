using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos
{
	public class VaccineImport
	{
		public string VaccineId { get; set; } = default!;
		public int Stock { get; set; } = default!;
	}
}
