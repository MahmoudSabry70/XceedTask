namespace XceedTask.Core.ViewModel.AuthViewModel;

public class AddRoleViewModel
{
    [Required]
    public string UserId { get; set; }

    [Required]
    public List<string> Roles { get; set; } = [];
}