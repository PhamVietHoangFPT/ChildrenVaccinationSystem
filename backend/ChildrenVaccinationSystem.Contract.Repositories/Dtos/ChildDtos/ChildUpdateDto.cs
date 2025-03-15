using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos
{
	public class ChildUpdateDto
	{
		public string? Name { get; set; }
		public DateOnly? DateOfBirth { get; set; }
		public bool? Gender { get; set; }
		public double? Height { get; set; }
		public double? Weight { get; set; }
		public string? MedicalNote { get; set; }

	}
}