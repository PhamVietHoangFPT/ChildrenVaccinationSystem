using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IAuthenticationService
	{
		Task<string?> LoginAsync(LoginDto loginDto);
		Task RegisterAsync(RegisterDto registerDto);
		Task VerifyEmailAsync(string token);
		Task ForgotPasswordAsync(string email, string userName);
		Task ResetPasswordAsync(string token, string newPassword);
		Task VerifyResetPasswordTokenAsync(string token);
		string GenerateJwtToken(Account account);
	}
}
