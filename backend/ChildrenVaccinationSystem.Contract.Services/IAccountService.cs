using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IAccountService
	{
		Task<string> LoginAsync(LoginDto loginDto);
		Task RegisterAsync(RegisterDto registerDto);
		Task<bool> VerifyAccountAsync(string token);
		Task ForgotPasswordAsync(string email, string userName);
		Task ResetPasswordAsync(string token, string newPassword);
		Task VerifyResetPasswordTokenAsync(string token);
		void UpdateAudits(BaseEntity entity, bool isCreating, bool isDeleting = false);
	}
}
