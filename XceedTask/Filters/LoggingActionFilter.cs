using Serilog;

namespace XceedTask.Filters;

public class LoggingActionFilter : IActionFilter
{
    public void OnActionExecuted(ActionExecutedContext context)
    {
        // Do something after the action executes.
    }

    public void OnActionExecuting(ActionExecutingContext context)
    {
        if (context.HttpContext.Request.Cookies["lang"] == null)
        {
            context.HttpContext.Response.Cookies.Append("lang", "En");
        }

        if (context.HttpContext.Request.Cookies["Mode"] == null)
        {
            context.HttpContext.Response.Cookies.Append("Mode", "Dark");
        }

        var controllerName = context.RouteData.Values["controller"]?.ToString();
        var actionName = context.RouteData.Values["action"]?.ToString();
        var requestMethod = context.HttpContext.Request.Method;

        Log.Information($"On Action Executing => Controller Name = {controllerName}, Action Name = {actionName}, Request Method = {requestMethod}");
    }
}