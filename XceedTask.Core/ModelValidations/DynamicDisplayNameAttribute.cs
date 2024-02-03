using System.ComponentModel;

namespace XceedTask.Core.ModelValidations;

public class DynamicDisplayNameAttribute(string arabicName, string englishName) : DisplayNameAttribute
{
    public override string DisplayName
    {
        get
        {
            var httpContextAccessor = new HttpContextAccessor();
            var lang = httpContextAccessor.HttpContext?.Request.Cookies["lang"] ?? "En";

            return string.Equals(lang, "En", StringComparison.OrdinalIgnoreCase) ? englishName : // Use the English display name
                arabicName; // Use the Arabic display name
        }
    }
}