using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.DTOs
{
    public  class VaccineViewDto
    {
        public string Id { get; set; }
        public string Name { get; set; } = default!;
        public double Price { get; set; }
        public string? Description { get; set; }
        public int? StartRecommendedAge { get; set; }
        public int? EndRecommendedAge { get; set; }
        public int? Sequence { get; set; }
        public double? Dosage { get; set; } // mililitres
        public int? DosageInterval { get; set; } // months

        public DateTimeOffset CreatedTime { get; set; }
        public DateTimeOffset LastUpdatedTime { get; set; }

    }
}
