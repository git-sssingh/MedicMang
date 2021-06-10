using MedicalAgencyManagement.Models;
using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalAgencyManagement
{
    public partial class Billing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static void AddBilling(List<BillingModel> data)
        {
            
            //var data = new List<BillingModel>();
            var sessionData = Convert.ToString(HttpContext.Current.Session["MediMangUser"]);
            string agencyId = string.Empty;
            if (string.IsNullOrEmpty(sessionData))
            {
                return ;
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
                    DataTable dt = new DataTable();
                    dt.Columns.Add("ServiceDetail");
                    dt.Columns.Add("Quantity");
                    dt.Columns.Add("Price");
                    dt.Columns.Add("Comment");
                    DataRow dr = null;
                    string customerId = string.Empty;
                    string brandId = string.Empty;
                    string vehicleNumber = string.Empty;
                    int vtype = 0;
                    
                    foreach (var item in data)
                    {
                        customerId = item.CustomerId;
                        brandId = item.VehicleBrandId;
                        vehicleNumber = item.VehicleNo;
                        dr = dt.NewRow();
                        dr["ServiceDetail"] = item.CustomInfo;
                        dr["Quantity"] = item.Quantity;
                        dr["Price"] = item.Price;
                        dr["Comment"] = item.Comment;
                        dt.Rows.Add(dr);
                        if (item.VehicleType == "Three Wheeler")
                        {
                            vtype = 1;
                        }
                        if (item.VehicleType == "Four Wheeler")
                        {
                            vtype = 2;
                        }
                        if (item.VehicleType == "Heavy Vehicle")
                        {
                            vtype = 3;
                        }
                    }

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mediMangConnectionString"].ConnectionString))
                    {
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.CommandText = "dbo.AddServicing";
                        cmd.Parameters.AddWithValue("@vehicleNo", vehicleNumber);
                        cmd.Parameters.AddWithValue("@brandDetail", brandId);
                        cmd.Parameters.AddWithValue("@userId", "376B5EAE-6705-4FF4-B152-E8EC6F0E260D");
                        cmd.Parameters.AddWithValue("@customerId", customerId);
                        cmd.Parameters.AddWithValue("@vehicleType", vtype);
                        cmd.Parameters.AddWithValue("@serviceingData", dt);
                        cmd.Parameters.AddWithValue("@Agencyid", agencyPublicId);
                        cmd.Parameters.AddWithValue("@msg", "");
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close(); 
                    }
                }
            }
        }

        [WebMethod(EnableSession = true)]
        public static List<Models.VehicleBrand> GetBrands()
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
            var result = new List<Models.VehicleBrand>();
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("select BrandName, PublicId from VehicleBrand");
                    var totalManufacturer = manufacturerList != null ? manufacturerList.Rows.Count : 0;
                    for (int i = 0; i < totalManufacturer; i++)
                    {
                        var obj = new Models.VehicleBrand
                        {
                            Id = Convert.ToString(manufacturerList.Rows[i][1]),
                            BrandName = Convert.ToString(manufacturerList.Rows[i][0])
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
        public static List<Models.VehicleBrand> GetModels(string brandId)
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
            var result = new List<Models.VehicleBrand>();
            if (isAgencyValid)
            {
                if (DataBaseConnection.Instance != null)
                {
                    var manufacturerList = DataBaseConnection.Instance.SelectQueryExecuter("exec GetModels '" + brandId + "'");
                    var totalManufacturer = manufacturerList != null ? manufacturerList.Rows.Count : 0;
                    for (int i = 0; i < totalManufacturer; i++)
                    {
                        var obj = new Models.VehicleBrand
                        {
                            Id = brandId,
                            BrandName = Convert.ToString(manufacturerList.Rows[i][0])
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