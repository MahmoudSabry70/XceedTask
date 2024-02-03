namespace XceedTask.Core.Entity
{
    public class BaseEntity
    {
        public long Id { get; set; }

        [Display(Name = "تاريخ الإنشاء")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;

        public bool IsUpdated { get; set; } = false;

        [Display(Name = "تاريخ أخر تحديث  ")]
        public DateTime? UpdatedAt { get; set; } = null;

        public bool IsDeleted { get; set; } = false;
        public DateTime? DeletedAt { get; set; } = null;
    }
}