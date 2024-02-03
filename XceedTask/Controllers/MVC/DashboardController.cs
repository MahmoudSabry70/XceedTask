using XceedTask.Core.ViewModel;
using XceedTask.DataAccess.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class DashboardController(UserManager<ApplicationUser> userManager, IUnitOfWork unitOfWork)
    : Controller
{
    private ApplicationUser _user;
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        var userId = userManager.GetUserId(User);
        _user = unitOfWork.Users.Find(s => s.Id == userId);
        _lang = Request.Cookies["lang"] ?? "En";
    }

    //--------------------------------------------------------------------------------------------------------------

    /* [Authorize(Policy = Permissions.DesignPermissions.All)]
     public IActionResult Switcher()
     {
         return View();
     }*/

    //--------------------------------------------------------------------------------------------------------------

    [Authorize(Policy = Permissions.DashboardPermissions.View)]
    public IActionResult CheckUser()
    {
        if (_user == null)
        {
            return RedirectToAction("Login", "Account");
        }

        return _user.UserType switch
        {
            UserType.Admin when _user.IsAdmin => RedirectToAction("Index", "Dashboard"),
            UserType.User when !_user.IsAdmin => RedirectToAction("Login", "Account"),
            _ => RedirectToAction("Login", "Account")
        };
    }

    [Authorize(Policy = Permissions.DashboardPermissions.View)]
    public IActionResult Index()
    {
        var countData = new DashboardCounts()
        {
            ShowProducts = unitOfWork.Products.Count(s => s.Duration > DateTime.Now),
            AllProducts = unitOfWork.Products.Count(),
            AllCategories = unitOfWork.Categories.Count()
        };
        return View(countData);
    }
}