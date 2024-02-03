using System.ComponentModel.DataAnnotations.Schema;
using XceedTask.Core.Entity.ApplicationData;

namespace XceedTask.Core.Entity.ProductData;

public class Product : BaseEntity
{
    [DynamicDisplayName(arabicName: "الاسم بالإنجليزي", englishName: "English Name")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "الاسم بالإنجليزي مطلوب", englishErrorMessage: "English name is required")]
    [StringLength(50, ErrorMessage = "It should not exceed 50 characters")]
    public string Name { get; set; }

    [DynamicDisplayName(arabicName: " الصورة", englishName: "Image ")]
    public string ImgUrl { get; set; }

    //-------------------------------------------------------------------------------------------------------

    [DynamicDisplayName(englishName: "Start Date and Time of Product Display", arabicName: "تاريخ ووقت بداية عرض المنتج")]
    [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-ddTHH:mm:ss}")]
    public DateTime StartDate { get; set; } = DateTime.Now;

    [DynamicDisplayName(englishName: "End Date and Time of Product Display", arabicName: "تاريخ ووقت انتهاء عرض المنتج")]
    [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-ddTHH:mm:ss}")]
    public DateTime Duration { get; set; } = DateTime.Now.AddDays(1);

    //-------------------------------------------------------------------------------------------------------
    [DynamicDisplayName(arabicName: "السعر", englishName: "Price")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "السعر مطلوب", englishErrorMessage: "Price is required")]
    [RangeWithDynamicErrorMessageAttribute<float>(min: 1, max: float.MaxValue, englishErrorMessage: "Price must be greater than 0", arabicErrorMessage: "يجب أن يكون السعر أكبر من 0")]
    public float Price { get; set; }

    //-------------------------------------------------------------------------------------------------------

    [ForeignKey("Category")]
    [DynamicDisplayName(arabicName: "اسم القسم ", englishName: " Category Name")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "اسم القسم مطلوب", englishErrorMessage: "Category name is required")]
    public long CategoryId { get; set; }

    public Category Category { get; set; }

    [ForeignKey("CreatedBy")]
    public string CreatedById { get; set; }

    public ApplicationUser CreatedBy { get; set; }

    public IEnumerable<ProductUpdate> ProductUpdates { get; set; } = new List<ProductUpdate>();

    //-------------------------------------------------------------------------------------------------------

    [NotMapped]
    [DynamicDisplayName(arabicName: "الصور", englishName: "Images")]
    public IFormFile ImgFile { get; set; }

    //-------------------------------------------------------------------------------------------------------
}