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
                        result.Add(Convert.ToString(vehicleData.Rows[0][i]));
                    }
                }
                return result;
            }
            else
            {
                return new List<string>();
            }
        }
    }
}