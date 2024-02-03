namespace XceedTask.Extensions;

public static class StringExtensions
{
    private static readonly Dictionary<char, char> DigitMap = new()
    {
        {'0', '٠'},
        {'1', '١'},
        {'2', '٢'},
        {'3', '٣'},
        {'4', '٤'},
        {'5', '٥'},
        {'6', '٦'},
        {'7', '٧'},
        {'8', '٨'},
        {'9', '٩'}
    };

    public static string ReplaceDigits(this string input)
    {
        var result = "";
        foreach (var c in input)
        {
            if (DigitMap.TryGetValue(c, out var value))
            {
                result += value;
            }
            else
            {
                result += c;
            }
        }
        return result;
    }

    //--------------------------------------------------------------------------------------------------------------
    public static string SplitCamelCase(this string input)
    {
        // Use regular expression to split camel case words
        var parts = RegularExpressionExtensions.SplitCamelCaseRegex().Split(input);

        var output = string.Join(" ", parts);

        return output;
    }

    //--------------------------------------------------------------------------------------------------------------

    /*    public static string RandomString(this string input, int length)
        {
            var random = new Random();
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());

    //--------------------------------------------------------------------------------------------------------------
    public static string GenerateRandomNumber(this string input)
    {
        const int min = 1000;
        const int max = 9999;
        var rdm = new Random();
        return rdm.Next(min, max).ToString();
    }
     }*/
}