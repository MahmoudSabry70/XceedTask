using XceedTask.Core.Entity.ProductData;

namespace XceedTask.Core.Entity.ApplicationData
{
    public class ApplicationUser : IdentityUser
    {
        public string FullName { get; set; }

        public string DeviceToken { get; set; }

        public DateTime RegistrationDate { get; set; } = DateTime.Now;

        public bool Status { get; set; } = true;

        public bool IsAdmin { get; set; } = false;

        public UserType UserType { get; set; }
        public string UserImgUrl { get; set; }
        public string RandomCode { get; set; }
        public bool IsDeleted { get; set; }

        //---------------------------------------------
        public IEnumerable<Product> Products { get; set; } = new List<Product>();
    }
}