using XceedTask.DataAccess.Interfaces;
using XceedTask.Services.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class ApplicationRolesController(IUnitOfWork unitOfWork, IRoleService roleService) : Controller
{
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
    }

    //------------------------------------------------------------------------------------------------------ index
    [Authorize(Policy = Permissions.RolesPermissions.View)]
    public async Task<ActionResult> Index()
    {
        var allRoles = await unitOfWork.Roles.FindAllAsync(isNoTracking: true);

        return View(allRoles);
    }

    //------------------------------------------------------------------------------------------------------ create
    [Authorize(Policy = Permissions.RolesPermissions.Create)]
    public IActionResult Create()
    {
        return View();
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> Create(ApplicationRole role)
    {
        if (!ModelState.IsValid) return View(role);

        var result = await roleService.CreateRoleAsync(role);

        if (result)
        {
            TempData["Success"] = _lang == "En" ? "Role Created Successfully" : "تم إنشاء الصلاحية بنجاح";
            return RedirectToAction(nameof(Index));
        }

        ModelState.AddModelError("", _lang == "En" ? "An error occurred while creating the role." : "حدث خطأ أثناء أنشاء الصلاحية.");
        return View(role);
    }

    //------------------------------------------------------------------------------------------------------ edit
    [Authorize(Policy = Permissions.RolesPermissions.Edit)]
    public async Task<ActionResult> Edit(string id)
    {
        if (id == null) return NotFound();

        var role = await roleService.GetRoleByIdAsync(id);

        if (role == null) return NotFound();

        return View(role);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> Edit(string id, ApplicationRole role)
    {
        if (id != role.Id) return NotFound();

        if (!ModelState.IsValid) return View(role);

        var result = await roleService.UpdateRoleAsync(role);

        if (result)
        {
            TempData["Success"] = _lang == "En" ? "Role Updated Successfully" : "تم تعديل الصلاحية بنجاح";
            return RedirectToAction(nameof(Index));
        }

        ModelState.AddModelError("", _lang == "En" ? "An error occurred while updating the role." : "حدث خطأ أثناء تعديل الصلاحية.");
        return View(role);
    }

    //------------------------------------------------------------------------------------------------------ delete
    [Authorize(Policy = Permissions.RolesPermissions.Delete)]
    public async Task<ActionResult> Delete(string id)
    {
        if (id == null) return NotFound();

        var result = await roleService.DeleteRoleAsync(id);

        if (result)
        {
            TempData["Success"] = _lang == "En" ? "Role Deleted Successfully" : "تم حذف الصلاحية بنجاح";
            return RedirectToAction(nameof(Index));
        }
        TempData["Error"] = _lang == "En" ? "An error occurred while deleting the role." : "حدث خطأ أثناء حذف الصلاحية.";
        return RedirectToAction(nameof(Index));
    }

    //------------------------------------------------------------------------------------------------------ Manage Permissions
    [Authorize(Policy = Permissions.RolesPermissions.Edit)]
    public async Task<ActionResult> ManagePermissions(string id)
    {
        if (id == null) return NotFound();

        var permissionsRole = await roleService.GetAllPermissionsRoleAsync(id);

        if (permissionsRole == null) return NotFound();

        return View(permissionsRole);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> ManagePermissions(string id, PermissionsFormViewModel model)
    {
        if (id == null) return NotFound();

        if (!ModelState.IsValid) return View(model);

        var result = await roleService.UpdateRolePermissionsAsync(model);

        if (result)
        {
            TempData["Success"] = _lang == "En" ? "Permissions Updated Successfully" : "تم تعديل الصلاحيات بنجاح";
            return RedirectToAction(nameof(Index));
        }

        ModelState.AddModelError("", _lang == "En" ? "An error occurred while updating the permissions." : "حدث خطأ أثناء تعديل الصلاحيات.");
        return View(model);
    }

    //------------------------------------------------------------------------------------------------------ Manage Roles
    [Authorize(Policy = Permissions.RolesPermissions.Edit)]
    public async Task<ActionResult> ManageRoles(string id)
    {
        if (id == null) return NotFound();

        var rolesUser = await roleService.GetAllRolesUserAsync(id);

        if (rolesUser == null) return NotFound();

        return View(rolesUser);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<ActionResult> ManageRoles(string id, UserRolesViewModel model)
    {
        if (id == null) return NotFound();

        if (!ModelState.IsValid) return View(model);

        var result = await roleService.UpdateUserRolesAsync(model);

        if (result)
        {
            TempData["Success"] = _lang == "En" ? "Roles Updated Successfully" : "تم تعديل الصلاحيات بنجاح";
            return RedirectToAction("Index", "ApplicationUsers");
        }

        ModelState.AddModelError("", _lang == "En" ? "An error occurred while updating the roles." : "حدث خطأ أثناء تعديل الصلاحيات.");
        return View(model);
    }
}