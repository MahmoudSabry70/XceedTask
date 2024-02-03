using XceedTask.DataAccess.Interfaces;

namespace XceedTask.Controllers.MVC;

[ServiceFilter(typeof(LoggingActionFilter))]
public class ProductUpdatesController(IUnitOfWork unitOfWork) : Controller
{
    private string _lang = "En";

    public override void OnActionExecuting(ActionExecutingContext context)
    {
        _lang = Request.Cookies["lang"] ?? "En";
    }

    // GET: Categories

    [Authorize(Policy = Permissions.ProductUpdatesPermissions.View)]
    public async Task<IActionResult> Index(long? id)
    {
        if (id == null)
            return NotFound();

        var productUpdates = await unitOfWork.ProductUpdates.FindByQuery(s => s.ProductId == id)
            .Select(s => new ProductUpdatesViewModel
            {
                Id = s.Id,
                ProductId = s.ProductId,
                ProductName = s.Product.Name,
                ProductImgUrl = s.Product.ImgUrl,
                UpdatedById = s.UpdatedById,
                UpdatedByFullName = s.UpdatedBy.FullName,
                UpdateDate = s.UpdateDate
            })
            .ToListAsync();
        return View(productUpdates);
    }
}