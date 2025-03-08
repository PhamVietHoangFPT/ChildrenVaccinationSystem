using AutoMapper;
using ChildrenVaccinationSystem.Contract.Repositories.DTOs;
using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Mapper
{
	public class MapperProfile : Profile
	{
		public MapperProfile()
		{
			CreateMap<Vaccine, VaccineViewDto>().ReverseMap();
			CreateMap<Vaccine, VaccineCreateDto>().ReverseMap();
			CreateMap<Vaccine, VaccineUpdateDto>().ReverseMap();

		}
	}
}
