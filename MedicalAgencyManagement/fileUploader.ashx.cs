using MedicalAgencyManagement.Utility;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace MedicalAgencyManagement
{
    /// <summary>
    /// Summary description for fileUploader
    /// </summary>
    public class fileUploader : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            var sessionData = Convert.ToString(context.Session["MediMangUser"]);
            string agencyId = string.Empty;
            if (string.IsNullOrEmpty(sessionData))
            {
                return;
            }
            else
            {
                agencyId = sessionData.Split(',')[2];
            }
            Guid agencyPublicId;
            bool isAgencyValid = Guid.TryParse(agencyId, out agencyPublicId);
            context.Response.ContentType = "text/plain";
            try
            {
                string dirFullPath = HttpContext.Current.Server.MapPath("~/MediaUploader/");
                string[] files;
                int numFiles;
                files = Directory.GetFiles(dirFullPath);
                numFiles = files.Length;
                numFiles = numFiles + 1;
                string str_image = "";

                foreach (string s in context.Request.Files)
                {
                    HttpPostedFile file = context.Request.Files[s];
                    string fileName = file.FileName;
                    string fileExtension = file.ContentType;

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        fileExtension = Path.GetExtension(fileName);
                        if (fileExtension != ".jpg" || fileExtension != ".png" || fileExtension != ".jpeg")
                        {

                            str_image = "AgencyLogo_" + numFiles.ToString() + fileExtension;
                            string pathToSave_100 = HttpContext.Current.Server.MapPath("~/MediaUploader/") + str_image;
                            file.SaveAs(pathToSave_100);
                            string updateQuery = "update dbo.Agency Set logo ='" + str_image + "' where publicId='" + agencyPublicId + "'";
                            var settings = DataBaseConnection.Instance.SelectQueryExecuter(updateQuery);
                        }
                        else {
                            return;
                        }
                    }
                }
                context.Response.Write(str_image);
            }
            catch (Exception)
            {

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}