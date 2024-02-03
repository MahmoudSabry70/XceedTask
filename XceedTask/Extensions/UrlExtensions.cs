namespace XceedTask.Extensions;

public static class UrlExtensions
{
    public static string ContentWithRoot(this IUrlHelper urlHelper, string contentPath)
    {
        if (urlHelper == null)
            return contentPath;

        if (string.IsNullOrEmpty(contentPath))
            return contentPath;

        if (contentPath.Contains("https"))
            return contentPath;

        // Check if the contentPath already starts with "~/".
        if (contentPath.StartsWith("~/")) return urlHelper.Content(contentPath);
        // IF START WITH "/" THEN REMOVE IT
        if (contentPath.StartsWith('/'))
        {
            contentPath = contentPath[1..];
        }

        // it have \ then replace it with /
        if (contentPath.Contains('\\'))
        {
            contentPath = contentPath.Replace("\\", "/");
        }
        // If not, prepend "~/" to make it relative to the application root.
        contentPath = "~/" + contentPath;

        // Use Url.Content to resolve the URL.
        return urlHelper.Content(contentPath);
    }
}