using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;


namespace ChildrenVaccinationSystem.Services
{
    public class VNPayService
    {
        private readonly IConfiguration _configuration;

        public VNPayService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string CreatePaymentUrl(string orderId, long amount, string orderInfo, string ipAddress)
        {
            string vnp_TmnCode = _configuration["VNPay:vnp_TmnCode"];
            string vnp_HashSecret = _configuration["VNPay:vnp_HashSecret"];
            string vnp_Url = _configuration["VNPay:vnp_Url"];
            string vnp_ReturnUrl = _configuration["VNPay:vnp_ReturnUrl"];

       
            string vnp_CreateDate = DateTime.UtcNow.AddHours(7).ToString("yyyyMMddHHmmss", CultureInfo.InvariantCulture);

            
            var vnp_Params = new SortedDictionary<string, string>
        {
            { "vnp_Version", "2.1.0" },
            { "vnp_Command", "pay" },
            { "vnp_TmnCode", vnp_TmnCode },
            { "vnp_Amount", (amount * 100).ToString() }, 
            { "vnp_CurrCode", "VND" },
            { "vnp_TxnRef", orderId },  
            { "vnp_OrderInfo", HttpUtility.UrlEncode(orderInfo) },
            { "vnp_OrderType", "billpayment" },
            { "vnp_Locale", "vn" }, 
            { "vnp_ReturnUrl", vnp_ReturnUrl },
            { "vnp_CreateDate", vnp_CreateDate },
            { "vnp_IpAddr", ipAddress }  
        };

          
            string queryString = string.Join("&", vnp_Params.Select(x => $"{x.Key}={HttpUtility.UrlEncode(x.Value)}"));

         
            string signData = string.Join("&", vnp_Params.Select(x => $"{x.Key}={x.Value}"));
            using (var hmac = new HMACSHA512(Encoding.UTF8.GetBytes(vnp_HashSecret)))
            {
                byte[] hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(signData));
                string vnp_SecureHash = BitConverter.ToString(hash).Replace("-", "").ToLower();
                queryString += $"&vnp_SecureHash={vnp_SecureHash}";
            }

         
            return $"{vnp_Url}?{queryString}";
        }
    }
}