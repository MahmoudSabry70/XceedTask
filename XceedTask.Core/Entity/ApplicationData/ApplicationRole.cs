namespace XceedTask.Core.Entity.ApplicationData
{
    public class ApplicationRole : IdentityRole
    {
        public ApplicationRole(string roleName) : base(roleName)
        {
            NameAr = roleName;
            Description = roleName;
            RoleNumber = 0;
        }

        public ApplicationRole() : base()
        {
            NameAr = "roleName";
            Description = "roleName";
            RoleNumber = 0;
        }

        public string NameAr { get; set; }

        public string Description { get; set; }

        public int RoleNumber { get; set; }
    }
}