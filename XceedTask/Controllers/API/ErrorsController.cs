using Microsoft.AspNetCore.Http.Features;
using XceedTask.Core.DTO;

namespace XceedTask.Controllers.API;

[Route("errors/{code}")]
[ApiExplorerSettings(IgnoreApi = true)]
public class ErrorsController : ControllerBase
{
    public ActionResult Error(int code)
    {
        //Log.Information("On Action Executing => Controller Name = errors for ControllerBase , Action Name = Error  ,Error Code: {code}  ", code);

        var requestFeature = HttpContext.Features.Get<IHttpRequestFeature>();
        var isApi = requestFeature != null && requestFeature.RawTarget.Contains("/api");
        if (isApi)
        {
            return code switch
            {
                400 => BadRequest(new BaseResponse() { ErrorMessage = "A bad request, you have made", ErrorCode = code }),
                401 => Unauthorized(new BaseResponse() { ErrorMessage = "Authorized, you are not", ErrorCode = code }),
                404 => NotFound(new BaseResponse() { ErrorMessage = "This Endpoint is Not Found", ErrorCode = code }),
                500 => StatusCode(code, new BaseResponse() { ErrorMessage = "Internal Server Error", ErrorCode = code }),
                _ => StatusCode(code, new BaseResponse() { ErrorMessage = "UnKnown Server Error", ErrorCode = code }),
            };
        }
        else
        {
            return Redirect("/ErrorsMvc/Index?code=" + code);
        }
    }
}