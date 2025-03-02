using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Core.Utils;
using Microsoft.AspNetCore.Http;
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
		private readonly IHttpContextAccessor _httpContextAccessor;
		private readonly IEmailService _emailService;

		public AuthenticationService(IUnitOfWork unitOfWork, IConfiguration configuration, IHttpContextAccessor httpContextAccessor, IEmailService emailService)
		{
			_unitOfWork = unitOfWork;
			_configuration = configuration;
			_httpContextAccessor = httpContextAccessor;
			_emailService = emailService;
		}

		

		public Task ForgotPasswordAsync(string email, string userName)
		{
			throw new NotImplementedException();
		}


		public async Task<string?> LoginAsync(LoginDto loginDto)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.Email == loginDto.Email || a.PhoneNumber == loginDto.PhoneNumber)
				.FirstOrDefaultAsync();

			if (account == null || !BCrypt.Net.BCrypt.Verify(loginDto.Password, account.Password) || account.VerificationToken != null)
			{
				return null;
			}

			return GenerateJwtToken(account!);
		}

		public async Task<bool> RegisterAsync(RegisterDto registerDto)
		{
			// Check if the user already exists
			var existingAccount = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.Email == registerDto.Email && a.DeletedBy == null)
				.FirstOrDefaultAsync();
			if (existingAccount != null)
			{
				return false;
			}

			// Hash the password
			var hashedPassword = BCrypt.Net.BCrypt.HashPassword(registerDto.Password);

			// Create new user entity
			Account newCustomer = new()
			{
				Name = registerDto.Name,
				Password = hashedPassword,
				Email = registerDto.Email,
				Role = RoleEnum.Customer,
				VerificationToken = Guid.NewGuid().ToString()
			};

			newCustomer.CreatedBy = newCustomer.Id;
			newCustomer.LastUpdatedBy = newCustomer.Id;

			// Save account to the database
			await _unitOfWork.GetRepository<Account>().InsertAsync(newCustomer);
			await _unitOfWork.SaveAsync();

			// Send verification email
			await _emailService.SendVerificationEmailAsync(registerDto.Email, newCustomer.VerificationToken);
			return true;
		}

		public Task ResetPasswordAsync(string token, string newPassword)
		{
			throw new NotImplementedException();
		}

		public async Task<bool> VerifyAccountAsync(string token)
		{

			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.VerificationToken == token).FirstOrDefaultAsync();

			if (account == null) 
			{
				return false;
			}

			account.VerificationToken = null;

			await _unitOfWork.SaveAsync();

			return true;
		}

		public Task VerifyResetPasswordTokenAsync(string token)
		{
			throw new NotImplementedException();
		}


		public void UpdateAudits(BaseEntity entity, bool isCreating = false, bool isDeleting = false)
		{
			// Retrieve the JWT token from the Authorization header
			var token = _httpContextAccessor.HttpContext?.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
			var currentUserId = GetUserIdFromTokenHeader(token);

			// If creating a new entity, set the CreatedBy field
			if (isCreating)
			{
				entity.CreatedBy = currentUserId.ToUpper(); // Set the creator's ID
			}

			if (isDeleting)
			{
				entity.DeletedBy = currentUserId.ToUpper(); // Set the creator's ID
				entity.DeletedTime = CoreHelper.SystemTimeNow;
			}

			// Always set LastUpdatedBy and LastUpdatedTime fields
			entity.LastUpdatedBy = currentUserId.ToUpper(); // Set the current user's ID

			// If is not created then update LastUpdatedTime
			if (isCreating is false)
			{
				entity.LastUpdatedTime = CoreHelper.SystemTimeNow;
			}
		}

		public string GetUserIdFromTokenHeader(string? token)
		{
			// Check if the token is null or empty
			if (string.IsNullOrEmpty(token))
			{
				return string.Empty; // Handle null or empty token gracefully
			}

			// Decode the JWT token and extract claims
			var principal = DecodeJwtToken(token);

			if (principal == null)
			{
				return string.Empty; // Handle null principal gracefully
			}

			// Extract claims from the principal
			var userIdClaim = principal.Claims.FirstOrDefault(c => c.Type == "userId");

			if (userIdClaim != null && Guid.TryParse(userIdClaim.Value, out Guid parsedUserID))
			{
				return parsedUserID.ToString();
			}

			return string.Empty;
		}


		public ClaimsPrincipal DecodeJwtToken(string token)
		{
			// Retrieve the JWT secret from configuration
			var secret = _configuration["JwtSettings:Secret"] ?? throw new ArgumentNullException("JwtSettings:Secret");
			var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));

			// Set up token validation parameters
			var tokenHandler = new JwtSecurityTokenHandler();
			var validationParameters = new TokenValidationParameters
			{
				ValidateIssuerSigningKey = true,
				IssuerSigningKey = key,
				ValidateIssuer = false,
				ValidateAudience = false,
				ValidateLifetime = true
			};

			try
			{
				// Validate the token and return the claims principal
				var principal = tokenHandler.ValidateToken(token, validationParameters, out var validatedToken);
				return principal;
			}
			catch (SecurityTokenExpiredException)
			{
				throw new SecurityTokenException("Token has expired");
			}
			catch (SecurityTokenInvalidSignatureException)
			{
				throw new SecurityTokenException("Invalid token signature");
			}
			catch (Exception)
			{
				throw new SecurityTokenException("Invalid token");
			}
		}

		private string GenerateJwtToken(Account account)
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

	}
}
