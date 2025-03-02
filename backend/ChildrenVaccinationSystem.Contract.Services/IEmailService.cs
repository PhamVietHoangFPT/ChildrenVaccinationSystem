namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IEmailService
	{
		Task SendVerificationEmailAsync(string email, string verificationToken);
	}
}
