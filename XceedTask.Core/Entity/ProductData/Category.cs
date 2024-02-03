namespace XceedTask.Core.Entity.ProductData;

public class Category : BaseEntity
{
    [DynamicDisplayName(arabicName: " الاسم بالانجليزي", englishName: "English Name ")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "الاسم بالانجليزي مطلوب", englishErrorMessage: "English Name is required")]
    [StringLength(50, ErrorMessage = "It should not exceed 50 characters")]
    public string Name { get; set; }

    [DynamicDisplayName(arabicName: " الاسم بالعربي", englishName: "Arabic Name ")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "الاسم بالعربي مطلوب", englishErrorMessage: "Arabic Name is required")]
    [StringLength(50, ErrorMessage = "It should not exceed 50 characters")]
    public string NameAr { get; set; }

    //-------------------------------------------------------------------------------------------------------
    public ICollection<Product> Products { get; set; } = new List<Product>();

    //-------------------------------------------------------------------------------------------------------
}