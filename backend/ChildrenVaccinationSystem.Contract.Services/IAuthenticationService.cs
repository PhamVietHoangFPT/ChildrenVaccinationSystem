using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IAuthenticationService
	{
		Task<string?> LoginAsync(LoginDto loginDto);
		Task<bool> RegisterAsync(RegisterDto registerDto);
		Task<bool> VerifyAccountAsync(string token);
		Task ForgotPasswordAsync(string email, string userName);
		Task ResetPasswordAsync(string token, string newPassword);
		Task VerifyResetPasswordTokenAsync(string token);
	}
}
