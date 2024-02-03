namespace XceedTask.Core.ViewModel.AuthViewModel;

public class ChangePasswordAdminViewModel
{
    [StringLength(50), MinLength(5, ErrorMessage = "يجب أن يكون الاسم أكبر من 5 حروف")]
    [DynamicDisplayName(arabicName: "الاسم بالكامل ", englishName: "Full Name")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال الاسم بالكامل", englishErrorMessage: "Full Name is Required")]
    public string FullName { get; set; }

    [StringLength(128)]
    [DataType(DataType.EmailAddress)]
    [EmailAddress(ErrorMessage = "البريد الالكتروني غير صحيح")]
    [DynamicDisplayName(arabicName: "البريد الالكتروني", englishName: "Email")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال البريد الالكتروني", englishErrorMessage: "Email is Required")]
    public string Email { get; set; }

    [DataType(DataType.PhoneNumber)]
    [DynamicDisplayName(arabicName: "رقم الهاتف", englishName: "Phone Number")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال رقم الهاتف", englishErrorMessage: "Phone Number is Required")]
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

    [Required]
    public string UserId { get; set; }
}