using XceedTask.DataAccess.Interfaces;
using XceedTask.Services.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class ApplicationUsersController(IUnitOfWork unitOfWork, IUserService userService) : Controller
{
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
    }

    // GET: AdminController
    [Authorize(Policy = Permissions.UsersPermissions.View)]
    public async Task<ActionResult> Index()
    {
        var allAdmins = await unitOfWork.Users.FindByQuery(s => s.IsAdmin == true && s.UserType == UserType.Admin, isNoTracking: true)
            .Select(s => new ApplicationUserIndexViewModel
            {
                Id = s.Id,
                FullName = s.FullName,
                PhoneNumber = s.PhoneNumber,
                Email = s.Email,
                Status = s.Status,
                UserImgUrl = s.UserImgUrl
            }).ToListAsync();
        return View(allAdmins);
    }

    [Authorize(Policy = Permissions.UsersPermissions.View)]
    public async Task<ActionResult> UsersIndex()
    {
        var allAdmins = await unitOfWork.Users.FindByQuery(s => s.IsAdmin == false && s.UserType == UserType.User, isNoTracking: true)
            .Select(s => new ApplicationUserIndexViewModel
            {
                Id = s.Id,
                FullName = s.FullName,
                PhoneNumber = s.PhoneNumber,
                Email = s.Email,
                Status = s.Status,
                UserImgUrl = s.UserImgUrl,
            }).ToListAsync();

        return View("IndexUsers", allAdmins);
    }

    //------------------------------------------------------------------------------------------------------- Create
    // GET: AdminController/Create
    [Authorize(Policy = Permissions.UsersPermissions.Create)]
    public IActionResult Create()
    {
        return View(new RegisterAdminViewModel());
    }

    // POST: AdminController/Create
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> Create(RegisterAdminViewModel adminModel)
    {
        if (!ModelState.IsValid) return View(adminModel);

        var result = await userService.RegisterAdminAsync(adminModel);
        if (!result.IsAuthenticated)
        {
            ModelState.AddModelError("", result.ArMessage);
            return View(adminModel);
        }
        else
        {
            return RedirectToAction(nameof(Index));
        }
    }

    //-------------------------------------------------------------------------------------------------------  Edit
    // GET: AdminController/Edit/userId
    [Authorize(Policy = Permissions.UsersPermissions.Edit)]
    public async Task<IActionResult> Edit(string id)
    {
        if (id == null)
        {
            return NotFound();
        }
        var admin = await unitOfWork.Users.FindAsync(s => s.IsAdmin && s.Id == id);
        if (admin == null)
        {
            return NotFound();
        }
        UpdateProfileAdminViewModel updateAdmin = new()
        {
            UserId = admin.Id,
            FullName = admin.FullName,
            Email = admin.Email,
            PhoneNumber = admin.PhoneNumber,
            ImgUrl = admin.UserImgUrl,
        };

        return View(updateAdmin);
    }

    // POST: AdminController/Edit/userId
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string id, UpdateProfileAdminViewModel adminModel)
    {
        var admin = await unitOfWork.Users.FindAsync(s => s.IsAdmin && s.Id == adminModel.UserId, isNoTracking: true);
        if (admin == null)
        {
            return NotFound();
        }

        if (!ModelState.IsValid) return View(adminModel);
        var result = await userService.UpdateAdminProfile(adminModel.UserId, adminModel);

        if (!result.IsAuthenticated)
        {
            ModelState.AddModelError("", result.ArMessage);
            return View(adminModel);
        }
        else
        {
            return RedirectToAction(nameof(Index));
        }
    }

    //------------------------------------------------------------------------------------------------------- Details

    // GET: AdminController/Details/userId
    [Authorize(Policy = Permissions.UsersPermissions.Details)]
    public async Task<IActionResult> Details(string id)
    {
        if (id == null)
        {
            return NotFound();
        }
        var admin = await unitOfWork.Users.FindAsync(s => s.IsAdmin && s.Id == id);
        if (admin == null)
        {
            return NotFound();
        }
        return View(admin);
    }

    //-------------------------------------------------------------------------------------------------------
    [Authorize(Policy = Permissions.UsersPermissions.Edit)]
    public async Task<ActionResult> Activate(string id)
    {
        await userService.Activate(id);
        TempData["Success"] = _lang == "En" ? "The account has been activated successfully" : "تم تفعيل الحساب بنجاح";
        return RedirectToAction("Index");
    }

    [Authorize(Policy = Permissions.UsersPermissions.Edit)]
    public async Task<ActionResult> Suspend(string id)
    {
        await userService.Suspend(id);
        TempData["Success"] = _lang == "En" ? "The account has been suspended successfully" : "تم إيقاف الحساب بنجاح";
        return RedirectToAction("Index");
    }

    //-------------------------------------------------------------------------------------------------------
    [Authorize(Policy = Permissions.UsersPermissions.Edit)]
    public async Task<IActionResult> ChangePassword(string id)
    {
        ChangePasswordAdminViewModel changePasswordAdmin = new();
        var admin = await unitOfWork.Users.FindAsync(s => s.IsAdmin && s.Id == id);
        if (admin == null)
        {
            return NotFound();
        }

        changePasswordAdmin.UserId = admin.Id;
        changePasswordAdmin.PhoneNumber = admin.PhoneNumber;
        changePasswordAdmin.FullName = admin.FullName;
        changePasswordAdmin.Email = admin.Email;

        return View(changePasswordAdmin);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> ChangePassword(ChangePasswordAdminViewModel changePassword)
    {
        if (!ModelState.IsValid)
        {
            return View(changePassword);
        }
        var result = await userService.ChangePasswordAsync(changePassword.UserId, changePassword.Password);
        if (result.IsAuthenticated)
        {
            TempData["Success"] = _lang == "En" ? "Password has been changed successfully" : "تم تغير كلمة السر بنجاح";
            return RedirectToAction("Index");
        }
        else
        {
            ModelState.AddModelError("", result.ArMessage);
            return View(changePassword);
        }
    }
}