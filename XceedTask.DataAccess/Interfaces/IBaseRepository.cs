using Microsoft.EntityFrameworkCore.Query;
using System.Linq.Expressions;

namespace XceedTask.DataAccess.Interfaces;

public interface IBaseRepository<T> where T : class
{
    T GetById(long id);

    Task<T> GetByIdAsync(long id);

    IEnumerable<T> GetAll(Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null, Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, bool isNoTracking = true);

    Task<IEnumerable<T>> GetAllAsync(Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null, Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, bool isNoTracking = true);

    //------------------------------------------------------------------------------------------------
    T Find(Expression<Func<T, bool>> criteria, Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null, bool isNoTracking = false);

    Task<T> FindAsync(Expression<Func<T, bool>> criteria, Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null, bool isNoTracking = false);

    IEnumerable<T> FindAll(
        Expression<Func<T, bool>> criteria = null,
        int? take = null, int? skip = null,
        Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null,
        Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, bool isNoTracking = false
    );

    Task<IEnumerable<T>> FindAllAsync(
        Expression<Func<T, bool>> criteria = null,
        int? take = null, int? skip = null,
        Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null,
        Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, bool isNoTracking = false
    );

    IQueryable<T> FindByQuery(
        Expression<Func<T, bool>> criteria = null,
        int? take = null, int? skip = null,
        Func<IQueryable<T>, IIncludableQueryable<T, object>> include = null,
        Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null, bool isNoTracking = false
    );

    //-------------------------------------------------------------------
    T Add(T entity);

    Task<T> AddAsync(T entity);

    IEnumerable<T> AddRange(IEnumerable<T> entities);

    Task<IEnumerable<T>> AddBulkInsert(IEnumerable<T> entities);

    Task<IEnumerable<T>> AddRangeAsync(IEnumerable<T> entities);

    //-------------------------------------------------------------------
    bool IsExist(Expression<Func<T, bool>> criteria);

    //-------------------------------------------------------------------
    int UpdateAll(Expression<Func<T, bool>> criteria,
        Expression<Func<SetPropertyCalls<T>, SetPropertyCalls<T>>> updateExpression = null);

    T Update(T entity);

    int DeleteAll(Expression<Func<T, bool>> criteria);

    void Delete(T entity);

    void DeleteRange(IEnumerable<T> entities);

    void Attach(T entity);

    void AttachRange(IEnumerable<T> entities);

    void DeAttach(T entity);

    void DeAttachRange(IEnumerable<T> entities);

    //-------------------------------------------------------------------
    int Count();

    int Count(Expression<Func<T, bool>> criteria);

    Task<int> CountAsync();

    Task<int> CountAsync(Expression<Func<T, bool>> criteria);
}
