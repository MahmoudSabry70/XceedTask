using XceedTask.Core.DTO;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class ErrorsMvcController : Controller
{
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
    }

    public IActionResult Index(int code, string details = null)
    {
        return code switch
        {
            400 => View(new BaseResponse() { ErrorMessage = _lang == "En" ? "A bad request, you have made" : "طلب غير صالح قد قمت به", ErrorCode = code }),
            401 => View(new BaseResponse() { ErrorMessage = _lang == "En" ? "You are not authorized" : "أنت غير مصرح لك", ErrorCode = code }),
            404 => View(new BaseResponse() { ErrorMessage = _lang == "En" ? "The requested URL was not found on this server. " : "لم يتم العثور على العنوان  المطلوب على هذا الخادم.", ErrorCode = code }),
            500 => View(new BaseResponse() { ErrorMessage = _lang == "En" ? "Internal Server Error" : "خطأ داخلي في الخادم", ErrorCode = code, Data = details }),
            _ => null
        };
    }
}