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
		Task ForgetPassword(string email);
		Task VerifyResetPassowrd(string token);
		Task ResetPassword(string token, string newPassword);
		Task UpdatePassword(string password, string newPassword);
		Task UpdateEmail(string newEmail);
		Task ConfirmUpdateEmail(string otp);
		void UpdateAudits(BaseEntity entity, bool isCreating, bool isDeleting = false);
		string GetCurrentAccountId();
		string GetCurrentRole();
	}
}
