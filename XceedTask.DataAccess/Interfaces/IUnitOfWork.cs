using Microsoft.AspNetCore.Identity;
using XceedTask.Core.Entity.ApplicationData;
using XceedTask.Core.Entity.ProductData;
using XceedTask.DataAccess.Interfaces;

namespace XceedTask.DataAccess.Interfaces
{
    public interface IUnitOfWork : IDisposable
    {
        IBaseRepository<ApplicationUser> Users { get; }
        IBaseRepository<ApplicationRole> Roles { get; }
        IBaseRepository<IdentityRoleClaim<string>> RoleClaims { get; }

        //-----------------------------------------------------------------------------------

        IBaseRepository<Product> Products { get; }
        IBaseRepository<ProductUpdate> ProductUpdates { get; }
        IBaseRepository<Category> Categories { get; }
        //-----------------------------------------------------------------------------------

        //-----------------------------------------------------------------------------------

        //-----------------------------------------------------------------------------------

        //-----------------------------------------------------------------------------------
        int SaveChanges();

        Task<int> SaveChangesAsync();
    }
}
