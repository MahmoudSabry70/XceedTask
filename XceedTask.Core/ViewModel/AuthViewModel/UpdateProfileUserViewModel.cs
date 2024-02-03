namespace XceedTask.Core.ViewModel.AuthViewModel;

public class UpdateProfileUserViewModel
{
    [StringLength(50), MinLength(5, ErrorMessage = "يجب أن يكون الاسم أكبر من 5 حروف")]
    [DynamicDisplayName(arabicName: "الاسم بالكامل ", englishName: "Full Name")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال الاسم بالكامل", englishErrorMessage: "Full Name is Required")]
    public string FullName { get; set; }

    [StringLength(128)]
    [RegularExpression(@"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$", ErrorMessage = "البريد الإلكتروني غير صحيح")]
    [DynamicDisplayName(arabicName: "البريد الالكتروني", englishName: "Email")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال البريد الالكتروني", englishErrorMessage: "Email is Required")]
    public string Email { get; set; }

    [DynamicDisplayName(arabicName: "رقم الهاتف", englishName: "Phone Number")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال رقم الهاتف", englishErrorMessage: "Phone Number is Required")]
    [RegularExpression(@"^(\+201|01|00201)[0-2,5]{1}[0-9]{8}", ErrorMessage = "رقم الهاتف غير صحيح")]
    public string PhoneNumber { get; set; }

    [DynamicDisplayName(arabicName: "الصورة الشخصية", englishName: "Profile Image")]
    public IFormFile Img { get; set; }

    [Required]
    public string UserId { get; set; }

    [DynamicDisplayName(arabicName: "الصورة الشخصية", englishName: "Profile Image")]
    public string ImgUrl { get; set; }
}