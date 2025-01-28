#nullable disable

using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using Microsoft.EntityFrameworkCore;

namespace ChildrenVaccinationSystem.Repositories.DatabaseContext
{
	public partial class ChildrenVaccinationSystemDbContext : DbContext
	{
		public ChildrenVaccinationSystemDbContext(DbContextOptions<ChildrenVaccinationSystemDbContext> options) : base(options)
		{
		}

		public virtual DbSet<Account> Accounts { get; set; }
		public virtual DbSet<Blog> Blogs { get; set; }
		public virtual DbSet<Category> Categories { get; set; }
		public virtual DbSet<Child> Children { get; set; }
		public virtual DbSet<Country> Countries { get; set; }
		public virtual DbSet<Facility> Facilities { get; set; }
		public virtual DbSet<Image> Images { get; set; }
		public virtual DbSet<Manufacturer> Manufacturers { get; set; }
		public virtual DbSet<Package> Packages { get; set; }
		public virtual DbSet<PackageItem> PackageItems { get; set; }
		public virtual DbSet<Vaccination> Vaccinations { get; set; }
		public virtual DbSet<VaccinationDetail> VaccinationDetails { get; set; }
		public virtual DbSet<Vaccine> Vaccines { get; set; }

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			modelBuilder.Entity<PackageItem>()
			.HasKey(p => new { p.PackageId, p.VaccineId });
			modelBuilder.Entity<VaccinationDetail>()
				.HasKey(vd => new { vd.PackageId, vd.VaccinationId, vd.VaccineId });
			modelBuilder.Entity<VaccineInventory>()
				.HasKey(vi => new { vi.BatchNumber, vi.FacilityId, vi.VaccineId });



			modelBuilder.Entity<Account>()
				.HasIndex(a => a.Email).IsUnique();
			modelBuilder.Entity<Account>()
				.HasIndex(a => a.PhoneNumber).IsUnique();
			modelBuilder.Entity<Blog>()
				.HasIndex(b => b.Title).IsUnique();
			modelBuilder.Entity<Child>()
				.HasIndex(c => c.ChildCode).IsUnique();
			modelBuilder.Entity<VaccineInventory>()
				.HasIndex(vi => vi.BatchNumber).IsUnique();
			modelBuilder.Entity<Facility>()
				.HasIndex(f => f.Address).IsUnique();
			modelBuilder.Entity<Image>()
				.HasIndex(i => i.ImageSource).IsUnique();
			modelBuilder.Entity<Manufacturer>()
				.HasIndex(m => m.Name).IsUnique();
			modelBuilder.Entity<Country>()
				.HasIndex(c => c.Code).IsUnique();
			modelBuilder.Entity<Country>()
				.HasIndex(c => c.Name).IsUnique();


			modelBuilder.Entity<Account>()
				.HasMany(a => a.Children).WithOne(c => c.Account).HasForeignKey(c => c.AccountId).OnDelete(DeleteBehavior.NoAction);
			modelBuilder.Entity<Account>()
				.HasMany(a => a.DoctorVaccinations).WithOne(v => v.Doctor).HasForeignKey(v => v.DoctorId).OnDelete(DeleteBehavior.NoAction);
			modelBuilder.Entity<Account>()
				.HasMany(a => a.VaccinatorVaccinations).WithOne(v => v.Vaccinator).HasForeignKey(v => v.VaccinatorId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Child>()
				.HasMany(c => c.Vaccinations).WithOne(v => v.Child).HasForeignKey(v => v.ChildId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Vaccination>()
				.HasMany(v => v.VaccinationDetails).WithOne(vd => vd.Vaccination).HasForeignKey(vd => vd.VaccinationId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Package>()
				.HasMany(p => p.VaccinationDetails).WithOne(vd => vd.Package).HasForeignKey(vd => vd.PackageId).OnDelete(DeleteBehavior.NoAction);
			modelBuilder.Entity<Package>()
				.HasMany(p => p.PackageItems).WithOne(pi => pi.Package).HasForeignKey(pi => pi.PackageId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Blog>()
				.HasMany(b => b.Images).WithOne(i => i.Blog).HasForeignKey(i => i.BlogId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Facility>()
				.HasMany(f => f.VaccineInventories).WithOne(vi => vi.Facility).HasForeignKey(vi => vi.FacilityId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Vaccine>()
				.HasMany(v => v.VaccinationDetails).WithOne(vd => vd.Vaccine).HasForeignKey(vd => vd.VaccineId).OnDelete(DeleteBehavior.NoAction);
			modelBuilder.Entity<Vaccine>()
				.HasMany(v => v.Images).WithOne(i => i.Vaccine).HasForeignKey(i => i.VaccineId).OnDelete(DeleteBehavior.NoAction);
			modelBuilder.Entity<Vaccine>()
				.HasMany(v => v.PackageItems).WithOne(pi => pi.Vaccine).HasForeignKey(pi => pi.VaccineId).OnDelete(DeleteBehavior.NoAction);
			modelBuilder.Entity<Vaccine>()
				.HasMany(v => v.VaccineInventories).WithOne(vi => vi.Vaccine).HasForeignKey(vi => vi.VaccineId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Category>()
				.HasMany(c => c.Vaccines).WithOne(v => v.Category).HasForeignKey(v => v.CategoryId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Manufacturer>()
				.HasMany(m => m.Vaccines).WithOne(v => v.Manufacturer).HasForeignKey(v => v.ManufacturerId).OnDelete(DeleteBehavior.NoAction);

			modelBuilder.Entity<Country>()
				.HasMany(c => c.Manufacturers).WithOne(m => m.Country).HasForeignKey(m => m.CountryId).OnDelete(DeleteBehavior.NoAction);
		}

	}
}
