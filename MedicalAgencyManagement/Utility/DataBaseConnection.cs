using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MedicalAgencyManagement.Utility
{
    public class DataBaseConnection
    {
        private static string _connectingString;
        private static DataBaseConnection _instance;
        private static readonly object Lock = new object();
        private DataBaseConnection() { }
        public static DataBaseConnection Instance
        {
            get
            {
                lock (Lock)
                {
                    if (_instance == null)
                    {
                        _instance = new DataBaseConnection();
                        _connectingString = ConfigurationManager.ConnectionStrings["mediMangConnectionString"].ConnectionString;
                    }
                    return _instance;
                }
            }
        }
        
        public string GetConnectionString() {
            return _connectingString;
        }
        /// <summary>
        /// This return DataTable for any query written
        /// </summary>
        /// <param name="selectQuery"></param>
        /// <returns></returns>
        public DataTable SelectQueryExecuter(string selectQuery)
        {
            try
            {
                using (var con = new SqlConnection(_connectingString))
                {
                    var cmd = new SqlCommand(selectQuery, con);
                    var sda = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    sda.Fill(dt);
                    return dt;
                }
            }
            catch (Exception ex)
            {
                ExceptionLoggerToDataBase(ex);
                return new DataTable();
            }
        }

        public DataSet SelectSetQueryExecuter(string selectQuery)
        {
            try
            {
                using (var con = new SqlConnection(_connectingString))
                {
                    var cmd = new SqlCommand(selectQuery, con);
                    var sda = new SqlDataAdapter(cmd);
                    var ds = new DataSet();
                    sda.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                ExceptionLoggerToDataBase(ex);
                return new DataSet();
            }

        }

        /// <summary>
        /// Logging error to Database
        /// </summary>
        /// <param name="ex"></param>
        public void ExceptionLoggerToDataBase(Exception ex)
        {
            using (var con = new SqlConnection(_connectingString))
            {
                var cmd = new SqlCommand("ExceptionLoggingToDataBase", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                var exepurl = HttpContext.Current.Request.Url.ToString();
                cmd.Parameters.AddWithValue("@ExceptionMsg", ex.Message);
                cmd.Parameters.AddWithValue("@ExceptionType", ex.GetType().Name);
                cmd.Parameters.AddWithValue("@ExceptionURL", exepurl);
                cmd.Parameters.AddWithValue("@ExceptionSource", ex.StackTrace);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}