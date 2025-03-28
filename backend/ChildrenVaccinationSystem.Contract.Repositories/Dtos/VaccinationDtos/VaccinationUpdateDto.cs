using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos
{
	public class VaccinationUpdateDto
	{
		public DateOnly? Schedule {  get; set; }
		public string? Note { get; set; }
		public int CurrentSequence { get; set; }
		public string? DoctorId { get; set; }
		public string? VaccinatorId { get; set; }
	}
}
