using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Core.Utils;
using ChildrenVaccinationSystem.Repositories.DatabaseContext;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace ChildrenVaccinationSystem.Repositories.SeedData
{
	public class ApplicationDbContextInitializer
	{
		private readonly ILogger _logger;
		private readonly ChildrenVaccinationSystemDbContext _context;
		private readonly IUnitOfWork _unitOfWork;

		public ApplicationDbContextInitializer(
			ILogger<ApplicationDbContextInitializer> logger,
			ChildrenVaccinationSystemDbContext context, IUnitOfWork unitOfWork)
		{
			_logger = logger;
			_context = context;
			_unitOfWork = unitOfWork;
		}

		public async Task InitialiseAsync()
		{
			try
			{
				if (_context.Database.IsSqlServer())
				{
					if (_context.Database.IsSqlServer())
					{
						Boolean dbExists = await _context.Database.CanConnectAsync();
						if (!dbExists)
						{
							await _context.Database.EnsureDeletedAsync();
							await _context.Database.MigrateAsync();
						}
						else
						{
							await _context.Database.MigrateAsync();
						}
					}
				}
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, "An error occurred while initialising the database.");
				throw;
			}
		}

		public async Task SeedAsync()
		{
			try
			{
				// create role
				// create city
				// create district
				// await TrySeedAsync();
				await AddCountries();
			}
			catch (Exception ex)
			{
				_logger.LogError(ex, "An error occurred while seeding the database.");
				throw;
			}
		}

		private async Task AddCountries()
		{
			if (!_context.Countries.Where(x => x.DeletedTime == null).Any())
			{
				List<Country> countries = new()
				{
					new() { Id = Guid.NewGuid().ToString(), Code = "AFG", Name = "Afghanistan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ALB", Name = "Albania", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "DZA", Name = "Algeria", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "AND", Name = "Andorra", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "AGO", Name = "Angola", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ATG", Name = "Antigua and Barbuda", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ARG", Name = "Argentina", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ARM", Name = "Armenia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "AUS", Name = "Australia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "AUT", Name = "Austria", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "AZE", Name = "Azerbaijan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BHS", Name = "Bahamas", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BHR", Name = "Bahrain", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BGD", Name = "Bangladesh", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BRB", Name = "Barbados", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BLR", Name = "Belarus", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BEL", Name = "Belgium", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BLZ", Name = "Belize", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BEN", Name = "Benin", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BOL", Name = "Bolivia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BWA", Name = "Botswana", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BRA", Name = "Brazil", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BRN", Name = "Brunei", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BGR", Name = "Bulgaria", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BFA", Name = "Burkina Faso", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "BDI", Name = "Burundi", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CPV", Name = "Cabo Verde", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KHM", Name = "Cambodia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CMR", Name = "Cameroon", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CAN", Name = "Canada", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TCD", Name = "Chad", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CHL", Name = "Chile", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CHN", Name = "China", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "COL", Name = "Colombia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "COM", Name = "Comoros", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "COG", Name = "Congo (Congo-Brazzaville)", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "COD", Name = "Congo (Congo-Kinshasa)", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CRI", Name = "Costa Rica", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "HRV", Name = "Croatia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CUB", Name = "Cuba", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CYP", Name = "Cyprus", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CZE", Name = "Czech Republic", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "DNK", Name = "Denmark", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "DJI", Name = "Djibouti", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "DMA", Name = "Dominica", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "DOM", Name = "Dominican Republic", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ECU", Name = "Ecuador", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "EGY", Name = "Egypt", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SLV", Name = "El Salvador", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GNQ", Name = "Equatorial Guinea", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ERI", Name = "Eritrea", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "EST", Name = "Estonia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ETH", Name = "Ethiopia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "FJI", Name = "Fiji", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "FIN", Name = "Finland", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "FRA", Name = "France", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GAB", Name = "Gabon", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GMB", Name = "Gambia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GEO", Name = "Georgia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "DEU", Name = "Germany", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GHA", Name = "Ghana", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GRC", Name = "Greece", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GRD", Name = "Grenada", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GTM", Name = "Guatemala", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GIN", Name = "Guinea", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GNB", Name = "Guinea-Bissau", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GUY", Name = "Guyana", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "HTI", Name = "Haiti", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "HND", Name = "Honduras", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "HUN", Name = "Hungary", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ISL", Name = "Iceland", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "IND", Name = "India", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "IDN", Name = "Indonesia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "IRN", Name = "Iran", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "IRQ", Name = "Iraq", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "IRL", Name = "Ireland", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ISR", Name = "Israel", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ITA", Name = "Italy", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "JAM", Name = "Jamaica", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "JPN", Name = "Japan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "JOR", Name = "Jordan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KAZ", Name = "Kazakhstan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KEN", Name = "Kenya", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KIR", Name = "Kiribati", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KWT", Name = "Kuwait", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KGZ", Name = "Kyrgyzstan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LAO", Name = "Laos", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LVA", Name = "Latvia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LBN", Name = "Lebanon", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LSO", Name = "Lesotho", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LBR", Name = "Liberia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LBY", Name = "Libya", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LIE", Name = "Liechtenstein", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LTU", Name = "Lithuania", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LUX", Name = "Luxembourg", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MDG", Name = "Madagascar", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MWI", Name = "Malawi", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MYS", Name = "Malaysia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MDV", Name = "Maldives", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MLI", Name = "Mali", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MLT", Name = "Malta", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MHL", Name = "Marshall Islands", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MRT", Name = "Mauritania", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MUS", Name = "Mauritius", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MEX", Name = "Mexico", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "FSM", Name = "Micronesia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MDA", Name = "Moldova", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MCO", Name = "Monaco", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MNG", Name = "Mongolia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MNE", Name = "Montenegro", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MAR", Name = "Morocco", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MOZ", Name = "Mozambique", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MMR", Name = "Myanmar (Burma)", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NAM", Name = "Namibia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NRU", Name = "Nauru", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NPL", Name = "Nepal", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NLD", Name = "Netherlands", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NZL", Name = "New Zealand", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NIC", Name = "Nicaragua", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NER", Name = "Niger", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NGA", Name = "Nigeria", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "MKD", Name = "North Macedonia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "NOR", Name = "Norway", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "OMN", Name = "Oman", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PAK", Name = "Pakistan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PLW", Name = "Palau", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PSE", Name = "Palestine", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PAN", Name = "Panama", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PNG", Name = "Papua New Guinea", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PRY", Name = "Paraguay", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PER", Name = "Peru", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PHL", Name = "Philippines", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "POL", Name = "Poland", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "PRT", Name = "Portugal", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "QAT", Name = "Qatar", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ROU", Name = "Romania", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "RUS", Name = "Russia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "RWA", Name = "Rwanda", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KNA", Name = "Saint Kitts and Nevis", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LCA", Name = "Saint Lucia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "VCT", Name = "Saint Vincent and the Grenadines", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "WSM", Name = "Samoa", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SMR", Name = "San Marino", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "STP", Name = "Sao Tome and Principe", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SAU", Name = "Saudi Arabia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SEN", Name = "Senegal", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SRB", Name = "Serbia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SYC", Name = "Seychelles", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SLE", Name = "Sierra Leone", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SGP", Name = "Singapore", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SVK", Name = "Slovakia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SVN", Name = "Slovenia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SLB", Name = "Solomon Islands", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SOM", Name = "Somalia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ZAF", Name = "South Africa", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "KOR", Name = "South Korea", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SSD", Name = "South Sudan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ESP", Name = "Spain", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "LKA", Name = "Sri Lanka", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SDN", Name = "Sudan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SUR", Name = "Suriname", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SWE", Name = "Sweden", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "CHE", Name = "Switzerland", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "SYR", Name = "Syria", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TWN", Name = "Taiwan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TJK", Name = "Tajikistan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TZA", Name = "Tanzania", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "THA", Name = "Thailand", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TLS", Name = "Timor-Leste", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TGO", Name = "Togo", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TON", Name = "Tonga", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TTO", Name = "Trinidad and Tobago", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TUN", Name = "Tunisia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TUR", Name = "Turkey", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TKM", Name = "Turkmenistan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "TUV", Name = "Tuvalu", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "UGA", Name = "Uganda", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "UKR", Name = "Ukraine", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ARE", Name = "United Arab Emirates", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "GBR", Name = "United Kingdom", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "USA", Name = "United States", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "URY", Name = "Uruguay", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "UZB", Name = "Uzbekistan", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "VUT", Name = "Vanuatu", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "VAT", Name = "Vatican City", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "VEN", Name = "Venezuela", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "VNM", Name = "Vietnam", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "YEM", Name = "Yemen", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ZMB", Name = "Zambia", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow },
					new() { Id = Guid.NewGuid().ToString(), Code = "ZWE", Name = "Zimbabwe", CreatedTime = CoreHelper.SystemTimeNow, LastUpdatedTime = CoreHelper.SystemTimeNow }
				};

				await _context.Countries.AddRangeAsync(countries);
				await _context.SaveChangesAsync();
			}
		}

	}
}
