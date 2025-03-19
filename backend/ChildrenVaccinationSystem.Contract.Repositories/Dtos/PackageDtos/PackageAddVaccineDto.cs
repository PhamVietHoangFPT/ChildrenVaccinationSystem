using ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageItemDtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos
{
    class PackageAddVaccineDto
    {
        public ICollection<PackageItemViewDto>? PackageItems { get; set; }
    }
}
