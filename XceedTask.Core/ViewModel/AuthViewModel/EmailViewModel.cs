namespace XceedTask.Core.ViewModel.AuthViewModel;

public class EmailViewModel

{
    [DynamicDisplayName(arabicName: "البريد الإلكتروني", englishName: "Email")]
    [RequiredWithDynamicErrorMessage(arabicErrorMessage: "يجب أدخال البريد الإلكتروني", englishErrorMessage: "Email is Required")]
    [RegularExpression(@"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$", ErrorMessage = "البريد الإلكتروني غير صحيح")]
    public string Email { get; set; }
}