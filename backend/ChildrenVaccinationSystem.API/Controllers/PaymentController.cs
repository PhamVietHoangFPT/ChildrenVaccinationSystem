using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Core.Base;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace ChildrenVaccinationSystem.API.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class PaymentController : ControllerBase
	{
		private readonly IVnPayService _vnPayService;
		private readonly IConfiguration _config;
		public PaymentController(IVnPayService vnPayService, IConfiguration config)
		{
			_vnPayService = vnPayService;
			_config = config;
		}

		[HttpGet]
		[Route("vnpay-callback")]
		public async Task<IActionResult> VnPayCallback()
		{
			var vnPayResponse = _vnPayService.PaymentExecuteVnPay(Request.Query);

			if (vnPayResponse.VnPayResponseCode != "00")
			{
				return Redirect(_config["PaymentFail"]!);
			}

			Console.WriteLine("Localhost");

			await _vnPayService.InsertVaccinationsData(vnPayResponse.OrderInfo);

			return Redirect(_config["PaymentSuccess"]!);
		}

	}
}
