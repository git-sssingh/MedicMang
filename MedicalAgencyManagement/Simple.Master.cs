using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalAgencyManagement
{
    public partial class Simple : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["MediMangUser"] == null)
                {
                    Response.Redirect("/");
                }
                else {
                    var sessionData = Convert.ToString(Session["MediMangUser"]);
                    userName.Text = sessionData.Split(',')[0];
                    name.Text = userName.Text;
                }
            }
        }
    }
}