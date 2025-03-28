using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
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
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Tls;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using static ChildrenVaccinationSystem.Core.Base.BaseException;

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

		public async Task<string> Login(LoginDto loginDto)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => (a.Email == loginDto.Email || a.PhoneNumber == loginDto.PhoneNumber) && a.DeletedBy == null)
				.FirstOrDefaultAsync();

			if (account == null || !BCrypt.Net.BCrypt.Verify(loginDto.Password, account.Password))
			{
				throw new BaseException.ErrorException(401, "unauthorized", "Sai mật khẩu hoặc tài khoản");
			}

			if (account.VerificationToken != null)
			{
				throw new BaseException.ErrorException(403, "forbidden", "Tài khoản chưa được xác thực, khách hàng vui lòng kiểm tra hộp mail");
			}

			return GenerateJwtToken(account);
		}

		public async Task Register(RegisterDto registerDto)
		{
			// Check if the user already exists
			var existingAccount = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.Email == registerDto.Email && a.DeletedBy == null)
				.FirstOrDefaultAsync();
			if (existingAccount != null)
			{
				throw new BaseException.ErrorException(409, "conflict", "Email này đã được sử dụng, vui lòng thử lại");
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
			newCustomer.EmailLastUpdatedTime = newCustomer.CreatedTime;
			// Save account to the database
			await _unitOfWork.GetRepository<Account>().InsertAsync(newCustomer);
			await _unitOfWork.SaveAsync();

			// Send verification email
			await _emailService.SendVerificationEmail(registerDto.Email, newCustomer.VerificationToken);
		}

		public async Task<bool> VerifyAccount(string token)
		{

			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.VerificationToken == token).FirstOrDefaultAsync();

			if (account == null)
			{
				throw new ErrorException(502, "bad_gateway", "Token is not valid or is expired");
			}

			account.VerificationToken = null;

			await _unitOfWork.SaveAsync();

			return true;
		}
		public async Task ForgetPassword(string email)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.Email == email && a.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null)
				throw new ErrorException(401, "unauthorized", "Không tìm thấy email trong hệ thống");

			account.ResetPasswordToken = Guid.NewGuid().ToString();

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.SaveAsync();
			await _emailService.SendResetPasswordEmail(email, account.ResetPasswordToken);
		}

		public async Task VerifyResetPassowrd(string token)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities.Where(a => a.ResetPasswordToken == token).FirstOrDefaultAsync();

			if (account == null)
			{
				throw new ErrorException(502, "bad_gateway", "Đường dẫn đổi mật khẩu đã hết hạn, vui lòng thử lại sau");
			}
		}

		public async Task ResetPassword(string token, string newPassword)
		{
			Account? account = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.ResetPasswordToken == token && a.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null)
				throw new ErrorException(502, "bad_gateway", "Đường dẫn đổi mật khẩu đã hết hạn, vui lòng thử lại sau");

			var hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);
			account.Password = hashedPassword;
			account.ResetPasswordToken = null;

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.SaveAsync();
		}

		public async Task UpdatePassword(string password, string newPassword)
		{
			string accountId = GetCurrentAccountId();

			Account? account = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.Id == accountId && a.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null)
				throw new ErrorException(401, "unauthorized", "Không tìm thấy account id.");

			if (!BCrypt.Net.BCrypt.Verify(password, account.Password))
			{
				throw new ErrorException(401, "unauthorized", "Mật khẩu hiện tại không chính xác. Vui lòng thử lại.");
			}

			// Hash the password
			var hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);

			account.Password = hashedPassword;

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.SaveAsync();
		}

		public async Task UpdateEmail(string newEmail)
		{
			string accountId = GetCurrentAccountId();

			Account? account = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.Id == accountId && a.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null)
				throw new ErrorException(401, "unauthorized", "Không tìm thấy account id.");

			var existingAccount = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.Email == newEmail && a.DeletedBy == null)
				.FirstOrDefaultAsync();
			if (existingAccount != null)
			{
				throw new BaseException.ErrorException(409, "conflict", "Email này đã được sử dụng, vui lòng thử lại");
			}

			account.TempUpdateEmail = newEmail;
			account.UpdateEmailOTP = new Random().Next(100000, 999999).ToString();

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.SaveAsync();
			await _emailService.SendUpdateEmailEmail(newEmail, account.UpdateEmailOTP);
		}

		public async Task ConfirmUpdateEmail(string otp)
		{
			string accountId = GetCurrentAccountId();

			Account? account = await _unitOfWork.GetRepository<Account>().Entities
				.Where(a => a.Id == accountId && a.DeletedBy == null).FirstOrDefaultAsync();

			if (account == null)
				throw new ErrorException(401, "unauthorized", "Không tìm thấy account id.");

			if (account.UpdateEmailOTP == null || account.TempUpdateEmail == null || account.UpdateEmailOTP != otp)
				throw new ErrorException(401, "unauthorized", "Mã OTP không đúng hoặc hết hạn!");

			account.UpdateEmailOTP = null;
			account.Email = account.TempUpdateEmail;
			account.TempUpdateEmail = null;
			account.EmailLastUpdatedTime = CoreHelper.SystemTimeNow;

			await _unitOfWork.GetRepository<Account>().UpdateAsync(account);
			await _unitOfWork.SaveAsync();
		}

		public void UpdateAudits(BaseEntity entity, bool isCreating, bool isDeleting = false)
		{
			// Retrieve the JWT token from the Authorization header
			var token = _httpContextAccessor.HttpContext?.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
			var currentUserId = GetAccountIdFromTokenHeader(token);

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

		public string GetAccountIdFromTokenHeader(string? token)
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
			var accountIdClaim = principal.Claims.FirstOrDefault(c => c.Type == "Id");

			if (accountIdClaim != null && Guid.TryParse(accountIdClaim.Value, out Guid parsedAccountId))
			{
				return parsedAccountId.ToString();
			}

			return string.Empty;
		}
		public string GetCurrentAccountId()
		{
			var token = _httpContextAccessor.HttpContext?.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

			return GetAccountIdFromTokenHeader(token);
		}

		public string GetRoleFromTokenHeader(string? token)
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
			var roleClaim = principal.Claims.FirstOrDefault(c => c.Type == "Role");

			if (roleClaim != null && Guid.TryParse(roleClaim.Value, out Guid parsedRole))
			{
				return parsedRole.ToString();
			}

			return string.Empty;
		}
		public static string GetUserRoleFromHttpContext(HttpContext httpContext)
		{
			try
			{
				string? authorizationHeader = httpContext.Request.Headers["Authorization"];

				string jwtToken = authorizationHeader!["Bearer ".Length..].Trim();

				var tokenHandler = new JwtSecurityTokenHandler();

				var token = tokenHandler.ReadJwtToken(jwtToken);
				var roleClaim = token.Claims.FirstOrDefault(claim => claim.Type == "Role");
				return roleClaim!.Value;
			}
			catch (ErrorException ex)
			{
				var errorResponse = new
				{
					data = "An unexpected error occurred.",
					message = ex.Message,
					statusCode = StatusCodes.Status401Unauthorized,
					code = "Unauthorized!"
				};

				var jsonResponse = System.Text.Json.JsonSerializer.Serialize(errorResponse);

				httpContext.Response.StatusCode = StatusCodes.Status401Unauthorized;
				httpContext.Response.ContentType = "application/json";
				httpContext.Response.WriteAsync(jsonResponse).Wait();

				throw; // Re-throw the exception to maintain the error flow
			}
		}
		public string GetCurrentRole()
		{
			var token = _httpContextAccessor.HttpContext?.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

			return GetRoleFromTokenHeader(token);
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
				new Claim("Email", account.Email ?? ""),
				new Claim("FacilityId", account.Facility?.Id ?? ""),
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
