namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos
{
	public class RegisterDto
	{
		public string Name { get; set; } = default!;
		public string Email { get; set; } = default!;
		public string Password { get; set; } = default!;
	}
}
