using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Identity.Client;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class AuthenticationService : IAuthenticationService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly IConfiguration _configuration;

		public AuthenticationService(IUnitOfWork unitOfWork, IConfiguration configuration)
		{
			_unitOfWork = unitOfWork;
			_configuration = configuration;
		}

		public Task ForgotPasswordAsync(string email, string userName)
		{
			throw new NotImplementedException();
		}

		public string GenerateJwtToken(Account account)
		{
			if (account == null)
			{
				throw new ArgumentNullException(nameof(account), "User object cannot be null.");
			}

			// Retrieve the JWT secret from configuration
			var secret = _configuration["JwtSettings:Secret"];
			if (string.IsNullOrEmpty(secret))
			{
				throw new ArgumentNullException("JwtSettings:Secret", "JWT Secret not found in configuration.");
			}

			var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
			var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

			// Create claims based on user information, with null checks
			var claims = new List<Claim>
			{
				new Claim(ClaimTypes.NameIdentifier, account.Id),
				new Claim("Id", account.Id),
				new Claim("Name", account.Name),
				new Claim("Email", account.Email),
				new Claim("PhoneNumber", account.PhoneNumber ?? string.Empty),
				new Claim("Address", account.Address ?? string.Empty),
				new Claim("Role", account.Role.ToString())
			};

			// Retrieve the token expiry period from configuration, handle parsing errors
			if (!int.TryParse(_configuration["JwtSettings:ExpiryInDays"], out var expiryInDays))
			{
				expiryInDays = 1; // Default to 1 day if parsing fails or value is not set
			}

			// Create and return the JWT token
			var token = new JwtSecurityToken(
				claims: claims,
				expires: DateTime.UtcNow.AddDays(expiryInDays),
				signingCredentials: creds
			);

			return new JwtSecurityTokenHandler().WriteToken(token);
		}

		public async Task<string?> LoginAsync(LoginDto loginDto)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.Email == loginDto.Email || a.PhoneNumber == loginDto.PhoneNumber).FirstOrDefaultAsync();

			if (account != null && BCrypt.Net.BCrypt.Verify(loginDto.Password, account.Password))
			{
				return null;
			}

			return GenerateJwtToken(account!);

		}

		public Task RegisterAsync(RegisterDto registerDto)
		{
			throw new NotImplementedException();
		}

		public Task ResetPasswordAsync(string token, string newPassword)
		{
			throw new NotImplementedException();
		}

		public Task VerifyEmailAsync(string token)
		{
			throw new NotImplementedException();
		}

		public Task VerifyResetPasswordTokenAsync(string token)
		{
			throw new NotImplementedException();
		}
	}
}
