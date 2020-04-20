using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;

namespace MedicalAgencyManagement
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        public static List<Models.GetCustomer> GetCustomerList()
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
            var result = new List<Models.GetCustomer>();
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("exec GetCustomers '" + agencyPublicId + "'");
                    var totalManufacturer = manufacturerList != null ? manufacturerList.Rows.Count : 0;
                    for (int i = 0; i < totalManufacturer; i++)
                    {
                        var obj = new Models.GetCustomer
                        {
                            Id = Convert.ToString(manufacturerList.Rows[i][0]),
                            Name = Convert.ToString(manufacturerList.Rows[i][1]),
                            Address = Convert.ToString(manufacturerList.Rows[i][4]),
                            PhoneNo = Convert.ToString(manufacturerList.Rows[i][3]),
                            EmailId = Convert.ToString(manufacturerList.Rows[i][2]),
                            City = Convert.ToString(manufacturerList.Rows[i][5]),
                            Pin = Convert.ToString(manufacturerList.Rows[i][7]),
                            State = Convert.ToString(manufacturerList.Rows[i][6]),
                            CreateDate = Convert.ToString(manufacturerList.Rows[i][8])
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
        public static Models.GetCustomer GetCustomerById(string cutomerId)
        {
            var obj = new Models.GetCustomer();
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
                if (DataBaseConnection.Instance != null)
                {
                    var customerData = DataBaseConnection.Instance.SelectQueryExecuter("exec GetCustomerById '" + agencyPublicId + "','" + cutomerId + "'");
                    if (customerData.Rows.Count > 0)
                    {
                        obj = new Models.GetCustomer
                        {
                            Id = Convert.ToString(customerData.Rows[0][0]),
                            Name = Convert.ToString(customerData.Rows[0][1]),
                            Address = Convert.ToString(customerData.Rows[0][4]),
                            PhoneNo = Convert.ToString(customerData.Rows[0][3]),
                            EmailId = Convert.ToString(customerData.Rows[0][2]),
                            City = Convert.ToString(customerData.Rows[0][5]),
                            Pin = Convert.ToString(customerData.Rows[0][7]),
                            State = Convert.ToString(customerData.Rows[0][6]),
                            CreateDate = Convert.ToString(customerData.Rows[0][8])
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
        public static string AddCustomer(string Name, string EmailId,string PhoneNo, string Address,string City,string State,string Pin)
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
                    DataBaseConnection.Instance.SelectQueryExecuter("exec AddCustomer '" 
                        + Name + "','" 
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
    }
}