namespace MedicalAgencyManagement.Models
{
    public class GetUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string PhoneNo { get; set; }
        public string EmailId { get; set; }
        public string IsActive { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Pin { get; set; }
        public string Address { get; set; }
        public string Password { get; set; }
        public string DeactivationDate { get; set; }
    }
    public class AddUser
    {
        public string Name { get; set; }
        public string PhoneNo { get; set; }
        public string EmailId { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Pin { get; set; }
        public string Address { get; set; }
    }
}