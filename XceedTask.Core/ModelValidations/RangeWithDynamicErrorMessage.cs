namespace XceedTask.Core.ModelValidations;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter, AllowMultiple = false)]
public class RangeWithDynamicErrorMessageAttribute<T>(
    T min,
    T max,
    string arabicErrorMessage,
    string englishErrorMessage)
    : ValidationAttribute, IClientModelValidator
{
    public override bool IsValid(object value)
    {
        var httpContextAccessor = new HttpContextAccessor();
        var lang = httpContextAccessor.HttpContext?.Request.Cookies["lang"] ?? "En";

        var errorMessage = string.Equals(lang, "En", StringComparison.OrdinalIgnoreCase)
            ? englishErrorMessage
            : arabicErrorMessage;

        ErrorMessage = errorMessage;

        switch (value)
        {
            case null:
            case IComparable comparable when comparable.CompareTo(min) >= 0 && comparable.CompareTo(max) <= 0:
                return true; // null values are considered valid, let Required handle them
            default:
                return false;
        }
    }

    public void AddValidation(ClientModelValidationContext context)
    {
        //ArgumentNullException.ThrowIfNull(context);

        var lang = context.ActionContext.HttpContext.Request.Cookies["lang"] ?? "En";
        var errorMessage = string.Equals(lang, "En", StringComparison.OrdinalIgnoreCase)
            ? englishErrorMessage
            : arabicErrorMessage;

        context.Attributes["data-val"] = "true";
        context.Attributes["data-val-required"] = errorMessage; // Set an English error message for client-side validation.
    }
}