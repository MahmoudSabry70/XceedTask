using XceedTask.Core.Entity.ApplicationData;
using XceedTask.Core.ViewModel.AuthViewModel;

namespace XceedTask.Services.Interfaces;

public interface IUserService
{
    Task<List<ApplicationUser>> GetAllUsers();

    Task<ApplicationUser> GetUserById(string userId);

    Task<ApplicationUser> GetUserByPhoneNumber(string phoneNumber);

    Task<ApplicationUser> GetUserByEmail(string email);

    Task<ApplicationUser> UpdateUserAsync(ApplicationUser user);

    //-------------------------------------------------------------------------------------
    Task<AuthModel> RegisterUserAsync(RegisterUserViewModel model);

    Task<AuthModel> RegisterAdminAsync(RegisterAdminViewModel model);

    Task<AuthModel> ResendConfirmEmail(string userId);

    Task<AuthModel> ConfirmEmail(string userId, string token);

    Task<AuthModel> LoginAsync(LoginViewModel model);

    Task<bool> Logout(string userName);

    //-------------------------------------------------------------------------------------

    Task<AuthModel> ForgetPassword(EmailViewModel forgotPasswordModelView);

    Task<AuthModel> ChangePasswordByEmailAsync(ResetPasswordViewModel model);

    Task<AuthModel> ChangePasswordAsync(string userId, string password);

    Task<AuthModel> ChangeOldPasswordAsync(string userId, ChangeOldPasswordViewModel changePassword);

    Task<AuthModel> UpdateUserProfile(string userId, UpdateProfileUserViewModel updateUser);

    Task<AuthModel> UpdateAdminProfile(string userId, UpdateProfileAdminViewModel updateUser);

    Task<AuthModel> GetUserInfo(string userId);

    Task<string> AddRoleAsync(AddRoleViewModel model);

    Task<List<string>> GetRoles();

    int GenerateRandomNo();

    //------------------------------------------------------
    Task Activate(string userId);

    Task Suspend(string userId);
}
