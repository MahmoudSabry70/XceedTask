using CorePush.Apple;
using CorePush.Google;
using XceedTask.Services.Interfaces;
using XceedTask.Services.Services;

namespace XceedTask.Extensions;

public static class ApplicationServicesExtensions
{
    // interfaces sevices [IuserService, IPhotoHandling,[ INotificationService, FcmNotificationSetting, FcmSender,ApnSender ], AddAutoMapper, hangfire  ]
    public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration config)
    {
        // Session Service
        services.AddSession(options =>
        {
            options.IdleTimeout = TimeSpan.FromHours(12);
            options.Cookie.HttpOnly = true;
            options.Cookie.IsEssential = true;
        });

        // Filter Service

        services.AddScoped<LoggingActionFilter>();

        // Application Service
        services.AddScoped<IUserService, UserService>();

        services.AddScoped<IRoleService, RoleService>();
        services.AddTransient<IFileHandling, FileHandling>();
        services.AddTransient<IEmailService, EmailService>();
        services.AddHttpClient<FcmSender>();
        services.AddHttpClient<ApnSender>();
        services.Configure<EmailSetting>(config.GetSection("EmailSettings"));

        // Hangfire Service
        /* services.AddHangfire(c =>
         {
             c.UseSqlServerStorage(config.GetConnectionString("url"));
         });
         services.AddHangfireServer();

         // SignalR Service
         services.AddSignalR();
         services.AddSignalR(e =>
         {
             e.MaximumReceiveMessageSize = 102400000;
             e.EnableDetailedErrors = true;
         });*/

        return services;
    }

    public static IApplicationBuilder UseApplicationMiddleware(this IApplicationBuilder app)
    {
        app.UseSession();
        //app.UseHangfireDashboard("/Hangfire/Dashboard");

        //app.UseWebSockets();

        return app;
    }
}