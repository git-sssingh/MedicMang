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
                            Name = "Medicines",
                            Icon = "ion-bag",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][0])
                        };
                        var totalCustomer = new Models.Summery
                        {
                            Name = "Customers",
                            Icon = "ion-person-add",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][1])
                        };
                        var totalDoctor = new Models.Summery
                        {
                            Name = "Doctors",
                            Icon = "ion-man",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][2])
                        };
                        var totalMR = new Models.Summery
                        {
                            Name = "Medical Representative",
                            Icon = "ion-medkit",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][3])
                        };
                        var totalBill = new Models.Summery
                        {
                            Name = "Bill till Now",
                            Icon = "ion-documents",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][4])
                        };
                        var totalBillToday = new Models.Summery
                        {
                            Name = "Bill Today",
                            Icon = "ion-bag",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][5])
                        }; 
                        var totalManufacturers = new Models.Summery
                        {
                            Name = "Manufacturer",
                            Icon = "ion-bag",
                            Count = Convert.ToInt32(manufacturerList.Rows[0][6])
                        };
                        result.Add(totalMedicine);
                        result.Add(totalCustomer);
                        result.Add(totalDoctor);
                        result.Add(totalMR);
                        result.Add(totalBill);
                        result.Add(totalBillToday);
                        result.Add(totalManufacturers);
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