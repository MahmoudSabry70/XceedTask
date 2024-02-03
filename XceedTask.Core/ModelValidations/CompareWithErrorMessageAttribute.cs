namespace XceedTask.Core.ModelValidations;

[AttributeUsage(AttributeTargets.Property | AttributeTargets.Field | AttributeTargets.Parameter, AllowMultiple = false)]
public sealed class CompareWithErrorMessageAttribute(string otherProperty, string errorMessageEn, string errorMessageAr)
    : CompareAttribute(otherProperty)
{
    public string ErrorMessageEn { get; } = errorMessageEn;
    public string ErrorMessageAr { get; } = errorMessageAr;

    public override string FormatErrorMessage(string name)
    {
        var httpContextAccessor = new HttpContextAccessor();
        var lang = httpContextAccessor.HttpContext?.Request.Cookies["lang"] ?? "En";

        // Choose the appropriate error message based on the current culture
        var errorMessage = (lang == "En") ? ErrorMessageEn : ErrorMessageAr;
        return string.Format(errorMessage, name, OtherPropertyDisplayName ?? OtherProperty);
    }
}