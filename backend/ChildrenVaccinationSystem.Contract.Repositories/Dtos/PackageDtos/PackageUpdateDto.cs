using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Dtos.PackageDtos
{
    public class PackageUpdateDto
    {
        public string? Name { get; set; }
        public double? Price { get; set; }
    }
}
