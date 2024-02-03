using System.Security.Claims;
using System.Security.Principal;

namespace XceedTask.Extensions;

public static class IdentityExtensions
{
    public static string GetEmail(this IIdentity identity)
    {
        var emailClaim = (identity as ClaimsIdentity)?.FindFirst(ClaimTypes.Email);
        return emailClaim?.Value;
    }

    public static string GetUserId(this IIdentity identity)
    {
        var userIdClaim = (identity as ClaimsIdentity)?.FindFirst(ClaimTypes.NameIdentifier);
        return userIdClaim?.Value;
    }
}