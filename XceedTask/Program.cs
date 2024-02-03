using XceedTask.Middleware;
using XceedTask.SeedData;
using XceedTask.DataAccess.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddMvc(o => o.EnableEndpointRouting = false);
builder.Services.AddDistributedMemoryCache();

// api Services
builder.Services.Configure<ApiBehaviorOptions>(options => options.SuppressModelStateInvalidFilter = true); // validation Error Api
builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

// context && json services && IBaseRepository && IUnitOfWork Service
builder.Services.AddContextServices(builder.Configuration);

// Services [IuserService, IPhotoHandling, AddAutoMapper, Hangfire ,
// Session , SignalR ,[ INotificationService, FcmNotificationSetting, FcmSender,ApnSender ]  ]
builder.Services.AddApplicationServices(builder.Configuration);

// Identity services && JWT
builder.Services.AddIdentityServices(builder.Configuration);

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(
        policy =>
        {
            policy.AllowAnyOrigin();
            policy.AllowAnyMethod();
            policy.AllowAnyHeader();
        });
});

// serilog services
LoggingConfig.ConfigureLogger();
MappingConfig.ConfigureMappings();

var app = builder.Build();

using (var scope = app.Services.CreateScope())
{
    var unitOfWork = scope.ServiceProvider.GetRequiredService<IUnitOfWork>();
    var userManager = scope.ServiceProvider.GetRequiredService<UserManager<ApplicationUser>>();
    var roleManager = scope.ServiceProvider.GetRequiredService<RoleManager<ApplicationRole>>();

    // Call the SeedCategory method
    SeedData.SeedCategory(unitOfWork).GetAwaiter().GetResult();

    // Call the SeedUserAndRole method
    SeedData.SeedUserAndRole(unitOfWork, userManager, roleManager).GetAwaiter().GetResult();
}

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseMiddleware<ExceptionMiddleware>();
    app.UseExceptionHandler("/ErrorsMvc/Index/{0}");
}

app.UseStatusCodePagesWithReExecute("/Errors/{0}");

app.UseStaticFiles();
app.UseHttpsRedirection();
app.UseRouting();
app.UseCors();

app.UseAuthentication();
app.UseAuthorization();

app.UseApplicationMiddleware();

//app.MapHub<ApplicationHub>("/ApplicationHub");
app.MapControllers();

app.UseMvc(routes =>
{
    routes.MapRoute(
        name: "default",
        //template: "{controller=Home}/{action=Index}/{id?}");
        template: "{controller=Products}/{action=Index}/{id?}");
});

app.Run();