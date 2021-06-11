namespace MedicalAgencyManagement.Models
{
    public class BillingModel
    {
        public string CustomInfo { get; set; }
        public float Price { get; set; }
        public float Quantity { get; set; }
        public string Comment { get; set; }
        public string CustomerId { get; set; }
        public string VehicleNo { get; set; }
        public string VehicleBrandId { get; set; }
        public string VehicleType { get; set; }
    }

    public class ServicingDetails {
        public string CustomInfo { get; set; }
        public float Price { get; set; }
        public float Quantity { get; set; }
        public string Comment { get; set; }
        public string CreatedDate { get; set; }
    }
}