using Serilog;
using System.Net;
using System.Text.Json;
using XceedTask.Core.DTO;
using JsonSerializer = System.Text.Json.JsonSerializer;

namespace XceedTask.Middleware;

public class ExceptionMiddleware(RequestDelegate next, IHostEnvironment env)
{
    public async Task InvokeAsync(HttpContext context)
    {
        // var endpoint = context.GetEndpoint(); // endpoint != null &&
        var isApi = context.Request.Path.StartsWithSegments("/api");
        if (isApi)
        {
            try
            {
                await next(context);
            }
            catch (Exception ex)
            {
                //_logger.LogError(ex, ex.Message);
                Log.Error($"Exception Data => {ex} , Exception Message {ex.Message}");
                context.Response.ContentType = "application/json";
                context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

                var response = env.IsDevelopment()
                    ? new BaseResponse()
                    {
                        ErrorCode = (int)HttpStatusCode.InternalServerError,
                        ErrorMessage = ex.Message,
                        Data = ex.StackTrace
                    }
                    : new BaseResponse()
                    {
                        ErrorCode = (int)HttpStatusCode.InternalServerError,
                        ErrorMessage = "Internal Server Error"
                    };

                var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };

                var json = JsonSerializer.Serialize(response, options);

                await context.Response.WriteAsync(json);
            }
        }
        else
        {
            try
            {
                await next(context);
            }
            catch (Exception ex)
            {
                //_logger.LogError(ex, ex.Message);
                Log.Error($"Exception Data => {ex} , Exception Message {ex.Message}");

                if (env.IsDevelopment())
                {
                    // _logger.LogError(ex, ex.Message);
                    context.Response.ContentType = "application/json";
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

                    var response = env.IsDevelopment()
                        ? new BaseResponse()
                        {
                            ErrorCode = (int)HttpStatusCode.InternalServerError,
                            ErrorMessage = ex.Message,
                            Data = ex.StackTrace
                        }
                        : new BaseResponse()
                        {
                            ErrorCode = (int)HttpStatusCode.InternalServerError,
                            ErrorMessage = "Internal Server Error"
                        };

                    var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };

                    var json = JsonSerializer.Serialize(response, options);

                    await context.Response.WriteAsync(json);
                }
                else
                {
                    context.Response.Redirect("/ErrorsMvc/Index?code=500");
                }
            }
        }
    }
}