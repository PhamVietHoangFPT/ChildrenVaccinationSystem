using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Services
{
	public interface IVnPayService
	{
		string CreatePaymentUrlVnPay(HttpContext context, List<Vaccination> vaccinations, double price, int code);

		VnPayResponseDto PaymentExecuteVnPay(IQueryCollection collections);
		Task InsertVaccinationsData(string orderInfo);
	}

	public class VnPayResponseDto
	{
		public bool Success { get; set; }
		public string OrderInfo { get; set; } = string.Empty;
		public string VnPayResponseCode { get; set; } = string.Empty;
	}
}
