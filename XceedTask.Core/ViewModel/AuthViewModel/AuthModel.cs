namespace XceedTask.Core.ViewModel.AuthViewModel;

public class AuthModel
{
    public bool IsAuthenticated { get; set; }
    public string UserId { get; set; }
    public string UserName { get; set; }
    public string Email { get; set; }
    public List<string> Roles { get; set; }
    public string FullName { get; set; }

    public bool Status { get; set; }

    public string Message { get; set; }
    public string ArMessage { get; set; }
    public int ErrorCode { get; set; }
    public string PhoneNumber { get; set; }
    public UserType UserType { get; set; }

    public float? Lat { get; set; }
    public float? Lng { get; set; }

    public string UserImgUrl { get; set; }
    public string Description { get; set; }

    public string City { get; set; }
    public bool EmailVerify { get; set; }
}