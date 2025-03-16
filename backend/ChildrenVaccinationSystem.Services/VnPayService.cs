using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Core.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class VnPayService : IVnPayService
	{
		private readonly IConfiguration _config;
		private readonly IUnitOfWork _unitOfWork;
		private readonly IMemoryCache _cache;


		public VnPayService(IConfiguration config, IUnitOfWork unitOfWork, IMemoryCache cache)
		{
			_config = config;
			_unitOfWork = unitOfWork;
			_cache = cache;
		}

		public string CreatePaymentUrl(HttpContext context, List<Vaccination> vaccinations, double price)
		{
			// Get logged in User
			//User currentUser = await _userService.GetCurrentUserAsync();

			//IQueryable<Order> query = _unitOfWork.GetRepository<Order>().Entities.Where(o => o.CustomerId == currentUser.Id && o.Status == PaymentStatusHelper.CART.ToString());

			//if (!query.Any()) throw new BaseException.BadRequestException("invalid_argument", "You have no items in your cart");

			//var cart = query.First();

			string vaccinationsJson = JsonSerializer.Serialize(vaccinations);
			string uniqueKey = Guid.NewGuid().ToString("N"); // Generate short key

			// Store data in cache for 10 minutes
			_cache.Set(uniqueKey, vaccinationsJson, TimeSpan.FromMinutes(5));

			var tick = DateTime.Now.Ticks.ToString();

			VnPayHelper vnpay = new();


			vnpay.AddRequestData("vnp_Version", _config["VnPay:Version"]!);
			vnpay.AddRequestData("vnp_Command", _config["VnPay:Command"]!);
			vnpay.AddRequestData("vnp_TmnCode", _config["VnPay:TmnCode"]!);
			vnpay.AddRequestData("vnp_Amount", (price * 100).ToString());
			//Số tiền thanh toán. Số tiền không 
			//mang các ký tự phân tách thập phân, phần nghìn, ký tự tiền tệ. Để gửi số tiền thanh toán là 100,000 VND
			//(một trăm nghìn VNĐ) thì merchant cần nhân thêm 100 lần(khử phần thập phân), sau đó gửi sang VNPAY
			//là: 10000000

			vnpay.AddRequestData("vnp_CreateDate", CoreHelper.SystemTimeNow.ToString("yyyyMMddHHmmss"));
			vnpay.AddRequestData("vnp_CurrCode", _config["VnPay:CurrCode"]!);
			vnpay.AddRequestData("vnp_IpAddr", Utils.GetIpAddress(context));
			vnpay.AddRequestData("vnp_Locale", _config["VnPay:Locale"]!);
			vnpay.AddRequestData("vnp_OrderInfo", uniqueKey);
			vnpay.AddRequestData("vnp_OrderType", "other");
			vnpay.AddRequestData("vnp_ReturnUrl", _config["VnPay:ReturnUrl"]!);
			vnpay.AddRequestData("vnp_ExpireDate", CoreHelper.SystemTimeNow.AddMinutes(5).ToString("yyyyMMddHHmmss"));
			vnpay.AddRequestData("vnp_TxnRef", $"{tick}");

			var paymentUrl = vnpay.CreateRequestUrl(_config["VnPay:BaseUrl"]!, _config["VnPay:HashSecret"]!);

			return paymentUrl;
		}

		public VnPayResponseDto PaymentExecute(IQueryCollection collections)
		{
			VnPayHelper vnpay = new();
			foreach (var (key, value) in collections)
			{
				if (!string.IsNullOrEmpty(key) && key.StartsWith("vnp_"))
				{
					vnpay.AddResponseData(key, value.ToString());
				}
			}

			var vnp_orderId = vnpay.GetResponseData("vnp_OrderInfo");
			var vnp_SecureHash = collections.FirstOrDefault(p => p.Key == "vnp_SecureHash").Value.ToString();
			var vnp_ResponseCode = vnpay.GetResponseData("vnp_ResponseCode");
			bool checkSignature = vnpay.ValidateSignature(vnp_SecureHash, _config["VnPay:HashSecret"]!);
			if (!checkSignature)
			{
				return new VnPayResponseDto
				{
					Success = false
				};
			}
			return new VnPayResponseDto
			{
				Success = true,
				vaccinationsJson = vnp_orderId.ToString(),
				VnPayResponseCode = vnp_ResponseCode
			};

		}

		public async Task InsertVaccinationsData(string uniqueKey)
		{
			if (_cache.TryGetValue(uniqueKey, out string? vaccinationsJson) && vaccinationsJson != null)
			{
				List<Vaccination> vaccinations = (JsonSerializer.Deserialize<List<Vaccination>>(vaccinationsJson))!;

                foreach (var vaccination in vaccinations)
				{
					_unitOfWork.GetRepository<Vaccination>().InsertRange(vaccinations);
				}
				await _unitOfWork.SaveAsync();
			}
		}

	}
}

