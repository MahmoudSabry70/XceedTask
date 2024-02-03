using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.EntityFrameworkCore;
using System.Text;
using XceedTask.Core.Entity.ApplicationData;
using XceedTask.Core.Helpers;
using XceedTask.Core.ViewModel.AuthViewModel;
using XceedTask.DataAccess.Interfaces;
using XceedTask.Services.Interfaces;

namespace XceedTask.Services.Services;

public class UserService(
    UserManager<ApplicationUser> userManager,
    IFileHandling photoHandling,
    RoleManager<ApplicationRole> roleManager,
    IUnitOfWork unitOfWork,
    IWebHostEnvironment webHostEnvironment,
    IHttpContextAccessor httpContextAccessor,
    IEmailService mailingService)
    : IUserService
{
    #region Get and update user

    public async Task<List<ApplicationUser>> GetAllUsers()
    {
        return await userManager.Users.ToListAsync();
    }

    public async Task<ApplicationUser> GetUserById(string userId)
    {
        var user = await unitOfWork.Users.FindAsync(s => s.Id == userId);
        return user;
    }

    public async Task<ApplicationUser> GetUserByPhoneNumber(string phoneNumber)
    {
        var user = await userManager.Users.FirstOrDefaultAsync(x => x.PhoneNumber == phoneNumber);
        return user;
    }

    public async Task<ApplicationUser> GetUserByEmail(string email)
    {
        var user = await userManager.Users.FirstOrDefaultAsync(x => x.Email == email);
        return user;
    }

    public async Task<ApplicationUser> UpdateUserAsync(ApplicationUser user)
    {
        var result = await userManager.UpdateAsync(user);
        return result.Succeeded ? user : null;
    }

    #endregion Get and update user

    //-------------------------------------------------------------------------------------

    // ------------------------------------------------------------------------------------------------------------------

    #region Register

    public async Task<AuthModel> RegisterUserAsync(RegisterUserViewModel model)
    {
        if (await userManager.FindByEmailAsync(model.Email) is not null)
            return new AuthModel
            {
                Message = "this email is already Exist!",
                ArMessage = "هذا البريد الالكتروني مستخدم من قبل",
                ErrorCode = (int)Errors.ThisEmailAlreadyExist
            };

        if (await Task.Run(() => userManager.Users.Any(item => item.PhoneNumber == model.PhoneNumber)))
            return new AuthModel { Message = "this phone number is already Exist!", ArMessage = "هذا الرقم المحمول مستخدم من قبل", ErrorCode = (int)Errors.ThisPhoneNumberAlreadyExist };

        var imgUrl = "https://source.unsplash.com/random/150x150?person";
        try
        {
            if (model.Img != null)
                imgUrl = await photoHandling.UploadFileAsync(model.Img, "Users");
        }
        catch
        {
            return new AuthModel
            {
                Message = "error in uploading Img!",
                ArMessage = "حدث خطأ في رفع الصورة",
                ErrorCode = (int)Errors.ErrorInUploadingImg
            };
        }

        var user = new ApplicationUser
        {
            FullName = model.FullName,
            UserName = model.Email,
            NormalizedUserName = model.Email,
            Email = model.Email,
            PhoneNumber = model.PhoneNumber,
            Status = true,
            RandomCode = GenerateRandomNo().ToString(),
            UserImgUrl = imgUrl,
            IsDeleted = false,
            IsAdmin = false,
            UserType = UserType.User
        };
        var result = await userManager.CreateAsync(user, model.Password);
        if (!result.Succeeded)
        {
            var errors = result.Errors.Aggregate(string.Empty, (current, error) => current + $"{error.Description},");
            return new AuthModel
            { Message = errors, ArMessage = errors, ErrorCode = (int)Errors.ErrorWithCreateAccount };
        }

        var newUser = await userManager.FindByEmailAsync(model.Email);
        if (newUser is null)
            return new AuthModel
            {
                Message = "An error occurred creating the account!",
                ArMessage = "حدث خطأ أثناء إنشاء الحساب!",
                ErrorCode = (int)Errors.ErrorWithCreateAccount
            };
        if (!await roleManager.RoleExistsAsync("User")) await roleManager.CreateAsync(new ApplicationRole("User"));
        await userManager.AddToRoleAsync(user, "User");

        #region Confirm mail and send mail

        var token = await userManager.GenerateEmailConfirmationTokenAsync(user);
        var encodedToken = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(token));
        var path = $"{GetBaseUrl()}Home/ConfirmEmail";
        var callbackUrl = $"{path}?userId={user.Id}&token={encodedToken}";
        await mailingService.SendEmailAsync(newUser.Email, "تأكيد البريد الالكتروني", ConfirmEmailRegister(uri: callbackUrl, fullName: newUser.FullName));

        #endregion Confirm mail and send mail

        return new AuthModel
        {
            UserId = newUser.Id,
            Email = newUser.Email,
            FullName = newUser.FullName,
            PhoneNumber = newUser.PhoneNumber,
            IsAuthenticated = true,
            UserType = UserType.User,
            UserImgUrl = newUser.UserImgUrl,
            EmailVerify = newUser.EmailConfirmed,
            ArMessage = "تم أنشاء الحساب ويمكنك تسجيل الدخول الان ",
            Message = "Account created successfully, you can now log in."
        };
    }

    public async Task<AuthModel> RegisterAdminAsync(RegisterAdminViewModel model)
    {
        if (await userManager.FindByEmailAsync(model.Email) is not null)
            return new AuthModel
            {
                Message = "this email is already Exist!",
                ArMessage = "هذا البريد الالكتروني مستخدم من قبل",
                ErrorCode = (int)Errors.ThisEmailAlreadyExist
            };
        if (await Task.Run(() => userManager.Users.Any(item => item.PhoneNumber == model.PhoneNumber)))
            return new AuthModel { Message = "this phone number is already Exist!", ArMessage = "هذا الرقم المحمول مستخدم من قبل", ErrorCode = (int)Errors.ThisPhoneNumberAlreadyExist };

        string imgUrl;
        try
        {
            if (model.Img is not null)
                imgUrl = await photoHandling.UploadFileAsync(model.Img, "AdminImg");
            else
                return new AuthModel
                {
                    Message = "please select your Img !",
                    ArMessage = " من فضلك حدد صورة شخصية لك ",
                    ErrorCode = (int)Errors.NoPhoto
                };
        }
        catch
        {
            return new AuthModel
            {
                Message = "error in uploading Img!",
                ArMessage = "حدث خطأ في رفع الصورة",
                ErrorCode = (int)Errors.ErrorInUploadingImg
            };
        }

        var user = new ApplicationUser
        {
            FullName = model.FullName,
            UserName = model.PhoneNumber,
            NormalizedUserName = model.PhoneNumber,
            PhoneNumber = model.PhoneNumber,
            Email = model.Email,
            UserImgUrl = imgUrl,
            Status = true,
            RandomCode = GenerateRandomNo().ToString(),
            PhoneNumberConfirmed = true,
            EmailConfirmed = true,
            UserType = UserType.Admin,
            IsAdmin = true
        };
        var result = await userManager.CreateAsync(user, model.Password);
        if (!result.Succeeded)
        {
            var errors =
                result.Errors.Aggregate(string.Empty, (current, error) => current + $"{error.Description},");
            return new AuthModel
            { Message = errors, ArMessage = errors, ErrorCode = (int)Errors.ErrorWithCreateAccount };
        }

        if (!await roleManager.RoleExistsAsync("Admin")) await roleManager.CreateAsync(new ApplicationRole("Admin"));
        await userManager.AddToRoleAsync(user, "Admin");

        var admin = await userManager.FindByEmailAsync(model.Email);
        if (admin == null)
        {
            return new AuthModel
            {
                Message = "An error occurred creating the account!",
                ArMessage = "حدث خطأ أثناء إنشاء الحساب!",
                ErrorCode = (int)Errors.ErrorWithCreateAccount
            };
        }
        var rolesList = userManager.GetRolesAsync(user).Result.ToList();

        return new AuthModel
        {
            Email = admin.Email,
            PhoneNumber = admin.PhoneNumber,
            FullName = admin.FullName,
            IsAuthenticated = true,
            Roles = rolesList,
            UserType = UserType.Admin,
            UserImgUrl = admin.UserImgUrl
        };
    }

    public async Task<AuthModel> ConfirmEmail(string userId, string token)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
            return new AuthModel
            {
                Message = "Your Email is not Exist!",
                ArMessage = "البريد الالكتروني  غير مسجل",
                ErrorCode = (int)Errors.ThisPhoneNumberNotExist
            };

        var decodedToken = Encoding.UTF8.GetString(WebEncoders.Base64UrlDecode(token));
        var result = await userManager.ConfirmEmailAsync(user, decodedToken);
        if (!result.Succeeded)
            return new AuthModel
            {
                Message = "Your phone number is not Exist!",
                ArMessage = "البريد الالكتروني  غير مسجل",
                ErrorCode = (int)Errors.ThisPhoneNumberNotExist
            };
        var rolesList = userManager.GetRolesAsync(user).Result.ToList();
        return new AuthModel
        {
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            IsAuthenticated = true,
            Roles = rolesList,
            UserType = UserType.User,
            UserImgUrl = user.UserImgUrl,
            EmailVerify = user.EmailConfirmed,
            ArMessage = " تم تفعيل الحساب بنجاح قم بتسجيل الدخول الأن ",
            Message = "Account activated successfully, please login now"
        };
    }

    public async Task<AuthModel> ResendConfirmEmail(string userId)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
            return new AuthModel
            {
                Message = "Your phone number is not Exist!",
                ArMessage = "البريد الإلكتروني  غير مسجل",
                ErrorCode = (int)Errors.ThisPhoneNumberNotExist
            };
        if (user.EmailConfirmed)
            return new AuthModel
            {
                Message = "Your account is already activated!",
                ArMessage = "حسابك مفعل بالفعل",
                ErrorCode = (int)Errors.UserIsActivated
            };

        #region Confirm mail and send mail

        var token = await userManager.GenerateEmailConfirmationTokenAsync(user);
        var encodedToken = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(token));
        var path = $"{GetBaseUrl()}Home/ConfirmEmail";
        var callbackUrl = $"{path}?userId={user.Id}&token={encodedToken}";
        await mailingService.SendEmailAsync(user.Email, "تأكيد البريد الالكتروني", ConfirmEmailRegister(uri: callbackUrl, fullName: user.FullName));

        #endregion Confirm mail and send mail

        return new AuthModel()
        {
            Message = "Confirmation code sent successfully Check your Email ",
            ArMessage = "تم أرسال رابط التأكيد بنجاح تحقق من بريدك الالكتروني ",
            EmailVerify = user.EmailConfirmed,
            IsAuthenticated = true,
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            UserImgUrl = user.UserImgUrl,
            UserType = user.UserType,
        };
    }

    #endregion Register

    #region Login

    public async Task<AuthModel> LoginAsync(LoginViewModel model)
    {
        var user = await userManager.FindByEmailAsync(model.Email);
        if (user is null)
            return new AuthModel
            {
                Message = "Your Email is not Exist!",
                ArMessage = "البريد الالكتروني  غير مسجل",
                ErrorCode = (int)Errors.ThisPhoneNumberNotExist
            };
        if (!await userManager.CheckPasswordAsync(user, model.Password))
            return new AuthModel
            {
                Message = "Password is not correct!",
                ArMessage = "كلمة المرور غير صحيحة",
                ErrorCode = (int)Errors.TheUsernameOrPasswordIsIncorrect
            };
        if (!user.Status)
            return new AuthModel
            {
                Message = "Your account has been suspended!",
                ArMessage = "حسابك تم إيقافة",
                ErrorCode = (int)Errors.UserIsBlocked
            };
        if (!user.EmailConfirmed && !await userManager.IsInRoleAsync(user, "Admin"))
        {
            #region Confirm mail and send mail

            var token = await userManager.GenerateEmailConfirmationTokenAsync(user);
            var encodedToken = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(token));
            var path = $"{GetBaseUrl()}Home/ConfirmEmail";
            var callbackUrl = $"{path}?userId={user.Id}&token={encodedToken}";
            await mailingService.SendEmailAsync(user.Email, "تأكيد البريد الالكتروني", ConfirmEmailRegister(uri: callbackUrl, fullName: user.FullName));

            #endregion Confirm mail and send mail

            /*return new AuthModel()
            {
                Message = "Confirmation code sent successfully Check your Email ",
                ArMessage = "تم أرسال رابط التأكيد بنجاح تحقق من بريدك الالكتروني ",
                EmailVerify = user.EmailConfirmed,
                IsAuthenticated = true
            };*/
        }

        var rolesList = userManager.GetRolesAsync(user).Result.ToList();
        return new AuthModel
        {
            UserId = user.Id,
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            IsAuthenticated = true,
            Roles = rolesList,
            UserType = user.UserType,
            EmailVerify = user.EmailConfirmed,
            UserImgUrl = user.UserImgUrl,
            Message = "Login successfully",
            ArMessage = "تم تسجيل الدخول بنجاح"
        };
    }

    public async Task<bool> Logout(string userId)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
            return false;
        user.DeviceToken = null;
        await userManager.UpdateAsync(user);
        return true;
    }

    #endregion Login

    //-------------------------------------------------------------------------------------------------------------------------

    #region Additions

    //-------------------------------------------------------------------------------------------------------------------------
    public async Task<AuthModel> ForgetPassword(EmailViewModel model)
    {
        var user = await userManager.FindByEmailAsync(model.Email);

        if (user is null)
            return new AuthModel
            {
                Message = "User not found!",
                ArMessage = "المستخدم غير موجود",
                ErrorCode = (int)Errors.TheUserNotExistOrDeleted
            };

        #region Confirm mail and send mail

        var code = await userManager.GeneratePasswordResetTokenAsync(user);
        var path = $"{GetBaseUrl()}Home/ChangeForgetPassword";
        var callbackUrl = $"{path}?userId={user.Id}&code={code}";
        await mailingService.SendEmailAsync(user.Email, "إعادة تعيين كلمة السر", ConfirmEmailRegister(uri: callbackUrl, fullName: user.FullName));

        #endregion Confirm mail and send mail

        return new AuthModel()
        {
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            Message = "Confirmation link sent successfully, please check your email. ",
            ArMessage = "تم أرسال رابط التأكيد بنجاح تحقق من بريدك الالكتروني ",
            IsAuthenticated = true
        };
    }

    public async Task<AuthModel> ChangePasswordByEmailAsync(ResetPasswordViewModel model)
    {
        var user = await userManager.FindByIdAsync(model.UserId);
        if (user is null)
            return new AuthModel
            {
                Message = "User not found!",
                ArMessage = "المستخدم غير موجود",
                ErrorCode = (int)Errors.TheUserNotExistOrDeleted
            };

        var result = await userManager.ResetPasswordAsync(user, model.Token, model.Password);
        if (!result.Succeeded)
            return new AuthModel
            {
                Message = "Error!",
                ArMessage = "خطأ",
                ErrorCode = (int)Errors.UserNotFound
            };

        var rolesList = userManager.GetRolesAsync(user).Result.ToList();

        var data = new AuthModel
        {
            Message = "The password has been changed successfully",
            ArMessage = "تم تغيير كلمة المرور بنجاح",
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            UserImgUrl = user.UserImgUrl,
            IsAuthenticated = true,
            Roles = rolesList,
            UserType = user.UserType,
        };
        return data;
    }

    public async Task<AuthModel> ChangePasswordAsync(string userId, string password)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
            return new AuthModel
            {
                Message = "User not found!",
                ArMessage = "المستخدم غير موجود",
                ErrorCode = (int)Errors.TheUserNotExistOrDeleted
            };

        user.PasswordHash = userManager.PasswordHasher.HashPassword(user, password);
        await userManager.UpdateAsync(user);

        var rolesList = userManager.GetRolesAsync(user).Result.ToList();

        var result = new AuthModel
        {
            Message = "The password has been changed successfully",
            ArMessage = "تم تغيير كلمة المرور بنجاح",
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            UserImgUrl = user.UserImgUrl,
            IsAuthenticated = true,
            Roles = rolesList,
            UserType = user.UserType,
        };
        return result;
    }

    public async Task<AuthModel> ChangeOldPasswordAsync(string userId, ChangeOldPasswordViewModel changePassword)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
            return new AuthModel
            {
                Message = "User not found!",
                ArMessage = "المستخدم غير موجود",
                ErrorCode = (int)Errors.TheUserNotExistOrDeleted
            };

        if (user.PasswordHash != null)
        {
            var isOldCorrect =
                userManager.PasswordHasher.VerifyHashedPassword(user, user.PasswordHash, changePassword.OldPassword);
            if (!isOldCorrect.Equals(PasswordVerificationResult.Success))
                return new AuthModel
                {
                    Message = "Old password is incorrect!",
                    ArMessage = "كلمة المرور القديمة غير صحيحة",
                    ErrorCode = (int)Errors.OldPasswordIsIncorrect
                };
        }
        else
        {
            return new AuthModel
            {
                Message = "Old password is not Exist!",
                ArMessage = "كلمة المرور القديمة غير موجودة",
                ErrorCode = (int)Errors.OldPasswordIsExist
            };
        }

        user.PasswordHash = userManager.PasswordHasher.HashPassword(user, changePassword.NewPassword);
        await userManager.UpdateAsync(user);

        var rolesList = userManager.GetRolesAsync(user).Result.ToList();

        var result = new AuthModel
        {
            Message = "The password has been changed successfully",
            ArMessage = "تم تغيير كلمة المرور بنجاح",
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            UserImgUrl = user.UserImgUrl,
            FullName = user.FullName,
            IsAuthenticated = true,
            Roles = rolesList,
            UserType = user.UserType,
        };
        return result;
    }

    //-------------------------------------------------------------------------------------------------------------------------

    #endregion Additions

    #region Update Profile

    public async Task<AuthModel> UpdateUserProfile(string userId, UpdateProfileUserViewModel model)
    {
        var user = await unitOfWork.Users
            .FindByQuery(s => s.Id == userId)
            .FirstOrDefaultAsync();
        if (user is null)
            return new AuthModel
            {
                ErrorCode = (int)Errors.TheUserNotExistOrDeleted,
                Message = "User not found!",
                ArMessage = "المستخدم غير موجود"
            };

        if (await Task.Run(() => userManager.Users.Any(item => item.Email == model.Email && item.Id != userId)))
            return new AuthModel
            { Message = "this email is already Exist!", ArMessage = "هذا البريد الالكتروني مستخدم من قبل" };

        if (await Task.Run(() => userManager.Users.Any(item => item.PhoneNumber == model.PhoneNumber && item.Id != userId)))
            return new AuthModel { Message = "this phone number is already Exist!", ArMessage = "هذا الرقم المحمول مستخدم من قبل", ErrorCode = (int)Errors.ThisPhoneNumberAlreadyExist };

        string imgUrl = null;
        try
        {
            if (model.Img != null)
                imgUrl = await photoHandling.UploadFileAsync(model.Img, "Users", user.UserImgUrl);
        }
        catch
        {
            return new AuthModel
            {
                Message = "error in uploading Img!",
                ArMessage = "حدث خطأ في رفع الصورة",
                ErrorCode = (int)Errors.ErrorInUploadingImg
            };
        }

        user.FullName = model.FullName;
        user.EmailConfirmed = model.Email == user.Email && user.EmailConfirmed;
        user.UserName = model.Email;
        user.NormalizedUserName = model.Email;
        user.Email = model.Email;
        user.PhoneNumber = model.PhoneNumber;
        user.NormalizedEmail = model.Email;
        user.UserImgUrl = !string.IsNullOrEmpty(imgUrl) ? imgUrl : user.UserImgUrl;

        await userManager.UpdateAsync(user);

        var rolesList = userManager.GetRolesAsync(user).Result.ToList();

        var result = new AuthModel
        {
            UserId = user.Id,
            Message = "The profile has been updated successfully",
            ArMessage = "تم تحديث الملف الشخصي بنجاح",
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            IsAuthenticated = true,
            UserType = user.UserType,
            Roles = rolesList,
            UserImgUrl = user.UserImgUrl,
        };
        return result;
    }

    public async Task<AuthModel> UpdateAdminProfile(string userId, UpdateProfileAdminViewModel model)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
            return new AuthModel
            {
                ErrorCode = (int)Errors.TheUserNotExistOrDeleted,
                Message = "User not found!",
                ArMessage = "المستخدم غير موجود"
            };

        if (await Task.Run(() => userManager.Users.Any(item => item.Email == model.Email && item.Id != userId)))
            return new AuthModel
            { Message = "this email is already Exist!", ArMessage = "هذا البريد الالكتروني مستخدم من قبل" };

        if (await Task.Run(() => userManager.Users.Any(item => item.PhoneNumber == model.PhoneNumber)))
            return new AuthModel { Message = "this phone number is already Exist!", ArMessage = "هذا الرقم المحمول مستخدم من قبل", ErrorCode = (int)Errors.ThisPhoneNumberAlreadyExist };
        string imgUrl = null;
        try
        {
            if (model.Img != null)
                imgUrl = await photoHandling.UploadFileAsync(model.Img, "AdminImg", user.UserImgUrl);
        }
        catch
        {
            return new AuthModel
            {
                Message = "error in uploading Img!",
                ArMessage = "حدث خطأ في رفع الصورة",
                ErrorCode = (int)Errors.ErrorInUploadingImg
            };
        }

        user.FullName = model.FullName;
        user.PhoneNumber = model.PhoneNumber;
        user.UserName = model.PhoneNumber;
        user.NormalizedUserName = model.PhoneNumber;
        user.Email = model.Email;
        user.NormalizedEmail = model.Email;
        user.UserImgUrl = !string.IsNullOrEmpty(imgUrl) ? imgUrl : user.UserImgUrl;

        await userManager.UpdateAsync(user);

        var rolesList = userManager.GetRolesAsync(user).Result.ToList();

        var result = new AuthModel
        {
            Message = "The profile has been updated successfully",
            ArMessage = "تم تحديث الملف الشخصي بنجاح",
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            IsAuthenticated = true,
            UserType = user.UserType,
            Roles = rolesList,
            EmailVerify = user.EmailConfirmed,
            UserImgUrl = user.UserImgUrl,
        };
        return result;
    }

    public async Task<AuthModel> GetUserInfo(string userId)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user is null)
            return new AuthModel
            {
                ErrorCode = (int)Errors.TheUserNotExistOrDeleted,
                Message = "User not found!",
                ArMessage = "المستخدم غير موجود"
            };

        var rolesList = userManager.GetRolesAsync(user).Result.ToList();
        var result = new AuthModel
        {
            Email = user.Email,
            PhoneNumber = user.PhoneNumber,
            FullName = user.FullName,
            UserImgUrl = user.UserImgUrl,
            IsAuthenticated = true,
            UserType = user.UserType,
            EmailVerify = user.EmailConfirmed,
            Roles = rolesList,

            Status = user.Status,
        };
        return result;
    }

    #endregion Update Profile

    #region Role

    public async Task<string> AddRoleAsync(AddRoleViewModel model)
    {
        var user = await userManager.FindByIdAsync(model.UserId);
        if (user is null)
            return "User not found!";

        if (model.Roles is not { Count: > 0 }) return " Role is empty";
        foreach (var role in model.Roles)
        {
            if (!await roleManager.RoleExistsAsync(role))
                return "Invalid Role";
            if (await userManager.IsInRoleAsync(user, role))
                return "User already assigned to this role";
        }

        var result = await userManager.AddToRolesAsync(user, model.Roles);

        return result.Succeeded ? string.Empty : "Something went wrong";
    }

    public Task<List<string>> GetRoles()
    {
        return roleManager.Roles.Select(x => x.Name).ToListAsync();
    }

    #endregion Role

    #region User Status

    public async Task Activate(string userId)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user != null)
        {
            user.Status = true;
            await userManager.UpdateAsync(user);
        }
    }

    public async Task Suspend(string userId)
    {
        var user = await userManager.FindByIdAsync(userId);
        if (user != null)
        {
            user.Status = false;
            await userManager.UpdateAsync(user);
        }
    }

    #endregion User Status

    //------------------------------------------------------------------------------------------------------------

    #region Random number and string

    //Generate RandomNo
    public int GenerateRandomNo()
    {
        const int min = 1000;
        const int max = 9999;
        var rdm = new Random();
        return rdm.Next(min, max);
    }

    public static string RandomString(int length)
    {
        var random = new Random();
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
            .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    #endregion Random number and string

    //---------------------------------------------------------------------------------------------------------------------

    #region send email verification

    public string ConfirmEmailRegister(string uri, string fullName)
    {
        var filePath = $@"{webHostEnvironment.WebRootPath}\Templates\ConfirmMailByUrl.html";
        var str = new StreamReader(filePath);
        var mailText = str.ReadToEnd();
        str.Close();
        mailText = mailText.Replace("[UserName]", fullName)
            .Replace("[ConfirmationUrl]", uri);
        return mailText;
    }

    public string ConfirmEmailForgetPassword(string uri, string fullName)
    {
        var filePath = $@"{webHostEnvironment.WebRootPath}\Templates\ForgetPassword.html";
        var str = new StreamReader(filePath);
        var mailText = str.ReadToEnd();
        str.Close();
        mailText = mailText.Replace("[UserName]", fullName)
            .Replace("[ResetUrl]", uri);
        return mailText;
    }

    public string GetBaseUrl()
    {
        var request = httpContextAccessor.HttpContext?.Request;
        var scheme = request?.Scheme;
        var host = request?.Host.Value;
        var baseUrl = $"{scheme}://{host}/";
        return baseUrl;
    }

    #endregion send email verification
}