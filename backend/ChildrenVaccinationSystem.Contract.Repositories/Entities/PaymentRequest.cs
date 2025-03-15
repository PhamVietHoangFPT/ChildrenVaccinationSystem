using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ChildrenVaccinationSystem.Contract.Repositories.Entities
{
    public class PaymentRequest : BaseEntity
    {
        public string VaccinationId { get; set; } = default!;
    }

}
