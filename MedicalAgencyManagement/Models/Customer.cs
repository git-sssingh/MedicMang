namespace MedicalAgencyManagement.Models
{
    public class GetCustomer
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string PhoneNo { get; set; }
        public string EmailId { get; set; }
        public string CreateDate { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Pin { get; set; }
        public string Address { get; set; }
    }
    public class AddCustomer
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