using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalAgencyManagement
{
    public partial class _default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (Session["MediMangUser"] != null)
                {
                    Response.Redirect("/dashboard.aspx");
                }
            }
        }

        protected void SignInButton_Click(object sender, EventArgs e)
        {
            if(Username.Text != null && Password.Text != null) {
                var query = "exec GetUserData '"+Username.Text+"','"+Password.Text+"' ";
                var data = DataBaseConnection.Instance.SelectQueryExecuter(query);
                if (data != null && data.Rows.Count > 0) {
                    Session["MediMangUser"] = data.Rows[0][0] + "," + data.Rows[0][1] + "," + data.Rows[0][2] + "," + data.Rows[0][3];
                    Response.Redirect("/dashboard.aspx");
                }
            }
        }
    }
}