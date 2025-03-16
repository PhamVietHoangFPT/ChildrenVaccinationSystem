using ChildrenVaccinationSystem.Contract.Repositories.Dtos.InstallmentDtos;
using ChildrenVaccinationSystem.Core.Enum;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos
{
	public class VaccinationViewDto
	{
		public string Id { get; set; } = default!;
		public double TotalPrice { get; set; }
		public DateOnly Schedule { get; set; }
		public string? Note { get; set; }
		public VaccinationStatusEnum Status { get; set; }
		public PaymentTypeEnum? PaymentType { get; set; }
		public PaymentLocationEnum? PaymentLocation { get; set; }
		public PaymentMethodEnum? PaymentMethod { get; set; }

		public SimpleViewDto Child { get; set; } = default!;
		public SimpleViewDto? Doctor { get; set; }
		public SimpleViewDto? Vaccinator { get; set; }
		public SimpleViewDto Vaccine { get; set; } = default!;
	}
}
