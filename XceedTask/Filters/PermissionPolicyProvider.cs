using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Options;

namespace XceedTask.Filters;

public class PermissionPolicyProvider(IOptions<AuthorizationOptions> options, IHttpContextAccessor httpContextAccessor)
    : IAuthorizationPolicyProvider
{
    public DefaultAuthorizationPolicyProvider FallbackPolicyProvider { get; } = new(options);

    public Task<AuthorizationPolicy> GetDefaultPolicyAsync()
    {
        var httpContext = httpContextAccessor.HttpContext;
        var isApi = httpContext != null && httpContext.Request.Path.StartsWithSegments("/api");

        if (isApi)
        {
            return Task.FromResult(
                               new AuthorizationPolicyBuilder(JwtBearerDefaults.AuthenticationScheme)
                                                  .RequireAuthenticatedUser().Build());
        }

        return Task.FromResult(
            new AuthorizationPolicyBuilder(CookieAuthenticationDefaults.AuthenticationScheme)
                .RequireAuthenticatedUser().Build());
    }

    public Task<AuthorizationPolicy> GetFallbackPolicyAsync()
    {
        return Task.FromResult<AuthorizationPolicy>(null);
    }

    public Task<AuthorizationPolicy> GetPolicyAsync(string policyName)
    {
        if (!policyName.StartsWith(Permissions.Permission, StringComparison.OrdinalIgnoreCase))
            return Task.FromResult<AuthorizationPolicy>(null);
        var policy = new AuthorizationPolicyBuilder();
        policy.AddRequirements(new PermissionRequirement(policyName));
        return Task.FromResult(policy.Build());
    }
}