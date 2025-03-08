using ChildrenVaccinationSystem.Contract.Repositories.Entities;
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
        public double? Dosage { get; set; } 
        public int? DosageInterval { get; set; }
		public string CategoryId { get; set; } = default!;
		public string ManufacturerId { get; set; } = default!;
        public ICollection<string>? ImageIds { get; set; }
		public ICollection<string>? PackageItemIds { get; set; }
		public virtual ICollection<string>? VaccinationDetailIds { get; set; }
		public virtual ICollection<string>? VaccineInventoryIds { get; set; }
		public DateTimeOffset CreatedTime { get; set; }
        public DateTimeOffset LastUpdatedTime { get; set; }
    }
}
