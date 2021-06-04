using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;

namespace MedicalAgencyManagement
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static List<Models.Summery> GetSummery()
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
            var result = new List<Models.Summery>();
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("exec AgencySummery '" + agencyPublicId + "'");
                    var totalManufacturer = manufacturerList != null ? manufacturerList.Rows.Count : 0;
                    if(totalManufacturer>0)
                    {
                        var totalMedicine = new Models.Summery
                        {
                            Name = "Vehicles",
                            Icon = "ion-bag",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][0])
                        };
                        var totalCustomer = new Models.Summery
                        {
                            Name = "Customers",
                            Icon = "ion-person-add",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][1])
                        };
                        
                        result.Add(totalMedicine);
                        result.Add(totalCustomer);
                    }
                }
                return result;
            }
            else
            {
                return result;
            }
        }
    }
}