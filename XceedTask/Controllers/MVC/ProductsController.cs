using Serilog;
using XceedTask.Core.Entity.ProductData;
using XceedTask.DataAccess.Interfaces;
using XceedTask.Services.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class ProductsController(IUnitOfWork unitOfWork, UserManager<ApplicationUser> userManager, IFileHandling fileHandling) : Controller
{
    private string _lang = "En";
    private ApplicationUser _user;
    private string _userId;

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
        _userId = userManager.GetUserId(User);
        _user = unitOfWork.Users.Find(s => s.Id == _userId);
    }

    //------------------------------------------------------------------------------------------------------------------------
    public async Task<IActionResult> Index(long id = 0)
    {
        ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
        return View(await GetData(id));
    }

    [Authorize(Policy = Permissions.CategoryPermissions.View)]
    public async Task<IActionResult> IndexForAdmin()
    {
        ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
        return View(await GetData(0, true));
    }

    [HttpPost]
    public async Task<ActionResult> IndexFilter(long id, bool forAdmin)
    {
        return forAdmin ? PartialView("_IndexProductForAdminPartialView", await GetData(id, true)) : PartialView("_IndexProductPartialView", await GetData(id));
    }

    //------------------------------------------------------------------------------------------------------------------------
    public async Task<IReadOnlyList<ProductViewModel>> GetData(long id, bool forAdmin = false)
    {
        return await unitOfWork.Products.FindByQuery(
                criteria: s => (id == 0 || s.CategoryId == id) && (forAdmin != false || s.Duration > DateTime.Now)
                , isNoTracking: true)
            .Select(s => new ProductViewModel
            {
                Id = s.Id,
                Name = s.Name,
                CategoryId = s.CategoryId,
                CategoryName = _lang == "En" ? s.Category.Name : s.Category.NameAr,
                CreatedByFullName = s.CreatedBy.FullName,
                CreatedById = s.CreatedById,
                StartDate = s.StartDate,
                Duration = s.Duration,
                Price = s.Price,
                ImgUrl = s.ImgUrl
            }).ToListAsync();
    }

    //------------------------------------------------------------------------------------------------------------------------
    [Authorize(Policy = Permissions.CategoryPermissions.Create)]
    public async Task<IActionResult> Create()
    {
        ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");

        return View(new Product());
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(Product model)
    {
        if (!ModelState.IsValid)
        {
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (model.ImgFile == null)
        {
            ModelState.AddModelError("ImgFile", _lang == "En" ? "Image is required" : "الصورة مطلوبة");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (!model.ImgFile.IsImage())
        {
            ModelState.AddModelError("ImgFile", _lang == "En" ? "Invalid image" : "صورة غير صالحة");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (!model.ImgFile.CheckFileSize(1))
        {
            ModelState.AddModelError("ImgFile", _lang == "En" ? "Image size must be less than 1 MB" : "يجب أن يكون حجم الصورة أقل من 1 ميغابايت");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (model.StartDate > model.Duration)
        {
            ModelState.AddModelError("StartDate", _lang == "En" ? "Start date must be less than end date" : "يجب أن يكون تاريخ البداية أقل من تاريخ النهاية");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        model.CreatedById = _user.Id;
        model.CreatedAt = DateTime.Now;
        model.ImgUrl = await fileHandling.UploadFileAsync(model.ImgFile, "Products");

        await unitOfWork.Products.AddAsync(model);
        await unitOfWork.SaveChangesAsync();

        return RedirectToAction(nameof(IndexForAdmin));
    }

    //------------------------------------------------------------------------------------------------------------------------

    // GET: Categories/Details/5
    [Authorize(Policy = Permissions.CategoryPermissions.Details)]
    public async Task<IActionResult> Details(long? id)
    {
        if (id == null || unitOfWork.Products == null)
        {
            return NotFound();
        }

        var product = await unitOfWork.Products.FindByQuery(
                criteria: s => s.Id == id
                , isNoTracking: true)
            .Select(s => new ProductViewModel
            {
                Id = s.Id,
                Name = s.Name,
                CategoryId = s.CategoryId,
                CategoryName = _lang == "En" ? s.Category.Name : s.Category.NameAr,
                CreatedByFullName = s.CreatedBy.FullName,
                CreatedById = s.CreatedById,
                StartDate = s.StartDate,
                Duration = s.Duration,
                Price = s.Price,
                ImgUrl = s.ImgUrl,
                CreatedAt = s.CreatedAt
            }).FirstOrDefaultAsync();

        if (product == null)
        {
            return NotFound();
        }

        return View(product);
    }

    // GET: Categories/Edit/5
    [Authorize(Policy = Permissions.CategoryPermissions.Edit)]
    public async Task<IActionResult> Edit(long? id)
    {
        if (id == null || unitOfWork.Products == null)
        {
            return NotFound();
        }

        var product = await unitOfWork.Products.FindByQuery(s => s.Id == id.Value, isNoTracking: true)
                .Select(s => new ProductEditViewModel
                {
                    Id = s.Id,
                    Name = s.Name,
                    CategoryId = s.CategoryId,
                    StartDate = s.StartDate,
                    Duration = s.Duration,
                    Price = s.Price,
                    ImgUrl = s.ImgUrl
                }).FirstOrDefaultAsync();
        if (product == null)
        {
            return NotFound();
        }
        ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
        return View(product);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(long id, ProductEditViewModel model)
    {
        if (id != model.Id)
        {
            return NotFound();
        }
        var product = await unitOfWork.Products.FindAsync(s => s.Id == id, isNoTracking: true);
        if (product == null)
        {
            return NotFound();
        }

        if (!ModelState.IsValid)
        {
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (model.ImgFile == null && string.IsNullOrEmpty(model.ImgUrl))
        {
            ModelState.AddModelError("ImgFile", _lang == "En" ? "Image is required" : "الصورة مطلوبة");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (model.ImgFile != null && !model.ImgFile.IsImage())
        {
            ModelState.AddModelError("ImgFile", _lang == "En" ? "Invalid image" : "صورة غير صالحة");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (model.ImgFile != null && !model.ImgFile.CheckFileSize(1))
        {
            ModelState.AddModelError("ImgFile", _lang == "En" ? "Image size must be less than 1 MB" : "يجب أن يكون حجم الصورة أقل من 1 ميغابايت");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        if (model.StartDate > model.Duration)
        {
            ModelState.AddModelError("StartDate", _lang == "En" ? "Start date must be less than end date" : "يجب أن يكون تاريخ البداية أقل من تاريخ النهاية");
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            return View(model);
        }

        try
        {
            // product = model.Adapt<Product>();

            product.Name = model.Name;
            product.CategoryId = model.CategoryId;
            product.StartDate = model.StartDate;
            product.Duration = model.Duration;
            product.Price = model.Price;
            product.ImgUrl = model.ImgFile != null ? await fileHandling.UploadFileAsync(model.ImgFile, "Products", product.ImgUrl) : product.ImgUrl;
            product.IsUpdated = true;
            product.UpdatedAt = DateTime.Now;

            unitOfWork.Products.Update(product);
            await unitOfWork.SaveChangesAsync();

            await unitOfWork.ProductUpdates.AddAsync(new ProductUpdate()
            {
                ProductId = model.Id,
                UpdatedById = _user.Id,
                UpdateDate = DateTime.Now
            });
            await unitOfWork.SaveChangesAsync();
            Log.Information($"Update Product => Product Id = {model.Id},Product Name = {model.Name}, Admin Name = {_user.FullName}, Admin Id = {_user.Id} , Update Date {DateTime.Now}");
        }
        catch
        {
            ViewData["Categories"] = new SelectList(await unitOfWork.Categories.FindAllAsync(), "Id", (_lang == "En") ? "Name" : "NameAr");
            ModelState.AddModelError("", _lang == "En" ? "An error occurred while updating the Product" : "حدث خطأ أثناء تعديل المنتج");
            return View(model);
        }

        return RedirectToAction(nameof(IndexForAdmin));
    }

    //------------------------------------------------------------------------------------------------------------------------
    [Authorize(Policy = Permissions.CategoryPermissions.Delete)]
    public async Task<IActionResult> Delete(long? id)
    {
        if (id == null || unitOfWork.Products == null)
        {
            return NotFound();
        }

        var product = await unitOfWork.Products.FindAsync(m => m.Id == id);
        if (product != null)
        {
            product.IsDeleted = true;
            product.DeletedAt = DateTime.Now;
            unitOfWork.Products.Update(product);
            await unitOfWork.SaveChangesAsync();
            TempData["Success"] = _lang == "En" ? "Deleted successfully." : "تم الحذف بنجاح";
            return RedirectToAction(nameof(IndexForAdmin));
        }

        TempData["Error"] = _lang == "En" ? "An error occurred while deleting." : "حدث خطأ أثناء الحذف";
        return RedirectToAction(nameof(IndexForAdmin));
    }
}