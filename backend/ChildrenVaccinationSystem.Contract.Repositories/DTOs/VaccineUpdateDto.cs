using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.DTOs
{
    public class VaccineUpdateDto
    {
        public string Id { get; set; } = default!;
        public string Name { get; set; } = default!;
        public double Price { get; set; }
        public string? Description { get; set; }
        public int? StartRecommendedAge { get; set; }
        public int? EndRecommendedAge { get; set; }
        public int? Sequence { get; set; }
        public double? Dosage { get; set; } // mililitres
        public int? DosageInterval { get; set; } // months
        public string CategoryId { get; set; } = default!;
        public string ManufacturerId { get; set; } = default!;
    }
}
