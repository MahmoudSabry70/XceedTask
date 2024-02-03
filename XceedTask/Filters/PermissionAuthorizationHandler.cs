namespace XceedTask.Filters;

public class PermissionAuthorizationHandler : AuthorizationHandler<PermissionRequirement>
{
    public PermissionAuthorizationHandler()
    {
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, PermissionRequirement requirement)
    {
        var canAccess = context.User.Claims.Any(c => c.Type == Permissions.Permission && c.Value == requirement.Permission && c.Issuer == "LOCAL AUTHORITY");

        if (!canAccess) return Task.CompletedTask;
        context.Succeed(requirement);
        return Task.CompletedTask;
    }
}