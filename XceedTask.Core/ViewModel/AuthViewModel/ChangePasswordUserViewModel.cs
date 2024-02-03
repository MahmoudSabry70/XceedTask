namespace XceedTask.Core.ViewModel.AuthViewModel;

public class ChangePasswordUserViewModel
{
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