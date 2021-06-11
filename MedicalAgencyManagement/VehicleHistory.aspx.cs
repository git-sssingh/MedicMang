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
    }
}