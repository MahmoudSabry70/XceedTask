using System.Security.Claims;
using XceedTask.Core.Entity.ProductData;
using Roles = XceedTask.Core.PermissionsData.Roles;
using XceedTask.DataAccess.Interfaces;

namespace XceedTask.SeedData;

public static class SeedData
{
    public static async Task SeedUserAndRole(IUnitOfWork unitOfWork, UserManager<ApplicationUser> userManager,
        RoleManager<ApplicationRole> roleManager)
    {
        if (unitOfWork?.Users == null)
        {
            throw new ArgumentNullException(nameof(unitOfWork));
        }

        /* var allUsers = await userManager.Users.ToListAsync();
         foreach (var user in allUsers)
         {
             await userManager.DeleteAsync(user);
         }
         var allRoles = await roleManager.Roles.ToListAsync();
         foreach (var role in allRoles)
         {
             await roleManager.DeleteAsync(role);
         }*/

        foreach (var role in Enum.GetNames(typeof(Roles)))
        {
            if (!await roleManager.RoleExistsAsync(role))
                await roleManager.CreateAsync(new ApplicationRole(role));
        }

        #region SuperAdmin

        ApplicationUser superAdmin = new()
        {
            FullName = "superAdmin",
            UserName = "superAdmin123@gmail.com",
            Email = "superAdmin123@gmail.com",
            NormalizedUserName = "superAdmin123@gmail.com",
            NormalizedEmail = "superAdmin123@gmail.com",
            PhoneNumber = "01551232341",
            Status = true,
            IsAdmin = true,
            PhoneNumberConfirmed = true,
            EmailConfirmed = true,
            UserType = UserType.Admin,
            UserImgUrl = "/Files/AdminImg/948KD9R7HP_WhatsApp Image 2022-11-05 at 9.07.04 AM.jpeg"
        };

        var existSuperAdmin = await userManager.FindByEmailAsync(superAdmin.Email) ?? await userManager.FindByNameAsync(superAdmin.UserName)
            ?? await userManager.Users.Where(s => s.PhoneNumber == superAdmin.PhoneNumber).FirstOrDefaultAsync();
        if (existSuperAdmin != null)
        {
            // await userManager.DeleteAsync(existSuperAdmin);
        }
        else
        {
            var superAdminResult = await userManager.CreateAsync(superAdmin, "superAdmin123@");
            if (superAdminResult.Succeeded)
            {
                await userManager.AddToRolesAsync(superAdmin, Enum.GetNames(typeof(Roles)).ToList().Where(role => role != Roles.Admin.ToString()).ToList());
            }
        }

        #endregion SuperAdmin

        #region Admin

        ApplicationUser admin = new()
        {
            FullName = "Admin",
            UserName = "admin123@gmail.com",
            Email = "admin123@gmail.com",
            NormalizedUserName = "admin123@gmail.com",
            NormalizedEmail = "admin123@gmail.com",
            PhoneNumber = "01273409387",
            Status = true,
            IsAdmin = true,
            PhoneNumberConfirmed = true,
            EmailConfirmed = true,
            UserType = UserType.Admin,
            UserImgUrl = "/Files/AdminImg/5T13C5J7Z8_faba8b44-5bfb-4e58-bc37-695d1ab5bc31.jpeg"
        };

        var existAdmin = await userManager.FindByEmailAsync(admin.Email) ?? await userManager.FindByNameAsync(admin.UserName) ?? await userManager.Users.Where(s => s.PhoneNumber == admin.PhoneNumber).FirstOrDefaultAsync();

        if (existAdmin != null)
        {
            //await userManager.DeleteAsync(existAdmin);
        }
        else
        {
            var result = await userManager.CreateAsync(admin, "admin123@");
            if (result.Succeeded)
            {
                await userManager.AddToRolesAsync(admin, Enum.GetNames(typeof(Roles)).ToList().Where(role => role != Roles.SuperAdmin.ToString()).ToList());
                await SeedClaimsForAdminRole(roleManager);
            }
        }

        #endregion Admin

        #region User

        ApplicationUser normalUser = new()
        {
            FullName = "User",
            UserName = "user@gmail.com",
            Email = "user@gmail.com",
            NormalizedUserName = "user@gmail.com",
            NormalizedEmail = "user@gmail.com",
            PhoneNumber = "01115152646",
            Status = true,
            IsAdmin = false,
            PhoneNumberConfirmed = true,
            EmailConfirmed = true,
            UserType = UserType.User
        };

        var existUser = await userManager.FindByEmailAsync(normalUser.Email) ??
                        await userManager.FindByNameAsync(normalUser.UserName) ??
                        await userManager.Users.Where(s => s.PhoneNumber == normalUser.PhoneNumber).FirstOrDefaultAsync();
        if (existUser != null)
        {
            await userManager.DeleteAsync(existUser);
        }
        else
        {
            var userResult = await userManager.CreateAsync(normalUser, "string");
            if (userResult.Succeeded)
            {
                await userManager.AddToRoleAsync(normalUser, Roles.User.ToString());
            }
        }

        #endregion User

        await SeedClaimsForSuperAdminRole(roleManager);
    }

