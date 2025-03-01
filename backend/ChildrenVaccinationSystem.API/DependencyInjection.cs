using ChildrenVaccinationSystem.API.Middleware;
using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Contract.Services;
using ChildrenVaccinationSystem.Repositories.DatabaseContext;
using ChildrenVaccinationSystem.Repositories.SeedData;
using ChildrenVaccinationSystem.Repositories.UOW;
using ChildrenVaccinationSystem.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using Microsoft.OpenApi.Models;
using System.Net;
using System.Reflection;

namespace ChildrenVaccinationSystem.API
{
	public static class DependencyInjection
	{
		// Main Config method
		public static void AddConfig(this IServiceCollection services, IConfiguration configuration)
		{
			services.ConfigRoute();
			services.ConfigSwagger();
			services.AddDatabase(configuration);
			services.AddAutoMapper();
			services.AddInfrastructure(configuration);
			services.AddServices();
			services.AddDbContextInitializer();
			services.AddCors();
     }

		public static async void ApplicationSetUp(this WebApplication app)
		{
			//app.UseMiddleware<PermissionMiddleware>();
			await app.UseDbContextInitializerAsync();
		}

		public static void ConfigRoute(this IServiceCollection services)
		{
			services.Configure<RouteOptions>(options =>
			{
				options.LowercaseUrls = true;
			});
		}

		public static void ConfigSwagger(this IServiceCollection services)
		{
			services.AddSwaggerGen(c =>
			{
				c.EnableAnnotations(); // Enable annotations for Swagger
									   // Add Bearer token support to Swagger
				c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
				{
					Name = "Authorization",
					Type = SecuritySchemeType.Http,
					Scheme = "bearer",
					BearerFormat = "JWT",
					In = ParameterLocation.Header
				});

				c.AddSecurityRequirement(new OpenApiSecurityRequirement
				{
					{
						new OpenApiSecurityScheme
						{
							Reference = new OpenApiReference
							{
								Type = ReferenceType.SecurityScheme,
								Id = "Bearer"
							}
						},
						new string[] {}
					}
				});
			});

		}

		public static void AddDatabase(this IServiceCollection services, IConfiguration configuration)
		{
			services.AddDbContext<ChildrenVaccinationSystemDbContext>(options =>
			{
				options.UseLazyLoadingProxies() // Enable lazy loading
					   .UseSqlServer(configuration.GetConnectionString("MyCnn"), b =>
						   b.MigrationsAssembly("ChildrenVaccinationSystem.API")); // Specify migrations assembly
				options.ConfigureWarnings(warnings => warnings.Ignore(RelationalEventId.PendingModelChangesWarning));
			});
		}

        public static void AddCors(this IServiceCollection services)
        {
			services.AddCors(options =>
            {
                options.AddPolicy("AllowSpecificOrigins",
                    policy =>
                    {
                        policy.AllowAnyOrigin()
                              .AllowAnyMethod()
                              .AllowAnyHeader();
                    });
            });
        }

        public static void AddAutoMapper(this IServiceCollection services)
		{
			services.AddAutoMapper(Assembly.GetExecutingAssembly());
		}

		public static void AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
		{
			services.AddRepositories();
		}

		public static void AddServices(this IServiceCollection services)
		{
			services.AddScoped<IAuthenticationService, AuthenticationService>();
			services.AddScoped<ICountryService, CountryService>();
		}

		public static void AddRepositories(this IServiceCollection services)
		{
			services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));

			services.AddScoped<IUnitOfWork, UnitOfWork>();
		}

		public static void AddDbContextInitializer(this IServiceCollection services)
		{
			services.AddScoped<ApplicationDbContextInitializer>();
		}

		public static async Task UseDbContextInitializerAsync(this WebApplication app)
		{
			using IServiceScope scope = app.Services.CreateScope();
			ApplicationDbContextInitializer initialiser = scope.ServiceProvider.GetRequiredService<ApplicationDbContextInitializer>();
			await initialiser.InitialiseAsync();
			await initialiser.SeedAsync();
		}

	}
}
