using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;

namespace MedicalAgencyManagement
{
    public partial class MedicineListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static List<Models.Medicine> GetMedicineList()
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
            var result = new List<Models.Medicine>();
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("exec GetMedicines '" + agencyPublicId + "'");
                    var totalManufacturer = manufacturerList != null ? manufacturerList.Rows.Count : 0;
                    for (int i = 0; i < totalManufacturer; i++)
                    {
                        var obj = new Models.Medicine
                        {
                            Id = Convert.ToString(manufacturerList.Rows[i][0]),
                            Name = Convert.ToString(manufacturerList.Rows[i][1]),
                            Mg = Convert.ToString(manufacturerList.Rows[i][2]),
                            Price = Convert.ToString(manufacturerList.Rows[i][5]),
                            Quantity = Convert.ToString(manufacturerList.Rows[i][4]),
                            MR = Convert.ToString(manufacturerList.Rows[i][9]),
                            Manufacturer = Convert.ToString(manufacturerList.Rows[i][7]),
                            Description = Convert.ToString(manufacturerList.Rows[i][6]),
                            ExpiryDate = Convert.ToString(manufacturerList.Rows[i][3]),
                            ManufacturerId = Convert.ToString(manufacturerList.Rows[i][8]),
                            MRContactNo = Convert.ToString(manufacturerList.Rows[i][10]),
                            MRId = Convert.ToString(manufacturerList.Rows[i][11])
                        };
                        result.Add(obj);
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