using System.Text.RegularExpressions;

namespace XceedTask.Extensions
{
    public static partial class RegularExpressionExtensions
    {
        [GeneratedRegex("(?<!^)(?=[A-Z])")]
        public static partial Regex SplitCamelCaseRegex();

        [GeneratedRegex("(\\+201|01|00201)[0-2,5]{1}[0-9]{8}")]
        public static partial Regex PhoneNumberRegex();

        [GeneratedRegex("^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")]
        public static partial Regex EmailRegex();
    }
}