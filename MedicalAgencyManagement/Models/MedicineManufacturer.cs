using System;

namespace MedicalAgencyManagement.Models
{
    public enum VehicleType 
    { 
        TwoWheeler,
        ThreeWheeler,
        FourWheeler,
        HeavyVehicle

    }
    public class VehicleBrnad
    {
        public string Id { get; set; }
        public string BrandName { get; set; }
        public string SubBrand { get; set; }
        public string VehicleType { get; set; }
    }
    public class VehicleBrand
    {
        public string Id { get; set; }
        public string BrandName { get; set; }
    }
}