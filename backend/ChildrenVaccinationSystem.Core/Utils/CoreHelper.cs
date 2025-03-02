using ChildrenVaccinationSystem.Core.Base;
using Microsoft.AspNetCore.Http;

namespace ChildrenVaccinationSystem.Core.Utils
{
    public class CoreHelper
	{
		public static DateTimeOffset SystemTimeNow => TimeHelper.ConvertToUtcPlus7(DateTimeOffset.Now);
	}
}
