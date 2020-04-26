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
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static Models.GetSetting GetSettings()
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
            var result = new Models.GetSetting();
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var settings = DataBaseConnection.Instance.SelectQueryExecuter("exec GetSettings '" + agencyPublicId + "'");
                    if (settings.Rows.Count > 0)
                    {
                        result = new Models.GetSetting
                        {
                            Name = Convert.ToString(settings.Rows[0][0]),
                            Address = Convert.ToString(settings.Rows[0][4]),
                            PrimaryPhoneNo = Convert.ToString(settings.Rows[0][2]),
                            SecondaryPhoneNo = Convert.ToString(settings.Rows[0][3]),
                            EmailId = Convert.ToString(settings.Rows[0][1]),
                            City = Convert.ToString(settings.Rows[0][5]),
                            Pin = Convert.ToString(settings.Rows[0][7]),
                            State = Convert.ToString(settings.Rows[0][6]),
                            StateGst = Convert.ToString(settings.Rows[0][10]),
                            CenterGst = Convert.ToString(settings.Rows[0][11]),
                            Logo = Convert.ToString(settings.Rows[0][12]),
                            GstNo = Convert.ToString(settings.Rows[0][9]),
                            SubscriptionExpiryDate = Convert.ToString(settings.Rows[0][8])
                        };
                    }
                }
                return result;
            }
            else
            {
                return result;
            }
        }

        [WebMethod(EnableSession = true)]
        public static string UpdateSettings(string Name, string PrimaryPhoneNo, string SecondaryPhoneNo, string EmailId, string Address, string City, string State, decimal StateGst, decimal CenterGst,string GstNo, string Pin)
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
                    DataBaseConnection.Instance.SelectQueryExecuter("exec UpdateSetting '"
                        + Name + "','"
                        + EmailId + "','"
                        + PrimaryPhoneNo + "','"
                        + SecondaryPhoneNo + "','"
                        + Address + "','"
                        + City + "','"
                        + State + "','"
                        + GstNo + "','"
                        + StateGst + "','"
                        + CenterGst + "','"
                        + Pin + "','"
                        + agencyPublicId + "','"
                        + outPut + "'");
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