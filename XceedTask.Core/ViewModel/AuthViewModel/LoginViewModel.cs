namespace XceedTask.Core.ViewModel.AuthViewModel;

public class LoginViewModel
{
    [DynamicDisplayName(arabicName: "البريد الإلكتروني", englishName: "Email")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال البريد الإلكتروني", englishErrorMessage: "Email is Required")]
    [RegularExpression(@"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$", ErrorMessage = "البريد الإلكتروني غير صحيح")]
    public string Email { get; set; }

    [StringLength(256)]
    [DataType(DataType.Password)]
    [DynamicDisplayName(arabicName: "كلمة السر", englishName: "Password")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال كلمة السر", englishErrorMessage: "Password is Required")]
    public string Password { get; set; }

    public bool IsPersist { get; set; } = true;

    public string ReturnUrl { get; set; }
}