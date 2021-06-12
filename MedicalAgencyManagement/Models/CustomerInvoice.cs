using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MedicalAgencyManagement.Models
{
    public class CustomerInvoice
    {
        public GetSetting Agency { get; set; }
        public GetCustomer Customer { get; set; }
        public AutoBrand VehicleBrand { get; set; }
        public List<ServicingDetails> ServiceDetails { get; set; }
    }
}