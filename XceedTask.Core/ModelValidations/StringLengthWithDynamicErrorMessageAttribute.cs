using Microsoft.Extensions.DependencyInjection;

namespace XceedTask.Core.ModelValidations;

[AttributeUsage(AttributeTargets.Property)]
public class StringLengthWithDynamicErrorMessageAttribute : StringLengthAttribute, IClientModelValidator
{
    private readonly string _englishErrorMessage;
    private readonly string _arabicErrorMessage;

    public StringLengthWithDynamicErrorMessageAttribute(int maximumLength, int minimumLength, string englishErrorMessage, string arabicErrorMessage)
        : base(maximumLength)
    {
        MinimumLength = minimumLength;
        _englishErrorMessage = englishErrorMessage;
        _arabicErrorMessage = arabicErrorMessage;
    }

    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        // Get the value of the lang cookie
        var httpContext = validationContext.GetRequiredService<IHttpContextAccessor>()?.HttpContext;
        var lang = httpContext?.Request.Cookies["lang"] ?? "En";

        // Determine the appropriate error message based on the lang value
        var errorMessage = string.Equals(lang, "En", StringComparison.OrdinalIgnoreCase)
            ? _englishErrorMessage
            : _arabicErrorMessage;

        if (value == null || string.IsNullOrEmpty(value.ToString()))
        {
            return new ValidationResult(errorMessage);
        }

        // Perform string length validation
        return base.IsValid(value, validationContext);
    }

    public void AddValidation(ClientModelValidationContext context)
    {
        if (context == null)
        {
            throw new ArgumentNullException(nameof(context));
        }

        var lang = context.ActionContext.HttpContext.Request.Cookies["lang"] ?? "En";
        var errorMessage = string.Equals(lang, "En", StringComparison.OrdinalIgnoreCase)
            ? _englishErrorMessage
            : _arabicErrorMessage;

        context.Attributes["data-val"] = "true";
        context.Attributes["data-val-length"] = errorMessage; // Set an English error message for client-side validation.
        context.Attributes["data-val-length-max"] = MaximumLength.ToString();
        context.Attributes["data-val-length-min"] = MinimumLength.ToString();
    }
}