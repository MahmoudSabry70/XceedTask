namespace XceedTask.Core.ViewModel.AuthViewModel;

public class ChangeOldPasswordViewModel
{
    [Required]
    [DataType(DataType.Password)]
    public string OldPassword { get; set; }

    [Required]
    [DataType(DataType.Password)]
    public string NewPassword { get; set; }

    [Required] public string UserId { get; set; }
}