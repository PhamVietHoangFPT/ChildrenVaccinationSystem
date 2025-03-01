using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using System;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Installment : BaseEntity
	{
		public double Amount { get; set; }
		public int PaymentNumber { get; set; }
		public DateTimeOffset DueDate { get; set; }
		public DateTimeOffset PayDate { get; set; }
		public InstallmentStatusEnum Status { get; set; }

		public string VaccinationId { get; set; } = null!;
		public virtual Vaccination Vaccination { get; set; } = null!;
	}
}