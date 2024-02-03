using Microsoft.AspNetCore.Mvc;

namespace XceedTask.Core.ViewModel.AuthViewModel;

public class RegisterAdminViewModel
{
    [StringLength(50), MinLength(5, ErrorMessage = "يجب أن يكون الاسم أكبر من 5 حروف")]
    [DynamicDisplayName(arabicName: "الاسم بالكامل ", englishName: "Full Name")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال الاسم بالكامل", englishErrorMessage: "Full Name is Required")]
    public string FullName { get; set; }

    [DynamicDisplayName(arabicName: "البريد الالكتروني", englishName: "Email")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال البريد الالكتروني", englishErrorMessage: "Email is Required")]
    [Remote(action: "IsEmailAvailable", controller: "Home", ErrorMessage = " ")]
    [RegularExpression(@"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$", ErrorMessage = "البريد الإلكتروني غير صحيح")]
    public string Email { get; set; }

    [DynamicDisplayName(arabicName: "رقم الهاتف", englishName: "Phone Number")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال رقم الهاتف", englishErrorMessage: "Phone Number is Required")]
    [Remote(action: "IsPhoneNumberAvailable", controller: "Home", ErrorMessage = " ")]
    [RegularExpression(@"^(\+201|01|00201)[0-2,5]{1}[0-9]{8}", ErrorMessage = "رقم الهاتف غير صحيح")]
    public string PhoneNumber { get; set; }

    [StringLength(256)]
    [DataType(DataType.Password)]
    [DynamicDisplayName(arabicName: "كلمة السر", englishName: "Password")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال كلمة السر", englishErrorMessage: "Password is Required")]
    public string Password { get; set; }

    [StringLength(256)]
    [DataType(DataType.Password)]
    [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
    [DynamicDisplayName(arabicName: "تأكيد كلمة السر", englishName: "Confirm Password")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال تأكيد كلمة السر", englishErrorMessage: "Confirm Password is Required")]
    public string ConfirmPassword { get; set; }

    [DynamicDisplayName(arabicName: "الصورة الشخصية", englishName: "Profile Image")]
    public IFormFile Img { get; set; }

    [DynamicDisplayName(englishName: "User Type", arabicName: "نوع المستخدم")]
    public UserType UserType { get; set; }
}