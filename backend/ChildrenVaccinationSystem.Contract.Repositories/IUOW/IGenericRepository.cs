﻿using ChildrenVaccinationSystem.Core.Base;
using System;
using System.Collections.Generic;
namespace ChildrenVaccinationSystem.Contract.Repositories.IUOW
{
	public interface IGenericRepository<T> where T : class
	{
		// query
		IQueryable<T> Entities { get; }

		// non async
		IEnumerable<T> GetAll();
		T? GetById(object id);
		void Insert(T obj);
		void InsertRange(IList<T> obj);
		void Update(T obj);
		void Delete(object entity);
		void Save();

		// async
		Task<IList<T>> GetAllAsync();
		Task<BasePaginatedList<T>> GetPaging(IQueryable<T> query, int index, int pageSize);
		Task<T?> GetByIdAsync(object id);
		Task InsertAsync(T obj);
		Task UpdateAsync(T obj);
		Task DeleteAsync(object id);
		Task SaveAsync();
	}
}
