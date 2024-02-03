using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Linq.Expressions;
using XceedTask.Core.Entity;
using XceedTask.Core.Entity.ApplicationData;
using XceedTask.Core.Entity.ProductData;

namespace XceedTask.DataAccess
{
    public class ApplicationContext : IdentityDbContext<ApplicationUser, ApplicationRole, string>
    {
        //-----------------------------------------------------------------------------------

        public virtual DbSet<Product> Products { get; set; }

        public virtual DbSet<Category> Categories { get; set; }

        public virtual DbSet<ProductUpdate> ProductUpdates { get; set; }

        //-----------------------------------------------------------------------------------
        public ApplicationContext(DbContextOptions<ApplicationContext> options) : base(options)
        {
            // comment when use generate code
        }

        public ApplicationContext()
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(
                    "Server=MAHMOUD-SABRY-P;Database=ExceedTaskTwo;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<ApplicationUser>().ToTable("Users", "dbo");
            modelBuilder.Entity<ApplicationRole>().ToTable("Role", "dbo");
            modelBuilder.Entity<IdentityUserRole<string>>().ToTable("UserRole", "dbo");
            modelBuilder.Entity<IdentityUserClaim<string>>().ToTable("UserClaim", "dbo");
            modelBuilder.Entity<IdentityUserLogin<string>>().ToTable("UserLogin", "dbo");
            modelBuilder.Entity<IdentityUserToken<string>>().ToTable("UserTokens", "dbo");
            modelBuilder.Entity<IdentityRoleClaim<string>>().ToTable("RoleClaims", "dbo");

            // Apply the filter for all entity types that inherit from BaseEntity
            foreach (var entityType in modelBuilder.Model.GetEntityTypes())
            {
                if (!typeof(BaseEntity).IsAssignableFrom(entityType.ClrType)) continue;
                var parameter = Expression.Parameter(entityType.ClrType, "x");
                var property = Expression.Property(parameter, "IsDeleted");
                var filterExpression = Expression.Lambda(Expression.Not(property), parameter);

                modelBuilder.Entity(entityType.ClrType).HasQueryFilter(filterExpression);
            }
        }
    }
}