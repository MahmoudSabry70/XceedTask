using Microsoft.AspNetCore.Identity;
using XceedTask.Core;
using XceedTask.Core.Entity.ApplicationData;
using XceedTask.Core.Entity.ProductData;
using XceedTask.DataAccess;
using XceedTask.DataAccess.Interfaces;
using XceedTask.DataAccess.Repositories;

namespace XceedTask.DataAccess.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApplicationContext _context;

        public IBaseRepository<ApplicationUser> Users { get; private set; }
        public IBaseRepository<ApplicationRole> Roles { get; private set; }

        public IBaseRepository<IdentityRoleClaim<string>> RoleClaims { get; private set; }
        public IBaseRepository<Product> Products { get; private set; }

        public IBaseRepository<ProductUpdate> ProductUpdates { get; private set; }
        public IBaseRepository<Category> Categories { get; private set; }

        public UnitOfWork(ApplicationContext context)
        {
            _context = context;
            Users = new BaseRepository<ApplicationUser>(_context);
            Roles = new BaseRepository<ApplicationRole>(_context);
            RoleClaims = new BaseRepository<IdentityRoleClaim<string>>(_context);
            Products = new BaseRepository<Product>(_context);
            Categories = new BaseRepository<Category>(_context);
            ProductUpdates = new BaseRepository<ProductUpdate>(_context);
        }

        public int SaveChanges()
        {
            return _context.SaveChanges();
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public void Dispose()
        {
            _context.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
