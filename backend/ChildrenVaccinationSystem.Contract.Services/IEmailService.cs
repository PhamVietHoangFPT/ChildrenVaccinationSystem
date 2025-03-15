namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IEmailService
	{
		Task SendVerificationEmail(string email, string verificationToken);
		Task SendResetPasswordEmail(string email, string resetToken);
		Task SendUpdateEmailEmail(string newEmail, string otp);
	}
}
