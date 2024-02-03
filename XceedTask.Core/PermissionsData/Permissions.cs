namespace XceedTask.Core.PermissionsData;

public static class Permissions
{
    public const string Permission = "Permissions";

    public static List<string> GeneratePermissionsList(string module)
    {
        return
        [
            $"Permissions.{module}.View",
            $"Permissions.{module}.Create",
            $"Permissions.{module}.Details",
            $"Permissions.{module}.Edit",
            $"Permissions.{module}.Delete"
        ];
    }

    public static List<string> GenerateAllPermissions()
    {
        var allPermissions = new List<string>();

        var modules = Enum.GetValues(typeof(Modules));

        allPermissions.AddRange(
            new List<string>()
            {
                DashboardPermissions.View,
                ProductUpdatesPermissions.View,
            });

        foreach (var module in modules)
            allPermissions.AddRange(GeneratePermissionsList(module.ToString()));

        return allPermissions;
    }

    public static class DashboardPermissions
    {
        public const string View = "Permissions.Dashboard.View";
    }

    public static class ProductUpdatesPermissions
    {
        public const string View = "Permissions.ProductUpdates.View";
    }

    public static class UsersPermissions
    {
        public const string View = "Permissions.ApplicationUsers.View";
        public const string Create = "Permissions.ApplicationUsers.Create";
        public const string Details = "Permissions.ApplicationUsers.Details";
        public const string Edit = "Permissions.ApplicationUsers.Edit";
        public const string Delete = "Permissions.ApplicationUsers.Delete";
    }

    public static class RolesPermissions
    {
        public const string View = "Permissions.Roles.View";
        public const string Create = "Permissions.Roles.Create";
        public const string Details = "Permissions.Roles.Details";
        public const string Edit = "Permissions.Roles.Edit";
        public const string Delete = "Permissions.Roles.Delete";
    }

    public static class ProductPermissions
    {
        public const string View = "Permissions.Product.View";
        public const string Create = "Permissions.Product.Create";
        public const string Details = "Permissions.Product.Details";
        public const string Edit = "Permissions.Product.Edit";
        public const string Delete = "Permissions.Product.Delete";
    }

    public static class CategoryPermissions
    {
        public const string View = "Permissions.Category.View";
        public const string Create = "Permissions.Category.Create";
        public const string Details = "Permissions.Category.Details";
        public const string Edit = "Permissions.Category.Edit";
        public const string Delete = "Permissions.Category.Delete";
    }
}