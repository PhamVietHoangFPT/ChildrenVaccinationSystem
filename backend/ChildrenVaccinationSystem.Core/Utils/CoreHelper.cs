using ChildrenVaccinationSystem.Core.Base;
using Microsoft.AspNetCore.Http;

namespace ChildrenVaccinationSystem.Core.Utils
{
    public class CoreHelper
	{
		public static DateTimeOffset SystemTimeNow => TimeHelper.ConvertToUtcPlus7(DateTimeOffset.Now);

		public static async Task<string> CreateImage(IFormFile file)
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
			return uniqueFileName;
		}

		public static void DeleteImage(string fileName)
		{
			if (string.IsNullOrWhiteSpace(fileName))
			{
				throw new ArgumentException("Invalid file name.");
			}

			// Define the image path
			string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", fileName);

			// Check if the file exists
			if (File.Exists(filePath))
			{
				File.Delete(filePath);
			}
			else
			{
				throw new FileNotFoundException("File not found.");
			}
		}

	}
}
