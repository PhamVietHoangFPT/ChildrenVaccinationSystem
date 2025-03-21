using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos
{
	public class FacilityImportDto
	{
		public List<VaccineImport> VaccineImports { get; set; } = default!;

	}
}
