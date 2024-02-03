using XceedTask.Core.ViewModel;

namespace XceedTask.Core.PermissionsData;

public class UserRolesViewModel
{
    [Required]
    public string UserId { get; set; }

    public string UserName { get; set; }
    public List<CheckBox> CheckBoxes { get; set; }
}