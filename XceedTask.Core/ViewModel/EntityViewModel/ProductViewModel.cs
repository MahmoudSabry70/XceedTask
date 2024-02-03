namespace XceedTask.Core.ViewModel.EntityViewModel;

public class ProductViewModel
{
    [DynamicDisplayName(englishName: "ID", arabicName: "المعرف")]
    public long Id { get; set; }

    [DynamicDisplayName(englishName: "Name", arabicName: "الاسم")]
    public string Name { get; set; }

    [DynamicDisplayName(englishName: "Category ID", arabicName: "معرف الفئة")]
    public long CategoryId { get; set; }

    [DynamicDisplayName(englishName: "Category Name", arabicName: "اسم الفئة")]
    public string CategoryName { get; set; }

    [DynamicDisplayName(englishName: "Created By Full Name", arabicName: "اسم الشخص الذي أنشأه")]
    public string CreatedByFullName { get; set; }

    [DynamicDisplayName(englishName: "Created By ID", arabicName: "معرف الشخص الذي أنشأه")]
    public string CreatedById { get; set; }

    [DynamicDisplayName(englishName: "Start Date and Time of Product Display", arabicName: "تاريخ ووقت بداية عرض المنتج")]
    public DateTime StartDate { get; set; }

    [DynamicDisplayName(englishName: "End Date and Time of Product Display", arabicName: "تاريخ ووقت انتهاء عرض المنتج")]
    public DateTime Duration { get; set; }

    [DynamicDisplayName(englishName: "Price", arabicName: "السعر")]
    public float Price { get; set; }

    [DynamicDisplayName(englishName: "Image ", arabicName: " الصورة")]
    public string ImgUrl { get; set; }

    [DynamicDisplayName(englishName: "Created At", arabicName: "تم الإنشاء في")]
    public DateTime CreatedAt { get; set; }
}