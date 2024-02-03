namespace XceedTask.Core.ViewModel.EntityViewModel;

public class ApplicationUserIndexViewModel
{
    public string Id { get; set; }
    public string FullName { get; set; }
    public string PhoneNumber { get; set; }
    public string Email { get; set; }
    public bool Status { get; set; } = true;

    public string UserImgUrl { get; set; }
    public UserType UserType { get; set; }
    public bool HasAccessToDashboard { get; set; }
    public string Specialization { get; set; }
}