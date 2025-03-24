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
		public PaymentController(IVnPayService vnPayService)
		{
			_vnPayService = vnPayService;
		}

		[HttpGet]
		[Route("vnpay-callback")]
		public async Task<IActionResult> VnPayCallback()
		{
			var vnPayResponse = _vnPayService.PaymentExecute(Request.Query);

			if (vnPayResponse.VnPayResponseCode != "00")
			{
				return Redirect("https://youtube.com");
			}

			Console.WriteLine("Localhost");

			await _vnPayService.InsertVaccinationsData(vnPayResponse.OrderInfo);

			return Redirect("https://google.com");
		}

	}
}
