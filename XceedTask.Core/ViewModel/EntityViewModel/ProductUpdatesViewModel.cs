namespace XceedTask.Core.ViewModel.EntityViewModel;

public class ProductUpdatesViewModel
{
    public long Id { get; set; }

    [DynamicDisplayName(englishName: "Product ID", arabicName: "معرف المنتج")]
    public long ProductId { get; set; }

    [DynamicDisplayName(englishName: "Product Name", arabicName: "اسم المنتج")]
    public string ProductName { get; set; }

    [DynamicDisplayName(englishName: "Updated By ID", arabicName: "معرف المحدث")]
    public string UpdatedById { get; set; }

    [DynamicDisplayName(englishName: "Updated By Full Name", arabicName: "اسم المحدث")]
    public string UpdatedByFullName { get; set; }

    [DynamicDisplayName(englishName: "Product Image ", arabicName: " صورة المنتج")]
    public string ProductImgUrl { get; set; }

    [DynamicDisplayName(englishName: "Update Date", arabicName: "تاريخ التحديث")]
    public DateTime UpdateDate { get; set; }
}