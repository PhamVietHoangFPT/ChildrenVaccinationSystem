using ChildrenVaccinationSystem.Core.Utils;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ChildrenVaccinationSystem.Core.Base
{
	public abstract class BaseEntity
	{
		protected BaseEntity()
		{
			Id = Guid.NewGuid().ToString().ToUpper();
			CreatedTime = LastUpdatedTime = CoreHelper.SystemTimeNow;
		}

		[Key]
		[Column(TypeName = "nvarchar(36)")]
		public string Id { get; set; }
		public string? CreatedBy { get; set; }
		public string? LastUpdatedBy { get; set; }
		public string? DeletedBy { get; set; }
		public DateTimeOffset CreatedTime { get; set; }
		public DateTimeOffset LastUpdatedTime { get; set; }
		public DateTimeOffset? DeletedTime { get; set; }
	}
}
