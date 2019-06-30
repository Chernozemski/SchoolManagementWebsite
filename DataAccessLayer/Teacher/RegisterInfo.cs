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
    public class RegisterInfo
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;

        public int register(string firstName,string middleName, string familyName,
            string subjectId, string EGN, string phoneNumber, string adress,
            string positionId,byte[] image = null)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spAddTeacher_tblTeacherInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@MiddleName", middleName);
                cmd.Parameters.AddWithValue("@FamilyName", familyName);
                cmd.Parameters.AddWithValue("@SubjectId", subjectId);
                cmd.Parameters.AddWithValue("@EGN", EGN);
                cmd.Parameters.AddWithValue("@Phonenum", phoneNumber);
                cmd.Parameters.AddWithValue("@Adress", adress);
                cmd.Parameters.AddWithValue("@Position", positionId);
                cmd.Parameters.AddWithValue("@Photo", image);

                con.Open();
                int result = (int)cmd.ExecuteScalar();
                con.Close();
                return result;
            }
        }
    }
}
