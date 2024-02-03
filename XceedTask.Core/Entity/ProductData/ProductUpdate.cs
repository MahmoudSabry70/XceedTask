using System.ComponentModel.DataAnnotations.Schema;
using XceedTask.Core.Entity.ApplicationData;

namespace XceedTask.Core.Entity.ProductData;

public class ProductUpdate : BaseEntity
{
    [ForeignKey("Product")]
    public long ProductId { get; set; }

    public Product Product { get; set; }

    [ForeignKey("UpdatedBy")]
    public string UpdatedById { get; set; }

    public ApplicationUser UpdatedBy { get; set; }

    //-------------------------------------------------------------------------------------------------------

    public DateTime UpdateDate { get; set; } = DateTime.Now;
}