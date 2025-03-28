using ChildrenVaccinationSystem.Contract.Services;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Services
{
	public class OurSystemBackgroundService : BackgroundService
	{
		private readonly IServiceScopeFactory _serviceScopeFactory;

		public OurSystemBackgroundService(IServiceScopeFactory serviceScopeFactory)
		{
			_serviceScopeFactory = serviceScopeFactory;
		}

		protected override async Task ExecuteAsync(CancellationToken stoppingToken)
		{
			var task1 = RunTaskEvery(TimeSpan.FromMinutes(15), stoppingToken, async () =>
			{
				using var scope = _serviceScopeFactory.CreateScope();
				var accountService = scope.ServiceProvider.GetRequiredService<IAccountService>();
				await accountService.BgRemoveUnverifiedAccounts();
				await accountService.BgRemoveExpiredOTP();
			});
			var task2 = RunTaskEvery(TimeSpan.FromMinutes(30), stoppingToken, async () =>
			{
				using var scope = _serviceScopeFactory.CreateScope();
				var accountService = scope.ServiceProvider.GetRequiredService<IAccountService>();
				await accountService.BgRemoveExpiredResetPasswordToken();
			});
			var task3 = RunTaskEvery(TimeSpan.FromHours(1), stoppingToken, async () =>
			{
				using var scope = _serviceScopeFactory.CreateScope();
				var vaccinationService = scope.ServiceProvider.GetRequiredService<IVaccinationService>();
				await vaccinationService.BgRemoveOverExpiredVaccinations();
			});

			await Task.WhenAll(task1, task2, task3);
		}

		private async Task RunTaskEvery(TimeSpan interval, CancellationToken stoppingToken, Func<Task> taskToRun)
		{
			while (!stoppingToken.IsCancellationRequested)
			{
				try
				{
					await taskToRun();
				}
				catch
				{
					// Handle errors if needed
				}

				await Task.Delay(interval, stoppingToken);
			}
		}

	}
}
