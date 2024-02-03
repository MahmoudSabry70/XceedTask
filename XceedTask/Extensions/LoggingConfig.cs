using Serilog;

namespace XceedTask.Extensions;

public class LoggingConfig
{
    public static void ConfigureLogger()
    {
        Log.Logger = new LoggerConfiguration()
            .MinimumLevel.Information()
            //.MinimumLevel.Debug()
            .WriteTo.Console()
            .WriteTo.File("wwwroot/Logs/log.txt",
                rollingInterval: RollingInterval.Day,
                rollOnFileSizeLimit: true)
            .CreateLogger();
    }

    //TODO : To more data in log file we can add those in the program.cs
    //builder.Host.UseSerilog();
    //app.UseSerilogRequestLogging();
}