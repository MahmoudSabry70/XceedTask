using Microsoft.AspNetCore.Http;

namespace XceedTask.Services.Interfaces;

public interface IFileHandling
{
    Task<string> UploadFileAsync(IFormFile file, string folder, string oldFilePAth = null);

    Task<string> UploadPhotoBase64Async(string stringFile, string folderName = "Student", string oldFilePAth = null);

    Task<string> UploadPhotoByte(byte[] byteFile, string folder = "Student", string oldFilePAth = null);

    public string GetFile(string imgName);

    bool IsImage(IFormFile file);

    bool IsImage(string base64String);

    bool IsExcel(IFormFile file);

    bool IsExcel(string base64String);

    bool IsWord(IFormFile file);

    bool IsWord(string base64String);

    string GetExtensionFromIFormFile(IFormFile file);

    string GetExtensionFromBase64(string base64String);

    bool CheckFileSize(IFormFile file, int sizeLimitInMb);

    bool CheckFileSize(string base64File, int sizeLimitInMb);

    IFormFile ConvertBase64ToIFormFile(string base64String);

    bool RemoveFile(string path);
}
