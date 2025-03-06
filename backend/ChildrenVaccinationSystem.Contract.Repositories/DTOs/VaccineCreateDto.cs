using ChildrenVaccinationSystem.Contract.Repositories.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.DTOs
{
    public class VaccineCreateDto
    {
        public string Name { get; set; } = default!;
        public double Price { get; set; }
        public string? Description { get; set; }
        public int? StartRecommendedAge { get; set; }
        public int? EndRecommendedAge { get; set; }
        public int? Sequence { get; set; }
        public double? Dosage { get; set; } 
        public int? DosageInterval { get; set; }
        //public Category? Category { get; set; }
        public string CategoryId { get; set; } = default!;
        public string ManufacturerId { get; set; } = default!;

    }
}
