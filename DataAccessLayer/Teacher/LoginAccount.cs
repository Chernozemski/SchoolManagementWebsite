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
    public class LoginAccount
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;
        public int Login(string username, string encryptedpassword)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("spLoginTeacher_tblTeacherAccount", con);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@UserName", username));
                command.Parameters.Add(new SqlParameter("@Password", encryptedpassword));

                con.Open();
                int result = (int)command.ExecuteScalar();
                con.Close();

                return result;
            }
        }
        public int getSessionRank(string username)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                int sessionRank;
                SqlCommand command = new SqlCommand("spGetTeacherPositionId_tblTeacherAccount", con);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@UserName", username));

                con.Open();
                sessionRank = (int)command.ExecuteScalar();
                con.Close();

                return sessionRank;
            }
        }
        public string getEGN(string username)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string EGN;
                SqlCommand command = new SqlCommand("spGetEGNByUserName_tblTeacherInfo", con);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add(new SqlParameter("@UserName", username));


                con.Open();
                EGN = command.ExecuteScalar().ToString();
                con.Close();

                return EGN;
            }
        }
    }
}
