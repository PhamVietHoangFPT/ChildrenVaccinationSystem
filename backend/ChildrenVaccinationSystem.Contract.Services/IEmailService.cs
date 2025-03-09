namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IEmailService
	{
		Task SendVerificationEmail(string email, string verificationToken);
	}
}
