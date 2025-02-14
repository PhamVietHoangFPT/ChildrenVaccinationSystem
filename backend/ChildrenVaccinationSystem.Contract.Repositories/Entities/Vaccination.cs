using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
	public class Vaccination : BaseEntity
	{
		public double TotalPrice { get; set; }
		public DateOnly Schedule {  get; set; }
		public string? Note { get; set; }
		public VaccinationStatusEnum Status { get; set; }
		public PaymentTypeEnum? PaymentType { get; set; }
		public PaymentLocationEnum? PaymentLocation { get; set; }
		public PaymentMethodEnum? PaymentMethod { get; set; }

		public string ChildId { get; set; } = default!;
		public virtual Child Child { get; set; } = default!;
		public string? DoctorId { get; set; }
		public virtual Account? Doctor { get; set; }
		public string? VaccinatorId { get; set; }
		public virtual Account? Vaccinator { get; set; }
		public virtual ICollection<VaccinationDetail>? VaccinationDetails { get; set; }
		public virtual ICollection<Installment>? Installments { get; set; }
	}
}