namespace XceedTask.Extensions;

public static class FormFileExtensions
{
    public static bool IsImage(this IFormFile file)
    {
        var extension = GetExtensionFromIFormFile(file);
        if (extension == null) return false;

        var validImages = new List<string>
        {
            "jpeg", "jpg", "png",
        };

        return validImages.Contains(extension);
    }

    public static bool CheckFileSize(this IFormFile file, int sizeLimitInMb)
    {
        if (file == null) return false;
        var fileSizeInBytes = file.Length;
        var fileSizeInMb = fileSizeInBytes / (1024 * 1024); // Convert bytes to megabytes

        return fileSizeInMb <= sizeLimitInMb;
    }

    public static string GetExtensionFromIFormFile(IFormFile file)
    {
        if (file == null) return null;
        var extension = Path.GetExtension(file.FileName.Replace(" ", "_"))[1..].ToLower();
        return extension;
    }
}