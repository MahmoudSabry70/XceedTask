using Microsoft.Extensions.DependencyInjection;

namespace XceedTask.Core.ModelValidations;

[AttributeUsage(AttributeTargets.Property)]
public class RequiredWithDynamicErrorMessageAttribute(string englishErrorMessage, string arabicErrorMessage)
    : RequiredAttribute, IClientModelValidator
{
    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        // Get the value of the lang cookie
        var httpContext = validationContext.GetRequiredService<IHttpContextAccessor>()?.HttpContext;
        var lang = httpContext?.Request.Cookies["lang"] ?? "En";

        // Determine the appropriate error message based on the lang value
        var errorMessage = string.Equals(lang, "En", StringComparison.OrdinalIgnoreCase)
            ? englishErrorMessage
            : arabicErrorMessage;

        if (value == null || string.IsNullOrEmpty(value.ToString()))
        {
            return new ValidationResult(errorMessage: errorMessage);
        }

        // Set the error message
        return ValidationResult.Success;
    }

    public void AddValidation(ClientModelValidationContext context)
    {
        if (context == null)
        {
            throw new ArgumentNullException(nameof(context));
        }

        var lang = context.ActionContext.HttpContext.Request.Cookies["lang"] ?? "En";
        var errorMessage = string.Equals(lang, "En", StringComparison.OrdinalIgnoreCase)
            ? englishErrorMessage
            : arabicErrorMessage;

        context.Attributes["data-val"] = "true";
        context.Attributes["data-val-required"] = errorMessage; // Set an English error message for client-side validation.
    }
}