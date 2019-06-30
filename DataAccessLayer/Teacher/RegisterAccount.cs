using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Security;
using System.Data;

namespace DataAccessLayer.Teacher
{
    public class RegisterAccount
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;
        public int Register(string username, string encryptedPassword, string EGN)
        {
            int result;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spCreateTeacherAccount_tblTeacherAccount", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter userName = new SqlParameter("@UserName", username);
                SqlParameter password = new SqlParameter("@Password", encryptedPassword);
                SqlParameter egn = new SqlParameter("@EGN", EGN);

                cmd.Parameters.Add(userName);
                cmd.Parameters.Add(password);
                cmd.Parameters.Add(egn);

                con.Open();
                result = (int)cmd.ExecuteScalar();
                con.Close();
            }
            return result;
        }
    }
}
