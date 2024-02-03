using System.Text.Json.Serialization;
using XceedTask.DataAccess;
using XceedTask.DataAccess.Interfaces;
using XceedTask.DataAccess.Repositories;

namespace XceedTask.Extensions;

public static class ContextServicesExtensions
{
    public static IServiceCollection AddContextServices(this IServiceCollection services, IConfiguration config)
    {
        //- context && json services
        services.AddDbContext<ApplicationContext>(options => options.UseSqlServer(config.GetConnectionString("url")));
        services.AddControllers().AddJsonOptions(x => x.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles);
        services.AddControllers().AddNewtonsoftJson(x => x.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

        // IBaseRepository && IUnitOfWork Service
        services.AddTransient<IUnitOfWork, UnitOfWork>(); // Repository and UnitOfWork

        return services;
    }
}