    //------------------------------------------------------ Seed Climes to Roles ------------------------------------------------------

    private static async Task SeedClaimsForSuperAdminRole(this RoleManager<ApplicationRole> roleManager)
    {
        var adminRole = await roleManager.FindByNameAsync(Roles.SuperAdmin.ToString());
        if (adminRole != null)
        {
            await roleManager.AddPermissionClaims(adminRole, Permissions.GenerateAllPermissions());
        }
    }

    private static async Task SeedClaimsForAdminRole(this RoleManager<ApplicationRole> roleManager)
    {
        var adminRole = await roleManager.FindByNameAsync(Roles.Admin.ToString());
        if (adminRole != null)
        {
            await roleManager.AddPermissionClaims(adminRole, Permissions.GenerateAllPermissions());
        }
    }

    //------------------------------------------------------ Add Climes to Roles ------------------------------------------------------
    public static async Task AddPermissionClaims(this RoleManager<ApplicationRole> roleManager, ApplicationRole role, List<string> permissions)
    {
        var allClaims = await roleManager.GetClaimsAsync(role);

        foreach (var permission in permissions.Where(permission => !allClaims.Any(c => c.Type == Permissions.Permission && c.Value == permission)))
        {
            await roleManager.AddClaimAsync(role, new Claim(Permissions.Permission, permission));
        }
    }

    //------------------------------------------------------ Seed Category ------------------------------------------------------

    public static async Task SeedCategory(IUnitOfWork unitOfWork)
    {
        if (unitOfWork?.Categories == null)
        {
            throw new ArgumentNullException(nameof(unitOfWork));
        }

        var allCategories = await unitOfWork.Categories.CountAsync();

        if (allCategories > 0)
        {
            return;
        }

        var categories = new List<Category>
        {
            new()
            {
                Name = "Mobiles",
                NameAr = "موبايلات"
            },
            new()
            {
                Name = "Laptops",
                NameAr = "لابتوبات"
            },
            new()
            {
                Name = "Tablets",
                NameAr = "تابلت"
            },
            new()
            {
                Name = "Cameras",
                NameAr = "كاميرات"
            },
            new()
            {
                Name = "Accessories",
                NameAr = "اكسسوارات"
            },
            new()
            {
                Name = "Watches",
                NameAr = "ساعات"
            },
            new()
            {
                Name = "TVs",
                NameAr = "تلفزيونات"
            },
            new()
            {
                Name = "Headphones",
                NameAr = "سماعات"
            },
        };

        await unitOfWork.Categories.AddRangeAsync(categories);
        await unitOfWork.SaveChangesAsync();
    }
}