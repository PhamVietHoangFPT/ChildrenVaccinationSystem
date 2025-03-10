using ChildrenVaccinationSystem.Core.Base;
using System.Text.Json;

namespace ChildrenVaccinationSystem.API.Middleware
{
	public class ExceptionMiddleware
	{
		private readonly RequestDelegate _next;
		private readonly ILogger<ExceptionMiddleware> _logger;

		public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger)
		{
			_next = next;
			_logger = logger;
		}

		public async Task Invoke(HttpContext context)
		{
			try
			{
				await _next(context);
			}
			catch (BaseException.ErrorException errorEx)
			{
				_logger.LogError(errorEx, $"ErrorException occurred: {errorEx.ErrorDetail.Message}");

				// Handle any exception that inherits from ErrorException and use its custom status code
				await HandleExceptionAsync(context, errorEx.StatusCode, new
				{
					errorCode = errorEx.ErrorDetail.ErrorCode,
					message = errorEx.ErrorDetail.Message
				});
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, "An unexpected exception occurred.");
				await HandleExceptionAsync(context, StatusCodes.Status500InternalServerError, new
				{
					error = $"An unexpected error occurred. Detail: {ex.Message}"
				});
			}
		}

		private static async Task HandleExceptionAsync(HttpContext context, int statusCode, object result)
		{
			context.Response.StatusCode = statusCode;
			context.Response.ContentType = "application/json";
			await context.Response.WriteAsync(JsonSerializer.Serialize(result));
		}
	}
}
