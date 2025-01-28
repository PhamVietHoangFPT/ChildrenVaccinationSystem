using ChildrenVaccinationSystem.Core.Base;

namespace ChildrenVaccinationSystem.Contract.Repositories.IUOW
{
	public interface IUnitOfWork : IDisposable
	{
		IGenericRepository<T> GetRepository<T>() where T : class;
		void Save();
		Task SaveAsync();
		void BeginTransaction();
		void CommitTransaction();
		void RollBack();
		bool IsValid<T>(string id) where T : BaseEntity;

	}
}
