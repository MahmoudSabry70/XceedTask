using Microsoft.AspNetCore.Http;

namespace XceedTask.Services.Interfaces;

public interface IEmailService
{
    Task SendEmailAsync(string mailTo, string subject, string body, IList<IFormFile> attachments = null);
}
