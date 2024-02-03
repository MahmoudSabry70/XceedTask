using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using XceedTask.Core.Entity.ApplicationData;
using XceedTask.Core.PermissionsData;
using XceedTask.Core.ViewModel;
using XceedTask.DataAccess.Interfaces;
using XceedTask.Services.Interfaces;

namespace XceedTask.Services.Services;

public class RoleService(
    UserManager<ApplicationUser> userManager,
    IUnitOfWork unitOfWork,
    RoleManager<ApplicationRole> roleManager)
    : IRoleService
{
    //------------------------------------------------------------------------------------------------------ Get All Roles
    public async Task<IEnumerable<ApplicationRole>> GetAllRolesAsync()
    {
        return await roleManager.Roles.ToListAsync();
    }

    //------------------------------------------------------------------------------------------------------ Get All Roles for user
    public async Task<IEnumerable<ApplicationRole>> GetAllRolesForUserAsync(ApplicationUser user)
    {
        var roleNames = await userManager.GetRolesAsync(user);
        var roles = await roleManager.Roles.Where(r => roleNames.Contains(r.Name)).ToListAsync();

        return roles;
    }

    //------------------------------------------------------------------------------------------------------ Get All Roles for user as string

    public async Task<IEnumerable<string>> GetAllRolesForUserAsStringAsync(ApplicationUser user)
    {
        var roleNames = await userManager.GetRolesAsync(user);
        return roleNames;
    }

    //------------------------------------------------------------------------------------------------------ Get Role By Id
    public async Task<ApplicationRole> GetRoleByIdAsync(string roleId)
    {
        return await roleManager.FindByIdAsync(roleId);
    }

    //------------------------------------------------------------------------------------------------------ Get Role By Name
    public async Task<ApplicationRole> GetRoleByNameAsync(string roleName)
    {
        return await roleManager.FindByNameAsync(roleName);
    }

    //------------------------------------------------------------------------------------------------------ Get Role Users
    public async Task<IEnumerable<ApplicationUser>> GetRoleUsersAsync(string roleName)
    {
        var role = await roleManager.FindByNameAsync(roleName);
        if (role != null && !string.IsNullOrEmpty(role.Name)) return await userManager.GetUsersInRoleAsync(role.Name);
        return null;
    }

    //------------------------------------------------------------------------------------------------------ Get Role Claims By Role Name or Id

    public async Task<List<string>> GetRolePermissionsAsync(string roleData, bool isRoleId = true)
    {
        var roleName = isRoleId ? (await roleManager.FindByIdAsync(roleData))?.Name : roleData;

        if (roleName == null) return null;

        var role = await roleManager.FindByNameAsync(roleName);
        return role != null ? roleManager.GetClaimsAsync(role).Result.Select(c => c.Value).ToList() : null;
    }

    //------------------------------------------------------------------------------------------------------ Delete Role

    public async Task<bool> DeleteRoleAsync(string roleId)
    {
        try
        {
            var role = await roleManager.FindByIdAsync(roleId);
            if (role == null) return false;

            var result = await roleManager.DeleteAsync(role);
            return result.Succeeded;
        }
        catch
        {
            return false;
        }
    }

    //------------------------------------------------------------------------------------------------------ Create Role

    public async Task<bool> CreateRoleAsync(ApplicationRole role)
    {
        if (role == null) return false;
        try
        {
            var result = await roleManager.CreateAsync(role);
            return result.Succeeded;
        }
        catch
        {
            return false;
        }
    }

    //------------------------------------------------------------------------------------------------------ Update Role

    public async Task<bool> UpdateRoleAsync(ApplicationRole role)
    {
        if (role == null) return false;
        try
        {
            var result = await roleManager.UpdateAsync(role);
            return result.Succeeded;
        }
        catch
        {
            return false;
        }
    }

    //------------------------------------------------------------------------------------------------------ Add Role to User

    public async Task<bool> AddRoleToUserAsync(ApplicationUser user, string roleName)
    {
        if (user == null || string.IsNullOrEmpty(roleName)) return false;

        var result = await userManager.AddToRoleAsync(user, roleName);
        return result.Succeeded;
    }

    //------------------------------------------------------------------------------------------------------ Remove Role from User

    public async Task<bool> RemoveRoleFromUserAsync(ApplicationUser user, string roleName)
    {
        if (user == null || string.IsNullOrEmpty(roleName)) return false;

        var result = await userManager.RemoveFromRoleAsync(user, roleName);
        return result.Succeeded;
    }

    //------------------------------------------------------------------------------------------------------ Get all Permissions  with selected Role Permissions for role

    public async Task<PermissionsFormViewModel> GetAllPermissionsRoleAsync(string roleId)
    {
        var role = await roleManager.FindByIdAsync(roleId);
        if (role == null) return null;

        var roleClaims = await roleManager.GetClaimsAsync(role);

        var allPermissions = Permissions.GenerateAllPermissions()
            .Select(p => new CheckBox { Name = p, IsChecked = roleClaims.Any(c => c.Value == p) })
            .ToList();

        return new PermissionsFormViewModel
        {
            RoleId = role.Id,
            RoleName = role.Name,
            CheckBoxes = allPermissions
        };
    }

    //------------------------------------------------------------------------------------------------------ Update Role Permissions

    public async Task<bool> UpdateRolePermissionsAsync(PermissionsFormViewModel permissionsForm)
    {
        var role = await roleManager.FindByIdAsync(permissionsForm.RoleId);
        if (role == null) return false;

        unitOfWork.RoleClaims.DeleteAll(s => s.RoleId == role.Id);

        await unitOfWork.RoleClaims.AddRangeAsync(permissionsForm.CheckBoxes.Where(c => c.IsChecked).Select(c => new IdentityRoleClaim<string>
        {
            RoleId = role.Id,
            ClaimType = Permissions.Permission,
            ClaimValue = c.Name
        }));

        await unitOfWork.SaveChangesAsync();
        return true;
    }

    //------------------------------------------------------------------------------------------------------ Get all Role with select user role

    public async Task<UserRolesViewModel> GetAllRolesUserAsync(string userId)
    {
        var user = await userManager.FindByIdAsync(userId);

        if (user == null || user.IsAdmin == false)
            return null;

        var roles = await roleManager.Roles.ToListAsync();

        return new UserRolesViewModel
        {
            UserId = user.Id,
            UserName = user.UserName,
            CheckBoxes = roles.Select(role => new CheckBox
            {
                Name = role.Name,
                IsChecked = role.Name != null && userManager.IsInRoleAsync(user, role.Name).Result
            }).ToList()
        };
    }

    //------------------------------------------------------------------------------------------------------ Update User Roles
    public async Task<bool> UpdateUserRolesAsync(UserRolesViewModel userRolesViewModel)
    {
        var user = await userManager.FindByIdAsync(userRolesViewModel.UserId);
        if (user == null) return false;

        var userRoles = await userManager.GetRolesAsync(user);
        await userManager.RemoveFromRolesAsync(user, userRoles);

        await userManager.AddToRolesAsync(user, userRolesViewModel.CheckBoxes.Where(r => r.IsChecked).Select(r => r.Name));

        return true;
    }
}