using XceedTask.Services.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class AccountController(
    IUserService userService,
    SignInManager<ApplicationUser> signInManager)
    : Controller
{
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
    }

    //-------------------------------------------------------------------------------------------------------
    public IActionResult Login()
    {
        return View(new LoginViewModel());
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(LoginViewModel model)
    {
        if (!ModelState.IsValid)
        {
            return View(model);
        }

        var result = await userService.LoginAsync(model);
        if (!result.IsAuthenticated)
        {
            ModelState.AddModelError(string.Empty, _lang == "En" ? result.Message : result.ArMessage);
            return View(model);
        }
        var user = await userService.GetUserByEmail(model.Email);

        if (user.IsAdmin)
        {
            await signInManager.SignInAsync(user, model.IsPersist);
            return RedirectToAction("Index", "Dashboard");
        }

        ModelState.AddModelError(string.Empty, _lang == "En" ? "You do not have the necessary permissions to log in." : "لا تملك الصلاحية اللازمة للدخول");
        return View(model);
    }

    public async Task<IActionResult> Logout()
    {
        if (User.Identity != null)
        {
            var userName = User.Identity.Name;
            await userService.Logout(userName);
        }
        await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
        await signInManager.SignOutAsync();//expires cookie
        return RedirectToAction("Login");
    }

    //-------------------------------------------------------------------------------------------------------  open account by Admin
    [HttpGet]
    public IActionResult ChangePassword(string userId)
    {
        ChangePasswordUserViewModel model = new() { UserId = userId };
        return View(model);
    }

    [HttpPost]
    public async Task<IActionResult> ChangePassword(ChangePasswordUserViewModel model)
    {
        if (!ModelState.IsValid)
        {
            return View(model);
        }
        var result = await userService.ChangePasswordAsync(model.UserId, model.Password);
        if (result.IsAuthenticated)
        {
            return RedirectToAction("Login");
        }
        else
        {
            ModelState.AddModelError(string.Empty, result.ArMessage);
            return View(model);
        }
    }
}