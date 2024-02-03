using XceedTask.DataAccess.Interfaces;
using XceedTask.Services.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class HomeController(
    IUnitOfWork unitOfWork,
    IUserService userService,
    SignInManager<ApplicationUser> signInManager,
    UserManager<ApplicationUser> userManager)
    : Controller
{
    private readonly IUnitOfWork _unitOfWork = unitOfWork;
    private readonly IUserService _userService = userService;
    private readonly SignInManager<ApplicationUser> _signInManager = signInManager;
    private readonly UserManager<ApplicationUser> _userManager = userManager;
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
    }

    //------------------------------------------------------------------------------------
    public Task<IActionResult> Index()
    {
        return Task.FromResult<IActionResult>(View());
    }

    //------------------------------------------------------------------------------------ Language and Mode

    #region Helpers Methods

    //---------------------------------------------------------- change language

    public IActionResult ChangeLang(string returnUrl)
    {
        if (_lang == "En")
        {
            Response.Cookies.Delete("lang");
            Response.Cookies.Append("lang", "Ar");
        }
        else
        {
            Response.Cookies.Delete("lang");
            Response.Cookies.Append("lang", "En");
        }

        if (returnUrl == null)
        {
            return RedirectToAction(nameof(Index));
        }

        return LocalRedirect(returnUrl);
    }

    #endregion Helpers Methods

    //------------------------------------------------------------------------------------

    //------------------------------------------------------------------------------------
}