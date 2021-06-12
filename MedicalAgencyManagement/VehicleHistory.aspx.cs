using MedicalAgencyManagement.Models;
using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalAgencyManagement
{
    public partial class VehicleHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static List<string> GetVehicleByCustomer(string customerId)
        {
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId = string.Empty;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            Guid agencyPublicId;
            bool isAgencyValid = Guid.TryParse(agencyId, out agencyPublicId);
            
            if (isAgencyValid)
            {
                var result = new List<string>();
                if (DataBaseConnection.Instance != null)
                {
                    
                    var vehicleData = DataBaseConnection.Instance.SelectQueryExecuter("exec GetCustomerVehicles '" + customerId + "'");
                    for (int i = 0; i < vehicleData.Rows.Count; i++)
                    {
                        result.Add(Convert.ToString(vehicleData.Rows[i][0]));
                    }
                }
                return result;
            }
            else
            {
                return new List<string>();
            }
        }


        [WebMethod(EnableSession = true)]
        public static List<VehicleServicingDetail> GetVehicleServiceBillingDate(string vehicleNumber)
        {
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId = string.Empty;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            Guid agencyPublicId;
            bool isAgencyValid = Guid.TryParse(agencyId, out agencyPublicId);

            if (isAgencyValid)
            {
                var result = new List<VehicleServicingDetail>();
                if (DataBaseConnection.Instance != null)
                {

                    var vehicleData = DataBaseConnection.Instance.SelectQueryExecuter("exec GetVehicleServiceBillingDate '" + vehicleNumber + "'");
                    for (int i = 0; i < vehicleData.Rows.Count; i++)
                    {
                        var x = new VehicleServicingDetail { 
                        BrandName = Convert.ToString(vehicleData.Rows[i][1]),
                        CreatedDate = Convert.ToString(vehicleData.Rows[i][0]),
                        SubBrand = Convert.ToString(vehicleData.Rows[i][2]),
                        VehicleType = Convert.ToString(vehicleData.Rows[i][3])
                        };
                        result.Add(x);
                    }
                }
                return result;
            }
            else
            {
                return new List<VehicleServicingDetail>();
            }
        }

        [WebMethod(EnableSession = true)]
        public static List<ServicingDetails> GetCustomerBilling(string vehicleNumber, string createdDate)
        {
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId = string.Empty;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            Guid agencyPublicId;
            bool isAgencyValid = Guid.TryParse(agencyId, out agencyPublicId);

            if (isAgencyValid)
            {
                var result = new List<ServicingDetails>();
                if (DataBaseConnection.Instance != null)
                {
                    var date = DateTime.Parse(createdDate);
                    var vehicleData = DataBaseConnection.Instance.SelectQueryExecuter("exec GetCustomerBilling '" + vehicleNumber + "','" + date.ToString("yyyy-MM-dd") + "'");
                    for (int i = 0; i < vehicleData.Rows.Count; i++)
                    {
                        var x = new ServicingDetails
                        {
                            CustomInfo = Convert.ToString(vehicleData.Rows[i][0]),
                            CreatedDate = Convert.ToString(vehicleData.Rows[i][4]),
                            Price = Convert.ToInt32(vehicleData.Rows[i][3]),
                            Quantity = Convert.ToInt32(vehicleData.Rows[i][1]),
                            Comment = Convert.ToString(vehicleData.Rows[i][2]) 
                        };
                        result.Add(x);
                    }
                }
                return result;
            }
            else
            {
                return new List<ServicingDetails>();
            }
        }

        [WebMethod(EnableSession = true)]
        public static CustomerInvoice GetInvoiceBillingDetails(string customerId, string vehicleNumber, string createdDate)
        {
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            var result = new CustomerInvoice();
            string agencyId = string.Empty;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            Guid agencyPublicId;
            bool isAgencyValid = Guid.TryParse(agencyId, out agencyPublicId);

            if (isAgencyValid)
            {

                if (DataBaseConnection.Instance != null)
                {
                    var date = DateTime.Parse(createdDate);
                    var invoiceData = DataBaseConnection.Instance.SelectSetQueryExecuter("exec GetCustomerBilling '" + agencyPublicId + "','" + customerId + "','" + vehicleNumber + "','" + date.ToString("yyyy-MM-dd") + "'");
                    if (invoiceData.Tables[0].Rows.Count > 0)
                    {
                        result.Agency.Name = Convert.ToString(invoiceData.Tables[0].Rows[0][0]);
                        result.Agency.EmailId = Convert.ToString(invoiceData.Tables[0].Rows[0][1]);
                        result.Agency.PrimaryPhoneNo = Convert.ToString(invoiceData.Tables[0].Rows[0][2]);
                        result.Agency.SecondaryPhoneNo = Convert.ToString(invoiceData.Tables[0].Rows[0][3]);
                        result.Agency.Address = Convert.ToString(invoiceData.Tables[0].Rows[0][4]);
                        result.Agency.State = Convert.ToString(invoiceData.Tables[0].Rows[0][6]);
                        result.Agency.Pin = Convert.ToString(invoiceData.Tables[0].Rows[0][7]);
                        result.Agency.City = Convert.ToString(invoiceData.Tables[0].Rows[0][5]);
                        result.Agency.GstNo = Convert.ToString(invoiceData.Tables[0].Rows[0][9]);
                        result.Agency.StateGst = Convert.ToString(invoiceData.Tables[0].Rows[0][10]);
                        result.Agency.CenterGst = Convert.ToString(invoiceData.Tables[0].Rows[0][11]);
                        result.Agency.Logo = Convert.ToString(invoiceData.Tables[0].Rows[0][12]);
                    }
                    if (invoiceData.Tables[1].Rows.Count > 0)
                    {
                        result.Customer.Name = Convert.ToString(invoiceData.Tables[1].Rows[0][1]);
                        result.Customer.EmailId = Convert.ToString(invoiceData.Tables[1].Rows[0][2]);
                        result.Customer.PhoneNo = Convert.ToString(invoiceData.Tables[1].Rows[0][3]);
                        result.Customer.Address = Convert.ToString(invoiceData.Tables[1].Rows[0][4]);
                        result.Customer.City = Convert.ToString(invoiceData.Tables[1].Rows[0][5]);
                        result.Customer.State = Convert.ToString(invoiceData.Tables[1].Rows[0][6]);
                        result.Customer.Pin = Convert.ToString(invoiceData.Tables[1].Rows[0][7]);
                        result.Customer.CreateDate = Convert.ToString(invoiceData.Tables[1].Rows[0][8]);
                    }
                    if (invoiceData.Tables[3].Rows.Count > 0)
                    {
                        result.VehicleBrand.BrandName = Convert.ToString(invoiceData.Tables[3].Rows[0][0]);
                        result.VehicleBrand.SubBrand = Convert.ToString(invoiceData.Tables[3].Rows[0][1]);
                        result.VehicleBrand.VehicleType = Convert.ToString(invoiceData.Tables[3].Rows[0][2]);
                    }
                    if (invoiceData.Tables[2].Rows.Count > 0)
                    {
                        for (int i = 0; i < invoiceData.Tables[2].Rows.Count; i++)
                        {
                            var sd = new ServicingDetails();
                            sd.CustomInfo = Convert.ToString(invoiceData.Tables[2].Rows[i][0]);
                            sd.Quantity = Convert.ToInt32(invoiceData.Tables[2].Rows[i][1]);
                            sd.Comment = Convert.ToString(invoiceData.Tables[2].Rows[i][2]);
                            sd.Price = Convert.ToInt32(invoiceData.Tables[2].Rows[i][3]);
                            sd.CreatedDate = Convert.ToString(invoiceData.Tables[2].Rows[i][4]);
                            result.ServiceDetails.Add(sd);
                        }
                    }
                }
            }
            else
            {
                return new CustomerInvoice();
            }
            return result;
        }
    }
}