using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IAuthenticationService
	{
		Task<string> Login(LoginDto loginDto);
		Task Register(RegisterDto registerDto);
		Task<bool> VerifyAccount(string token);
		Task ForgotPassword(string email, string userName);
		Task ResetPassword(string token, string newPassword);
		Task VerifyResetPasswordToken(string token);
		void UpdateAudits(BaseEntity entity, bool isCreating, bool isDeleting = false);
		string GetCurrentAccountId();
		string GetCurrentRole();
		bool AuthorizeManager();
		bool AuthorizeStaff();
		bool AuthorizeDoctor();
		bool AuthorizeVaccinator();
		bool AuthorizeCustomer();
	}
}
