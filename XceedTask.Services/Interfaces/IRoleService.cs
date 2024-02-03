using XceedTask.Core.Entity.ApplicationData;
using XceedTask.Core.PermissionsData;

namespace XceedTask.Services.Interfaces;

public interface IRoleService
{
    Task<IEnumerable<ApplicationRole>> GetAllRolesAsync();

    Task<IEnumerable<ApplicationRole>> GetAllRolesForUserAsync(ApplicationUser user);

    Task<IEnumerable<string>> GetAllRolesForUserAsStringAsync(ApplicationUser user);

    Task<ApplicationRole> GetRoleByIdAsync(string roleId);

    Task<ApplicationRole> GetRoleByNameAsync(string roleName);

    Task<IEnumerable<ApplicationUser>> GetRoleUsersAsync(string roleName);

    Task<List<string>> GetRolePermissionsAsync(string roleData, bool isRoleId = true);

    Task<bool> DeleteRoleAsync(string roleId);

    Task<bool> CreateRoleAsync(ApplicationRole role);

    Task<bool> UpdateRoleAsync(ApplicationRole role);

    Task<bool> AddRoleToUserAsync(ApplicationUser user, string roleName);

    Task<bool> RemoveRoleFromUserAsync(ApplicationUser user, string roleName);

    Task<PermissionsFormViewModel> GetAllPermissionsRoleAsync(string roleId);

    Task<bool> UpdateRolePermissionsAsync(PermissionsFormViewModel permissionsForm);

    Task<UserRolesViewModel> GetAllRolesUserAsync(string userId);

    Task<bool> UpdateUserRolesAsync(UserRolesViewModel userRolesViewModel);
}
