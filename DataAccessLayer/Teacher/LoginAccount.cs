using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Security;
using System.Data;

namespace DataAccessLayer.Teacher
{
    public class LoginAccount
    {
        public int Login(string username, string encryptedpassword)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
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
    }
}
