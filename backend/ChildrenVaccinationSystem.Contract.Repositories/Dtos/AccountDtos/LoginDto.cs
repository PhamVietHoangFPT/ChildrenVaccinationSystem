namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class LoginDto
	{
		public string Email { get; set; } = default!;
		public string PhoneNumber { get; set; } = default!;
		public string Password { get; set; } = default!;
	}
}
