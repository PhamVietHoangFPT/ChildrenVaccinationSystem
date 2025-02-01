using ChildrenVaccinationSystem.Contract.Repositories.IUOW;
using ChildrenVaccinationSystem.Core.Base;
using ChildrenVaccinationSystem.Repositories.DatabaseContext;
using Microsoft.EntityFrameworkCore;

namespace ChildrenVaccinationSystem.Repositories.UOW
{
	public class GenericRepository<T> : IGenericRepository<T> where T : class
	{
		protected readonly ChildrenVaccinationSystemDbContext _context;
		protected readonly DbSet<T> _dbSet;
		public GenericRepository(ChildrenVaccinationSystemDbContext dbContext)
		{
			_context = dbContext;
			_dbSet = _context.Set<T>();
		}
		public IQueryable<T> Entities => _context.Set<T>();

		public void Delete(object entity)
		{
			_dbSet.Remove((T)entity);
		}

		public Task DeleteAsync(object entity)
		{
			_dbSet.Remove((T)entity);
			return Task.CompletedTask; // Trả về một Task hoàn thành ngay lập tức
		}

		public IEnumerable<T> GetAll()
		{
			return _dbSet.AsEnumerable();
		}

		public async Task<IList<T>> GetAllAsync()
		{
			return await _dbSet.ToListAsync();
		}

		public T? GetById(object id)
		{
			return _dbSet.Find(id);
		}

		public async Task<T?> GetByIdAsync(object id)
		{
			return await _dbSet.FindAsync(id);
		}

		public async Task<BasePaginatedList<T>> GetPaging(IQueryable<T> query, int index, int pageSize)
		{
			query = query.AsNoTracking();
			int count = await query.CountAsync();
			IReadOnlyCollection<T> items = await query.Skip((pageSize - 1) * pageSize).Take(pageSize).ToListAsync();
			return new BasePaginatedList<T>(items, count, index, pageSize);
		}

		public void Insert(T obj)
		{
			_dbSet.Add(obj);
		}

		public async Task InsertAsync(T obj)
		{
			await _dbSet.AddAsync(obj);
		}

		public void InsertRange(IList<T> obj)
		{
			_dbSet.AddRange(obj);
		}

		public void Save()
		{
			_context.SaveChanges();
		}

		public async Task SaveAsync()
		{
			await _context.SaveChangesAsync();
		}

		public void Update(T obj)
		{
			_dbSet.Entry(obj).State = EntityState.Modified;
		}

		public Task UpdateAsync(T obj)
		{
			return Task.FromResult(_dbSet.Update(obj));
		}
	}
}
