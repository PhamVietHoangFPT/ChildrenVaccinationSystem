using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.BlogDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CountryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ImageDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageItemDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccineInventoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
namespace ChildrenVaccinationSystem.Contract.Repositories.Mapper
{
	public class MapperProfile : Profile
	{
		public MapperProfile()
		{
			CreateMap(typeof(SimpleViewDto), typeof(BaseEntity))
						.ReverseMap()
						.IncludeAllDerived();

			CreateMap<Account, AccountViewDto>();
			CreateMap<AccountUpdateDto, Account>();
			CreateMap<CustomerUpdateDto, Account>()
				.ForAllMembers(opt => opt.Condition(
				(src, dest, srcMember) => srcMember != null &&
										  (srcMember is not string || !string.IsNullOrWhiteSpace(srcMember.ToString()))
				));

			CreateMap<Blog, BlogViewDto>();
			CreateMap<BlogCreateDto, Blog>();
			CreateMap<BlogUpdateDto, Blog>()
				.ForAllMembers(opt => opt.Condition(
				(src, dest, srcMember) => srcMember != null &&
										  (srcMember is not string || !string.IsNullOrWhiteSpace(srcMember.ToString()))
				));


			CreateMap<Category, CategoryViewDto>();
			CreateMap<CategoryCreateDto, Category>();
			CreateMap<CategoryUpdateDto, Category>()
				.ForAllMembers(opt => opt.Condition(
				(src, dest, srcMember) => srcMember != null &&
										  (srcMember is not string || !string.IsNullOrWhiteSpace(srcMember.ToString()))
				));

			CreateMap<Child, ChildViewDto>();
			CreateMap<ChildCreateDto, Child>();
			CreateMap<ChildUpdateDto, Child>()
				.ForAllMembers(opt => opt.Condition(
				(src, dest, srcMember) => srcMember != null &&
										  (srcMember is not string || !string.IsNullOrWhiteSpace(srcMember.ToString()))
				));


			CreateMap<Country, CountryViewDto>();

			CreateMap<Facility, FacilityViewDto>();
			CreateMap<FacilityCreateDto, Facility>();
			CreateMap<FacilityUpdateDto, Facility>()
				.ForAllMembers(opt => opt.Condition(
				(src, dest, srcMember) => srcMember != null &&
										  (srcMember is not string || !string.IsNullOrWhiteSpace(srcMember.ToString()))
				));

			CreateMap<Image, ImageViewDto>();

			CreateMap<Manufacturer, ManufacturerViewDto>();
			CreateMap<ManufacturerCreateDto, Manufacturer>();
			CreateMap<ManufacturerUpdateDto, Manufacturer>()
				.ForAllMembers(opt => opt.Condition(
				(src, dest, srcMember) => srcMember != null &&
										  (srcMember is not string || !string.IsNullOrWhiteSpace(srcMember.ToString()))
				));

			CreateMap<Package, PackageViewDto>();

			CreateMap<PackageItem, PackageItemViewDto>();

			CreateMap<Vaccination, VaccinationViewDto>();


			CreateMap<Vaccine, VaccineViewDto>();
			CreateMap<VaccineCreateDto, Vaccine>();
			CreateMap<VaccineUpdateDto, Vaccine>()
				.ForAllMembers(opt => opt.Condition(
				(src, dest, srcMember) => srcMember != null &&
										  (srcMember is not string || !string.IsNullOrWhiteSpace(srcMember.ToString()))
				));

			CreateMap<VaccineInventory, VaccineInventoryViewDto>();

		}
	}
}