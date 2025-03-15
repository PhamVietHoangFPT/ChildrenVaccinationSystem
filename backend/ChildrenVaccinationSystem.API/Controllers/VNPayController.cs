using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using Microsoft.Extensions.Configuration;
using Google;
using ChildrenVaccinationSystem.Repositories.DatabaseContext;
using ChildrenVaccinationSystem.Services;

namespace ChildrenVaccinationSystem.API.Controllers
{
    [ApiController]
    [Route("api/vnpay")]
public class VNPayController : ControllerBase
{
    private readonly VNPayService _vnpayService;
    private readonly ChildrenVaccinationSystemDbContext _context;
    private readonly IConfiguration _configuration;

    public VNPayController(VNPayService vnpayService, ChildrenVaccinationSystemDbContext context, IConfiguration configuration)
    {
        _vnpayService = vnpayService;
        _context = context;
        _configuration = configuration;
    }


    [HttpPost("create-payment")]
    public async Task<IActionResult> CreatePayment([FromBody] PaymentRequestDto request)
    {
        if (request == null || string.IsNullOrEmpty(request.VaccinationId))
        {
            return BadRequest(new { message = "Invalid Vaccination ID" });
        }

            string clientIp = HttpContext.Connection.RemoteIpAddress?.ToString() ?? "127.0.0.1";

            var vaccination = await _context.Vaccinations
            .FirstOrDefaultAsync(v => v.Id == request.VaccinationId);

        if (vaccination == null)
        {
            return NotFound(new { message = "Vaccination not found" });
        }

        double amount = vaccination.TotalPrice;
        string orderInfo = $"Thanh toán lịch tiêm chủng: {vaccination.Id}";


            var paymentUrl = _vnpayService.CreatePaymentUrl(Guid.NewGuid().ToString(), (long)amount, orderInfo, clientIp);
            return Ok(new { url = paymentUrl });
        }


    [HttpGet("payment-callback")]
    public IActionResult PaymentCallback()
    {
        var vnp_Params = Request.Query.ToDictionary(x => x.Key, x => x.Value.ToString());
        string vnp_HashSecret = _configuration["VNPay:vnp_HashSecret"];

        if (!vnp_Params.ContainsKey("vnp_SecureHash"))
        {
            return BadRequest(new { message = "Missing secure hash" });
        }

        string vnp_SecureHash = vnp_Params["vnp_SecureHash"];
        vnp_Params.Remove("vnp_SecureHash");
        vnp_Params.Remove("vnp_SecureHashType");

        string signData = string.Join("&", vnp_Params.OrderBy(x => x.Key).Select(x => $"{x.Key}={x.Value}"));
        using (var hmac = new HMACSHA512(Encoding.UTF8.GetBytes(vnp_HashSecret)))
        {
            byte[] hash = hmac.ComputeHash(Encoding.UTF8.GetBytes(signData));
            string calculatedHash = BitConverter.ToString(hash).Replace("-", "").ToLower();

            if (calculatedHash != vnp_SecureHash)
            {
                return BadRequest(new { message = "Invalid signature" });
            }
        }


        if (vnp_Params["vnp_ResponseCode"] == "00")
        {
            return Ok(new { message = "Payment successful", data = vnp_Params });
        }
        else
        {
            return BadRequest(new { message = "Payment failed", data = vnp_Params });
        }
    }
}


    public class PaymentRequestDto
    {
        public string VaccinationId { get; set; } = default!;
    }
}
