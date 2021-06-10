using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalAgencyManagement
{
    public partial class MedicineManufacturer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static List<Models.VehicleBrnad> GetBrandsDetail()
        {
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId = string.Empty;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else {
                agencyId = sessionData.Split(',')[2];
            }
            Guid agencyPublicId;
            bool isAgencyValid = Guid.TryParse(agencyId, out agencyPublicId);
            var result = new List<Models.VehicleBrnad>();
            if (isAgencyValid) {
                if (DataBaseConnection.Instance!=null) {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("exec GetBrandsDetail");
                    var totalManufacturer = manufacturerList!=null?manufacturerList.Rows.Count:0;
                    for (int i = 0; i < totalManufacturer; i++)
                    {
                        var obj = new Models.VehicleBrnad
                        { 
                            BrandName = Convert.ToString(manufacturerList.Rows[i][0]),
                            SubBrand = Convert.ToString(manufacturerList.Rows[i][1]),
                            VehicleType = Convert.ToString(manufacturerList.Rows[i][2]),
                            Id = Convert.ToString(manufacturerList.Rows[i][3]),
                        };
                        result.Add(obj);
                    }
                }
                return result;
            }
            else {
                return result;
            }
        }

        [WebMethod(EnableSession = true)]
        public static string AddBrands(string brandName, string modelName, string vehicleType)
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
            string outPut = string.Empty;
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                  DataBaseConnection.Instance.SelectQueryExecuter("exec AddBrands '" + brandName + "','"+ modelName + "','"+ vehicleType + "','"+ outPut + "'");
                }
                return outPut;
            }
            else
            {
                return "Incorrect Agency!";
            }
        }
    }
}