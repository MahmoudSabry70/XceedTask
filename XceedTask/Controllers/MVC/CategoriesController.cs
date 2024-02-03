using XceedTask.Core.Entity.ProductData;
using XceedTask.DataAccess.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class CategoriesController(IUnitOfWork unitOfWork) : Controller
{
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
    }

    // GET: Categories

    [Authorize(Policy = Permissions.CategoryPermissions.View)]
    public async Task<IActionResult> Index()
    {
        var categories = await unitOfWork.Categories.FindByQuery()
            .Select(s => new CategoryViewModel
            {
                Id = s.Id,
                Name = _lang == "En" ? s.Name : s.NameAr,
                ProductCount = s.Products.Count
            })
            .ToListAsync();
        return View(categories);
    }

    // GET: Categories/Details/5
    [Authorize(Policy = Permissions.CategoryPermissions.Details)]
    public async Task<IActionResult> Details(long? id)
    {
        if (id == null || unitOfWork.Categories == null)
        {
            return NotFound();
        }

        var category = await unitOfWork.Categories.FindAsync(m => m.Id == id);
        if (category == null)
        {
            return NotFound();
        }

        return View(category);
    }

    // GET: Categories/Edit/5
    [Authorize(Policy = Permissions.CategoryPermissions.Edit)]
    public async Task<IActionResult> Edit(long? id)
    {
        if (id == null || unitOfWork.Categories == null)
        {
            return NotFound();
        }

        var category = await unitOfWork.Categories.GetByIdAsync(id.Value);
        if (category == null)
        {
            return NotFound();
        }
        return View(category);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(long id, Category model)
    {
        if (id != model.Id)
        {
            return NotFound();
        }

        if (!ModelState.IsValid) return View(model);

        try
        {
            unitOfWork.Categories.Update(model);
            await unitOfWork.SaveChangesAsync();
        }
        catch
        {
            ModelState.AddModelError("", _lang == "En" ? "An error occurred while updating the model" : "حدث خطأ أثناء تعديل القسم");
            return View(model);
        }

        return RedirectToAction(nameof(Index));
    }
}