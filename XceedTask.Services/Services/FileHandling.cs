using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System.Text.RegularExpressions;
using XceedTask.Services.Interfaces;

namespace XceedTask.Services.Services;

public class FileHandling(IWebHostEnvironment webHostEnvironment) : IFileHandling
{
    #region Photo Handling

    public async Task<string> UploadFileAsync(IFormFile file, string folder, string oldFilePAth = null)
    {
        var uploads = Path.Combine(webHostEnvironment.WebRootPath, $"Files/{folder}");
        if (!Directory.Exists(uploads))
        {
            Directory.CreateDirectory(uploads);
        }
        var uniqueFileName = RandomString(10) + "_" + RemoveSpecialCharacters(file.FileName);
        var filePath = Path.Combine(uploads, uniqueFileName);
        await using (var fileStream = new FileStream(filePath, FileMode.Create))
        {
            await file.CopyToAsync(fileStream);
        }
        var path = Path.Combine($"/Files/{folder}", uniqueFileName);
        var old = $"{webHostEnvironment.WebRootPath}/{oldFilePAth}";
        if (oldFilePAth != null && File.Exists(old))
        {
            File.Delete(old);
        }
        return path;
    }

    public async Task<string> UploadPhotoBase64Async(string stringFile, string folderName = "Student", string oldFilePAth = null)
    {
        var myString = stringFile.Split(',').ToList();
        var type = myString[0].Split('/').ToList()[1].Split(';').ToList()[0];
        var byteFile = Convert.FromBase64String(myString[1]);

        var stream = new MemoryStream(byteFile);
        var file = new FormFile(stream, 0, byteFile.Length, "Name", folderName);

        var uploads = Path.Combine(webHostEnvironment.WebRootPath, $"Files/{folderName}");
        if (!Directory.Exists(uploads))
        {
            Directory.CreateDirectory(uploads);
        }

        var uniqueFileName = RandomString(10) + "_" + RemoveSpecialCharacters(file.FileName) + "." + type;
        var filePath = Path.Combine(uploads, uniqueFileName);
        await using (var fileStream = new FileStream(filePath, FileMode.Create))
        {
            await file.CopyToAsync(fileStream);
        }
        var path = Path.Combine($"/Files/{folderName}", uniqueFileName);
        var old = $"{webHostEnvironment.WebRootPath}/{oldFilePAth}";
        if (oldFilePAth != null && File.Exists(old))
        {
            File.Delete(old);
        }
        return path;
    }

    public async Task<string> UploadPhotoByte(byte[] byteFile, string folder = "Student", string oldFilePAth = null)
    {
        var stream = new MemoryStream(byteFile);
        IFormFile file = new FormFile(stream, 0, byteFile.Length, "Name", folder);
        return await UploadFileAsync(file, folder, oldFilePAth);
    }

    public static string RandomString(int length)
    {
        var random = new Random();
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
            .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    public string GetFile(string foo)
    {
        return webHostEnvironment.WebRootFileProvider.GetFileInfo(foo).PhysicalPath;
    }

    #endregion Photo Handling

    #region Validate on type of file

    public bool IsImage(IFormFile file)
    {
        var extension = GetExtensionFromIFormFile(file);
        if (extension == null) return false;

        var validImages = new List<string>
        {
            "tiff", "pjp", "pjpeg", "jfif", "tif", "svg", "bmp", "jpeg", "jpg", "png", "gif", "svgz", "webp", "ico", "xbm", "dib"
        };

        return validImages.Contains(extension);
    }

    public bool IsExcel(IFormFile file)
    {
        var extension = GetExtensionFromIFormFile(file);
        if (extension == null) return false;

        var validExcels = new List<string>
        {
            "xlsx", "xls", "csv"
        };

        return validExcels.Contains(extension);
    }

    public bool IsWord(IFormFile file)
    {
        var extension = GetExtensionFromIFormFile(file);
        if (extension == null) return false;

        var validWords = new List<string>
        {
            "doc","docx","rtf"
        };

        return validWords.Contains(extension);
    }

    public string GetExtensionFromIFormFile(IFormFile file)
    {
        if (file == null) return null;
        var extension = Path.GetExtension(file.FileName.Replace(" ", "_"))[1..].ToLower();
        return extension;
    }

    #endregion Validate on type of file

    #region Validation on type of base64

    public bool IsImage(string base64String)
    {
        var extension = GetExtensionFromBase64(base64String);

        var validImages = new List<string>
            { "tiff", "pjp", "pjpeg", "jfif", "tif", "svg", "bmp", "jpeg", "jpg", "png", "gif", "svgz", "webp", "ico", "xbm", "dib" };

        //var extension = base64File.Split(",")[0].Split("/")[1].Split(";")[0].ToLower();

        return validImages.Contains(extension);
    }

    public bool IsWord(string base64String)
    {
        var extension = GetExtensionFromBase64(base64String);

        var validWords = new List<string>
        {
            "doc", "docx", "rtf"
        };

        return validWords.Contains(extension);
    }

    public bool IsExcel(string base64String)
    {
        var extension = GetExtensionFromBase64(base64String);

        if (string.IsNullOrEmpty(extension))
            return false;

        var validExcels = new List<string>{
            "xlsx", "xls", "csv"
        };

        return validExcels.Contains(extension);
    }

    public string GetExtensionFromBase64(string base64String)
    {
        if (string.IsNullOrEmpty(base64String))
            return "";
        try
        {
            var myString = base64String.Split(',').ToList();
            var type = myString[0].Split('/').ToList()[1].Split(';').ToList()[0];

            return type.ToLower();
        }
        catch
        {
            return "";
        }
    }

    #endregion Validation on type of base64

    #region Validate on size of file

    public bool CheckFileSize(IFormFile file, int sizeLimitInMb)
    {
        if (file == null) return false;
        var fileSizeInBytes = file.Length;
        var fileSizeInMb = fileSizeInBytes / (1024 * 1024); // Convert bytes to megabytes

        return fileSizeInMb <= sizeLimitInMb;
    }

    public bool CheckFileSize(string base64File, int sizeLimitInMb)
    {
        try
        {
            var data = base64File.Split(",")[1];
            var fileBytes = Convert.FromBase64String(data);
            long fileSizeInBytes = fileBytes.Length;
            var fileSizeInMbCalculated = fileSizeInBytes / (1024 * 1024); // Convert bytes to megabytes

            return fileSizeInMbCalculated <= sizeLimitInMb;
        }
        catch
        {
            return false;
        }
    }

    public IFormFile ConvertBase64ToIFormFile(string base64String)
    {
        try
        {
            var bytes = Convert.FromBase64String(base64String);
            var stream = new MemoryStream(bytes);
            var file = new FormFile(stream, 0, bytes.Length, "Name", "fileName");
            return file;
        }
        catch
        {
            return null;
        }
    }

    #endregion Validate on size of file

    #region Remove File

    public bool RemoveFile(string path)
    {
        var old = $"{webHostEnvironment.WebRootPath}/{path}";
        if (!File.Exists(old)) return false;
        File.Delete(old);
        return true;
    }

    #endregion Remove File

    public static string RemoveSpecialCharacters(string fileName)
    {
        // Define a regular expression pattern to match special characters.
        var pattern = "[\\~#%&*{}/:<>?|\"-()]";

        // Replace special characters with an empty string.
        var result = Regex.Replace(fileName, pattern, "");

        // You can also replace spaces with underscores or any other character if needed.
        result = result.Replace(" ", "_");

        return result;
    }
}
