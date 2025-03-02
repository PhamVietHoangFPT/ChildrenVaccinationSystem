using ChildrenVaccinationSystem.Contract.Services;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Gmail.v1;
using Google.Apis.Util.Store;
using MailKit.Security;
using Microsoft.Extensions.Configuration;
using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class EmailService : IEmailService
	{
		private readonly IConfiguration _configuration;

		public EmailService(IConfiguration configuration)
		{
			_configuration = configuration;
		}

		public Task SendVerificationEmailAsync(string email, string verificationToken)
		{
			var mail = "kidsvaccinecorp@gmail.com";
			var pw = "swdg enlv vfrk rpdf";

			var client = new SmtpClient("smtp.gmail.com", 587)
			{
				EnableSsl = true,
				Credentials = new NetworkCredential(mail, pw)
			};

			var productDomain = _configuration["ProductDomain"];

			string verificationUrl = $"{productDomain}/api/authentication/verify-account?token={verificationToken}";

			var message = $@"
				<div style='font-family: Arial, sans-serif; line-height: 1.5;'>
					<p>Cảm ơn bạn đã đăng ký tài khoản tại <strong>Kids Vaccine</strong>! Để hoàn tất quá trình đăng ký, vui lòng xác minh email của bạn bằng cách nhấn vào nút bên dưới:</p>

					<p style='text-align: center;'>
						<a href='{verificationUrl}' 
						   style='display: inline-block; padding: 10px 15px; background-color: #4CAF50; color: white;
								  text-decoration: none; border-radius: 5px; font-weight: bold;'>
							🔗 Nhấn vào đây để xác minh
						</a>
					</p>

					<p>Liên kết này sẽ hết hạn sau <strong>15 phút</strong>, vui lòng xác minh tài khoản sớm nhất có thể.</p>

					<p>Nếu bạn không yêu cầu tạo tài khoản, vui lòng bỏ qua email này.</p>

					<p>Trân trọng,<br><strong>Bộ phận hỗ trợ KVC</strong></p>
				</div>";
			// Tạo email

			var mailMessage = new MailMessage
			{
				From = new MailAddress(mail),
				Subject = "Xác minh tài khoản Kids Vaccine",
				Body = message,
				IsBodyHtml = true
			};



			// Thêm người nhận
			mailMessage.To.Add(email);

			// Gửi email
			return client.SendMailAsync(mailMessage);
		}

		//public async Task SendVerificationEmailAsync(string email, string verificationToken)
		//{
		//	// Retrieve the web link from appsettings.json
		//	string? webUrl = _configuration["WebUrl"];
		//	if (string.IsNullOrWhiteSpace(webUrl))
		//	{
		//		throw new InvalidOperationException("WebLink is not configured.");
		//	}

		//	string verificationUrl = $"{webUrl}/api/auth/verify-email?token={verificationToken}";

		//	// Email subject and body
		//	string subject = "Email Verification";
		//string body = $@"
		//	<div style='font-family: Arial, sans-serif; line-height: 1.5;'>
		//		<h2 style='color: #4CAF50;'>Email Verification</h2>
		//		<p>Dear user,</p>
		//		<p>Please verify your email by clicking the button below:</p>
		//		<a href='{verificationUrl}' 
		//		   style='display: inline-block; padding: 10px 20px; background-color: #4CAF50; color: white; 
		//				  text-decoration: none; border-radius: 5px; font-weight: bold;'>
		//		   Verify Email
		//		</a>
		//		<p>If the button does not work, copy and paste the following link into your browser:</p>
		//		<p><a href='{verificationUrl}'>{verificationUrl}</a></p>
		//		<p>Thank you!</p>
		//	</div>";


		//	// Send email using SendGrid
		//	await SendEmailAsync(email, subject, body);
		//}

	}
}
