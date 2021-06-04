using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using MedicalAgencyManagement.Utility;

namespace MedicalAgencyManagement
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static List<Models.GetUser> GetUserList()
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
            bool isAgencyValid = Guid.TryParse(agencyId, out Guid agencyPublicId);
            var result = new List<Models.GetUser>();
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("exec GetUsers '" + agencyPublicId + "'");
                    var totalManufacturer = manufacturerList != null ? manufacturerList.Rows.Count : 0;
                    for (int i = 0; i < totalManufacturer; i++)
                    {
                        var obj = new Models.GetUser
                        {
                            Id = Convert.ToString(manufacturerList.Rows[i][0]),
                            Name = Convert.ToString(manufacturerList.Rows[i][1]),
                            Address = Convert.ToString(manufacturerList.Rows[i][4]),
                            PhoneNo = Convert.ToString(manufacturerList.Rows[i][3]),
                            EmailId = Convert.ToString(manufacturerList.Rows[i][2]),
                            City = Convert.ToString(manufacturerList.Rows[i][5]),
                            Pin = Convert.ToString(manufacturerList.Rows[i][7]),
                            State = Convert.ToString(manufacturerList.Rows[i][6]),
                            IsActive = Convert.ToString(manufacturerList.Rows[i][8]),
                            DeactivationDate = Convert.ToString(manufacturerList.Rows[i][9]),
                            Password = Convert.ToString(manufacturerList.Rows[i][10])
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

        [WebMethod(EnableSession = true)]
        public static Models.GetUser GetUserById(string userId)
        {
            var obj = new Models.GetUser();
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            bool isAgencyValid = Guid.TryParse(agencyId, out Guid agencyPublicId);
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var customerData = DataBaseConnection.Instance.SelectQueryExecuter("exec GetCustomerById '" + agencyPublicId + "','" + userId + "'");
                    if (customerData.Rows.Count > 0)
                    {
                        obj = new Models.GetUser
                        {
                            Id = Convert.ToString(customerData.Rows[0][0]),
                            Name = Convert.ToString(customerData.Rows[0][1]),
                            Address = Convert.ToString(customerData.Rows[0][4]),
                            PhoneNo = Convert.ToString(customerData.Rows[0][3]),
                            EmailId = Convert.ToString(customerData.Rows[0][2]),
                            City = Convert.ToString(customerData.Rows[0][5]),
                            Pin = Convert.ToString(customerData.Rows[0][7]),
                            State = Convert.ToString(customerData.Rows[0][6]),
                            IsActive = Convert.ToString(customerData.Rows[0][8]),
                            DeactivationDate = Convert.ToString(customerData.Rows[0][9]),
                            Password = Convert.ToString(customerData.Rows[0][10])
                        };
                    }
                }
                return obj;
            }
            else
            {
                return obj;
            }
        }

        [WebMethod(EnableSession = true)]
        public static string AddUser(string Name, string EmailId, string PhoneNo, string Address, string City, string State, string Pin)
        {
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            bool isAgencyValid = Guid.TryParse(agencyId, out Guid agencyPublicId);
            string outPut = string.Empty;
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    DataBaseConnection.Instance.SelectQueryExecuter("exec AddUser '"
                        + Name + "','"
                        + EmailId + "','"
                        + Common.CreatePassword(8) + "','"
                        + EmailId + "','"
                        + PhoneNo + "','"
                        + Address + "','"
                        + City + "','"
                        + State + "','"
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

        [WebMethod(EnableSession = true)]
        public static string UpdateUser(string Name, string EmailId, string PhoneNo, string Address, string City, string State, string Pin, string UserId)
        {
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId;
            if (string.IsNullOrEmpty(sessionData))
            {
                return null;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            bool isAgencyValid = Guid.TryParse(agencyId, out Guid agencyPublicId);
            string outPut = string.Empty;
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    DataBaseConnection.Instance.SelectQueryExecuter("exec UpdateUser '"
                        + Name + "','"
                        + EmailId + "','"
                        + PhoneNo + "','"
                        + Address + "','"
                        + City + "','"
                        + State + "','"
                        + Pin + "','"
                        + agencyPublicId + "','"
                        + UserId + "','"
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