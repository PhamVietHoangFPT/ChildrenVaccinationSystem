using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using static ChildrenVaccinationSystem.Core.Base.BaseException;
using System.Net;
using System.Text.Json;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Services;
using System.IdentityModel.Tokens.Jwt;

namespace ChildrenVaccinationSystem.API.Middleware
{
	public class PermissionMiddleware
	{
		private readonly RequestDelegate _next;
		private readonly ILogger<PermissionMiddleware> _logger;
		private readonly Dictionary<string, Dictionary<string, List<string>>> _rolePermissions;
		private readonly Dictionary<string, List<string>> _excludedUris;
		public PermissionMiddleware(RequestDelegate next, ILogger<PermissionMiddleware> logger)
		{
			_next = next;
			_logger = logger;
			_excludedUris = new()
			{
				{ "GET", new() { "/api/examples", "/api/examples2", "/api/authentication/verify-account" } },
				{ "POST", new() { "/api/examples", "/api/examples2", "/api/authentication/login", "/api/authentication/register" } },
				{ "PUT", new() { "/api/examples", "/api/examples2" } },
				{ "PATCH", new() { "/api/examples", "/api/examples2" } },
				{ "DELETE", new() { "/api/examples", "/api/examples2" } },
				{ "CONTROLLER", new() { "/api/examples", "/api/examples2" } }
			};
			_rolePermissions = new()
			{
				{
					"Staff", new()
					{
						{ "GET", new() { "/api/examples", "/api/examples2", "/api/categories" } },
						{ "POST", new() { "/api/examples", "/api/examples2" } },
						{ "PUT", new() { "/api/examples", "/api/examples2" } },
						{ "PATCH", new() { "/api/examples", "/api/examples2" } },
						{ "DELETE", new() { "/api/examples", "/api/examples2" } },
						{ "CONTROLLER", new() { "/api/examples", "/api/examples2" } }
					}

				},
				{
					"Doctor", new()
					{
						{ "GET", new() { "/api/examples", "/api/examples2", "/api/categories" } },
						{ "POST", new() { "/api/examples", "/api/examples2" } },
						{ "PUT", new() { "/api/examples", "/api/examples2" } },
						{ "PATCH", new() { "/api/examples", "/api/examples2" } },
						{ "DELETE", new() { "/api/examples", "/api/examples2" } },
						{ "CONTROLLER", new() { "/api/examples", "/api/examples2" } }
					}

				},
				{
					"Vaccinator", new()
					{
						{ "GET", new() { "/api/examples", "/api/examples2" } },
						{ "POST", new() { "/api/examples", "/api/examples2" } },
						{ "PUT", new() { "/api/examples", "/api/examples2" } },
						{ "PATCH", new() { "/api/examples", "/api/examples2" } },
						{ "DELETE", new() { "/api/examples", "/api/examples2" } },
						{ "CONTROLLER", new() { "/api/examples", "/api/examples2" } }
					}

				},
				{
					"Customer", new()
					{
						{ "GET", new() { "/api/examples", "/api/examples2" } },
						{ "POST", new() { "/api/examples", "/api/examples2" } },
						{ "PUT", new() { "/api/examples", "/api/examples2" } },
						{ "PATCH", new() { "/api/examples", "/api/examples2" } },
						{ "DELETE", new() { "/api/examples", "/api/examples2" } },
						{ "CONTROLLER", new() { "/api/examples", "/api/examples2" } }
					}

				},
			};




		}

		public async Task Invoke(HttpContext context, IUnitOfWork unitOfWork)
		{
			if (HasPermission(context))
			{
				await _next(context);
			}
			else
			{
				await HandleForbiddenRequest(context);
			}
		}

		private bool HasPermission(HttpContext context)
		{
			string requestUri = context.Request.Path.Value!;
			string requestMethod = context.Request.Method;

			// Skip further checks for non-API endpoints
			if (!requestUri.StartsWith("/api/"))
				return true;

			// 1. Check excluded URIs accessible to everyone regardless of role
			if (_excludedUris.TryGetValue(requestMethod, out var allowedUris))
			{
				// If the URI is part of the excluded URIs for the method, allow access
				if (allowedUris.Any(uri => requestUri.StartsWith(uri, StringComparison.OrdinalIgnoreCase)))
					return true;
			}

			// 2. Check controller-wide access for excluded URIs (for any method)
			if (_excludedUris.TryGetValue("CONTROLLER", out var controllerUris))
			{
				// Check if the URI starts with any of the controller base URIs
				if (controllerUris.Any(controllerUri => requestUri.StartsWith(controllerUri, StringComparison.OrdinalIgnoreCase)))
					return true;
			}


			try
			{
				// 3. Get the user's role from the context
				string role = AuthenticationService.GetUserRoleFromHttpContext(context);

				// If the user role is "admin", allow access to all endpoints
				if (role == "Manager")
					return true;

				// 4. Check role-based permissions for the specific API
				if (_rolePermissions.TryGetValue(role, out var methodPermissions))
				{
					// Check if the method (GET, POST, etc.) exists for the user's role
					if (methodPermissions.TryGetValue(requestMethod, out var allowedUrisForRole))
					{
						// Check if the requestUri starts with any of the allowed URIs
						if (allowedUrisForRole.Any(uri => requestUri.StartsWith(uri, StringComparison.OrdinalIgnoreCase)))
							return true;
					}

					// 5. Check if the role has controller-wide access
					if (methodPermissions.TryGetValue("CONTROLLER", out var controllerUrisForRole))
					{
						if (controllerUrisForRole.Any(controllerUri => requestUri.StartsWith(controllerUri, StringComparison.OrdinalIgnoreCase)))
							return true;
					}
				}
				return false;
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, "Error while checking permissions");
				return false;
			}
		}

		public static async Task HandleForbiddenRequest(HttpContext context)
		{
			var errorResponse = new
			{
				errorCode = "forbidden",
				message = "Bạn không có quyền truy cập tính năng này"
			};

			string result = JsonSerializer.Serialize(errorResponse);

			context.Response.ContentType = "application/json";
			context.Response.StatusCode = StatusCodes.Status403Forbidden;

			await context.Response.WriteAsync(result);
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


	}
}
