using ChildrenVaccinationSystem.Core.Base;
using Microsoft.AspNetCore.Http;

namespace ChildrenVaccinationSystem.Core.Utils
{
    public class CoreHelper
	{
		public static DateTimeOffset SystemTimeNow => TimeHelper.ConvertToUtcPlus7(DateTimeOffset.Now);

		public async Task CreateImage(IFormFile file)
		{
			if (file == null || file.Length == 0)
			{
				throw new ArgumentException("No file uploaded.");
			}

			// Define the upload folder path (relative to the project root)
			string uploadFolder = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images");

			// Ensure the folder exists
			Directory.CreateDirectory(uploadFolder);

			// Generate a unique file name
			string uniqueFileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
			string filePath = Path.Combine(uploadFolder, uniqueFileName);

			// Save the file
			using (var stream = new FileStream(filePath, FileMode.Create))
			{
				await file.CopyToAsync(stream);
			}
		}

		
	}
}
