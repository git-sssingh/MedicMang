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
        [WebMethod]
        public static List<Models.MedicineManufacturer> GetManufacturerList(string agencyId)
        {
            Guid agencyPublicId;
            bool isAgencyValid = Guid.TryParse(agencyId, out agencyPublicId);
            var result = new List<Models.MedicineManufacturer>();
            if (isAgencyValid) {
                if (DataBaseConnection.Instance!=null) {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("exec GetMedicinemanufacturers '" + agencyPublicId + "'");
                    var totalManufacturer = manufacturerList!=null?manufacturerList.Rows.Count:0;
                    for (int i = 0; i < totalManufacturer; i++)
                    {
                        var obj = new Models.MedicineManufacturer { 
                            Id = Convert.ToString(manufacturerList.Rows[i][2]),
                            Name = Convert.ToString(manufacturerList.Rows[i][0]),
                            Address = Convert.ToString(manufacturerList.Rows[i][1])
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
    }
}