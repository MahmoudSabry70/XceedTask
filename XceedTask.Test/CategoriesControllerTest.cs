using Microsoft.AspNetCore.Mvc.Testing;
using Newtonsoft.Json;
using System.Net;
using System.Text;
using XceedTask.Core.ViewModel.AuthViewModel;

namespace XceedTask.Test;

public class CategoriesControllerTest(WebApplicationFactory<Program> factory)
    : IClassFixture<WebApplicationFactory<Program>>
{
    [Theory]
    [InlineData("/Categories/Index")]
    [InlineData("/Categories/Details/1")]
    [InlineData("/Categories/Edit/1")]
    public async Task AllPagesLoad_ReturnsSuccess(string url)
    {
        // Arrange
        var client = factory.CreateClient(new WebApplicationFactoryClientOptions
        {
            AllowAutoRedirect = false
        });

        client.DefaultRequestHeaders.Add("Cookie", ".AspNetCore.Identity.Application=CfDJ8CLV_Ikwt_tBoSIR6FSgUqdh_CWYFIQh6CxUnHfiRBkt-nmgRhY8HVszNT64eawj0H914y4Wy7gYXX4TClwxCiOV1vEUIzCoasK9R-8W0t_m7cKSw297I_QYM1NV_gWSLCjZaXNrwFwzoiGmg6zLCcojBbkMpVI89ueWDGuRnwm6U5EVNg4j-bKSFnLWu7dpFgbI7lMTP12vcq44yS2R-75aI1ST8VxO_hI0DDoNItac1LIK80yYIhHK_EFLsuR7YDoFYv5ulnw2O19zzVScJgo-MxZ3UukNQdXtNA2qLi04LcyDY7uE_5Zq6ZJlfnBlWQqnoEjkbn-5YQiRfAvoa-n8Y45DzDfyo8WcFwM_6a00QT96bKKmCn4DKbW1SirM6RZb6G7ShMD5AWr0Mdp7ti7Fn0izJiU-yMAGd5FJUG3BY5b-ELRygiZTSdiFW9pxpjLOeUoEqfPxR9s58PUgNKlhXyoNqUlpBrgzhGZpPY-UdBW_hsiBrcVQWkNh9y92vKW1f6rkZFNYt9HAklBPPLdPvZnCBFpnbGTad5tCcxSMRG_RVOxcfBAvhXqaVaUjgjYXMPDkF0arFnsD65Cl7osx_Zni5fBZ8Q8PI9vtobzgSY0pkKF-dvTzrH07iVCR_Ibo-B5AQmYL6PrcdbX3GgQTLMSG_gVUpwoBcFAwTCQSJyPird6RteWGgM779ObYAy_VqedBq6kdnSqY8aFLeVHBAVbS6DrtsaNm7iaZRzJFxHwoq1QSbYFlKTl_YusuOhvJc01FC8PQ6e4n2zPB7FU562sxM2GIMh7zyBO6MvFz3y0FMY0Azh8qfTHOvzqRPkIXjTexcEJuNryyeMxW32GUIz8iPgunATxUa65lqZypeDyQetgQeu1LYuTwXXm1CGMVRJGHBqYzWTV6vEHtSmA8BVZPHcRcKE1_p-Wm7QsPWYtpvLmlzxGHh0Tz2AkqaolOTsNEQ9lrBngJ4GPb81yePZwmylsuMQahVsS2M2IU5KKYWWDwvw_IImzF2A_qQgLFEtzxNpWXGOhrsi7lHkIyMelE03qo_-l62O-A4oAGiVdS1me8KemKzGP2icyHDfDt0M9XSKxuQyVhQwQ3JwQqqBG38Hlz9WXpSUrmDmw2hDiwsa_PcnwAcM_Xj6pzRbC_lTcqKccTy5tP_ufU86g_NXE9aQ7EfYJG3vE9f0p4TeB1s_zQ56vd29OSZNMp-ro-0UK_4Y_Q9WK-NUHnYuXFLuy-_OZ5NWxcGnmGppduIQqMzmQSA6lz9E1HRQajn1u3vMHhRBoJ0IG3XqQ8eBdXGSVfrswqy7nqeBJXOT1h2kTZSf2O6Dqh_ygKK9JYIjpBhkanE1rszBi7y4TiY12mqwm_uxKzp01heiYcuU_CVW17aSMRbIATZ1Am59GTGkeLYk_7huWBK2Py5YiD2YAisoZJKmL3dx8MnPTlaSdx0icvR5c11cmkj-aSxM2DdFJsnj19jWZsFgBzUjkZ04pVu_oxFU8dd3xeE17in1cvBnYe-MkHBB4gnwOMaenh1YsSVDYCYCkLj6RkubcXlKz9Vj1YqkKF-2-az6YTZ_74L8HTtSHEmQylx97WpPEQ2-DPlrEmEvd-lTaLrVIL5Cu9OzmmvozLaVMWEl9COP9tq8_-ID-mDsauxAYCnGIe3glYlqOA8Ljl7jjIh8byOeD9TY7DIT6cd4_a4i7As2amovTo2wwGXQw7aY2NIKdJ4hJp5Tm__o0zeQciYxLcpQV3sQJXUu5Bj8TIyPg0xw_dW10__tkwLu0ljLqG6R_pD1U2Mgy5DoBr0U_3jg_aZs7kVE7afZbuCRLEWoLZWOEjabUxcBEPpzGMV22sIEiIG-WLr0DBme2cJNs4VbJpS23Lsc1JKs_mL6hyOBnvxoYsVBRwpoM17GSzuutN7t6bweANd0jOb-YdEaMrIXIc_1EduO_QExUdAuGeMwSY3Zpo9t0YeJjChQbrt7qCpQh4XpB-V9az1twV3slFD2jkxUWgpkNWgLggvAz1r-9WhPsYwyDNcJtdERYfToXX7sgzjwNIPWooHt2-yx3r2bBjuqDUO99TrAfgloZs3WsZHZU9Ap1TvbNJ6sihECyAygjoRztkPqFg6cV1Vw_YjyeefK_qUhCc99gWzfyA_WM-bPJGML_4AEGaVXHqU2zy0ALobnEzWuzgTd9y_GZ2RHXsaKPc7M0h9oxH-hUOWhkr8JWYHsyXUGUhtg6-uzBm2GCeUOG7WaFxUjJIKvB1dUBGpKNtDsAp0bZKbPZB4FL-ie9g1xsn0QkwwgjuLdB7fBjQr1bwV79grbIYT5OY29dpCThADTYdEBLd0F-Bv4NDJJIOI06MZMW1llXIKRNslfN4aoBaMLnSJmtNa5zSctqbTCASv0lDKKnK4i-Ryhp4ZbeWk7jRiSnaDd4rOp36EVKPXxv5l58SQfyEvjuBHriqLXs;"); // Add your complete cookie value here
        // Act
        var response = await client.GetAsync(url);

        // Assert
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    private async Task<HttpResponseMessage> PerformLoginAsync(HttpClient client)
    {
        // not work this method need add [FromBody] to LoginViewModel
        var userLogin = new LoginViewModel
        {
            Email = "superAdmin123@gmail.com",
            Password = "superAdmin123@",
            IsPersist = true,
            ReturnUrl = "sss"
        };

        var loginResponse = await client.PostAsync("/Account/Login",
            new StringContent(JsonConvert.SerializeObject(userLogin), Encoding.UTF8, "application/json"));

        // loginResponse.EnsureSuccessStatusCode();

        client.DefaultRequestHeaders.Add("Cookie", loginResponse.Headers.GetValues("Set-Cookie"));

        return loginResponse;
    }
}