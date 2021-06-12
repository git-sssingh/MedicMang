using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MedicalAgencyManagement.Models
{
    public class CustomerInvoice
    {
        public GetSetting Agency { get; set; } = new GetSetting();
        public GetCustomer Customer { get; set; } = new GetCustomer();
        public AutoBrand VehicleBrand { get; set; } = new AutoBrand();
        public List<ServicingDetails> ServiceDetails { get; set; } = new List<ServicingDetails>();
    }
}