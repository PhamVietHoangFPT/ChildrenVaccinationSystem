using ChildrenVaccinationSystem.Core.Enum;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.InstallmentDtos
{
	public class InstallmentViewDto
	{
		public string Id { get; set; } = default!;
		public double Amount { get; set; }
		public int PaymentNumber { get; set; }
		public DateTimeOffset DueDate { get; set; }
		public DateTimeOffset PayDate { get; set; }
		public InstallmentStatusEnum Status { get; set; }
		public SimpleViewDto Vaccination { get; set; } = default!;
	}
}
