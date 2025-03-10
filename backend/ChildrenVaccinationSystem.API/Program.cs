
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Services;
using Microsoft.OpenApi.Models;

namespace ChildrenVaccinationSystem.API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle

            builder.Services.AddEndpointsApiExplorer();

			// Execute the DI pipeline
			builder.Services.AddConfig(builder.Configuration);
            builder.Services.AddScoped<IVaccineService, VaccineService>();
            builder.Services.AddScoped<IBlogService, BlogService>();
            builder.Services.AddScoped<ICategoryService, CategoryService>();
            builder.Services.AddScoped<IFacilityService, FacilityService>();
            builder.Services.AddScoped<IManufacturerService, ManufacturerService>();





            var app = builder.Build();

            app.UseCors("AllowSpecificOrigins");

            // Configure the HTTP request pipeline.
            app.UseSwagger();
            app.UseSwaggerUI();

            app.UseStaticFiles();
			app.UseRouting();

			app.UseHttpsRedirection();

            app.UseAuthorization();

            app.MapControllers();

			app.ApplicationSetUp();

            app.Run();


        }
    }
}
