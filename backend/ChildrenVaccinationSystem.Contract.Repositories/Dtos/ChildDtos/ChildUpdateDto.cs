using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos
{
	public class ChildUpdateDto
	{
		public double? Height { get; set; }
		public double? Weight { get; set; }
		public string? MedicalNote { get; set; }

	}
}
