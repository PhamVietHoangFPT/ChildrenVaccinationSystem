using ChildrenVaccinationSystem.Core.Enum;
using ChildrenVaccinationSystem.Core.Utils;

namespace ChildrenVaccinationSystem.Core.Base
{
	public class BaseResponse<T>
	{
		public T? Data { get; set; }
		public string? Message { get; set; }
		public StatusCodeEnum StatusCode { get; set; }
		public string? Code { get; set; }
		public BaseResponse(StatusCodeEnum statusCode, string code, T? data, string? message)
		{
			Data = data;
			Message = message;
			StatusCode = statusCode;
			Code = code;
		}

		public BaseResponse(StatusCodeEnum statusCode, string code, T? data)
		{
			Data = data;
			StatusCode = statusCode;
			Code = code;
		}

		public BaseResponse(StatusCodeEnum statusCode, string code, string? message)
		{
			Message = message;
			StatusCode = statusCode;
			Code = code;
		}

		public static BaseResponse<T> OkResponse(T? data)
		{
			return new BaseResponse<T>(StatusCodeEnum.OK, StatusCodeEnum.OK.Name(), data);
		}
		public static BaseResponse<T> OkResponse(string? mess)
		{
			return new BaseResponse<T>(StatusCodeEnum.OK, StatusCodeEnum.OK.Name(), mess);
		}
	}
}
