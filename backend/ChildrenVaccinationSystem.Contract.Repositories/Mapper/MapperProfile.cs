using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.AccountDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CategoryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ChildDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.CountryDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.FacilityDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ImageDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.ManufacturerDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageItemDtos;
using ChildrenVaccinationSystem.Contract.Repositories.Dtos.VaccinationDetailDtos;
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

			CreateMap<Category, CategoryViewDto>();

			CreateMap<Child, ChildViewDto>();

			CreateMap<Country, CountryViewDto>();

			CreateMap<Facility, FacilityViewDto>();


			CreateMap<Image, ImageViewDto>();

			CreateMap<Manufacturer, ManufacturerViewDto>();

			CreateMap<Package, PackageViewDto>();

			CreateMap<PackageItem, PackageItemViewDto>();

			CreateMap<Vaccination, VaccinationViewDto>();
			CreateMap<Vaccination, SimpleViewDto>();

			CreateMap<VaccinationDetail, VaccinationDetailViewDto>();

			CreateMap<Vaccine, VaccineViewDto>();
			CreateMap<Vaccine, VaccineCreateDto>().ReverseMap();
			CreateMap<Vaccine, VaccineUpdateDto>().ReverseMap();

			CreateMap<VaccineInventory, VaccineInventoryViewDto>();

		}
	}
}