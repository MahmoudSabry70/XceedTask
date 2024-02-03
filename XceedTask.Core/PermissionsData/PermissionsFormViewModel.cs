using XceedTask.Core.ViewModel;

namespace XceedTask.Core.PermissionsData;

public class PermissionsFormViewModel
{
    [Required]
    public string RoleId { get; set; }

    public string RoleName { get; set; }
    public List<CheckBox> CheckBoxes { get; set; }
}