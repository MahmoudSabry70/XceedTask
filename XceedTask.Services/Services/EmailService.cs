using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using MimeKit;
using XceedTask.Core.Helpers;
using XceedTask.Services.Interfaces;

namespace XceedTask.Services.Services;

public class EmailService(IOptions<EmailSetting> emailSettings) : IEmailService
{
    private readonly EmailSetting _emailSettings = emailSettings.Value;

    public async Task SendEmailAsync(string emailTo, string subject, string body, IList<IFormFile> attachments = null)
    {
        try
        {
            var email = new MimeMessage
            {
                Sender = MailboxAddress.Parse(_emailSettings.Email),
                Subject = subject
            };

            email.To.Add(MailboxAddress.Parse(emailTo));

            var builder = new BodyBuilder
            {
                #region if have any attach

                /*if (attachments != null)
                {
                    byte[] fileBytes;
                    foreach (var file in attachments)
                    {
                        if (file.Length > 0)
                        {
                            using var ms = new MemoryStream();
                            file.CopyTo(ms);
                            fileBytes = ms.ToArray();
                            builder.Attachments.Add(file.FileName, fileBytes, ContentType.Parse(file.ContentType));
                        }
                    }
                }*/

                #endregion if have any attach

                HtmlBody = body
            };
            email.Body = builder.ToMessageBody();
            email.From.Add(new MailboxAddress(_emailSettings.DisplayName, _emailSettings.Email));

            using var smtp = new SmtpClient();
            await smtp.ConnectAsync(_emailSettings.Host, _emailSettings.Port);
            await smtp.AuthenticateAsync(_emailSettings.Email, _emailSettings.Password);
            await smtp.SendAsync(email);

            await smtp.DisconnectAsync(true);
        }
        catch
        {
            // ignored
        }
    }
}
