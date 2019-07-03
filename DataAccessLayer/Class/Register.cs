using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer.Class
{
    public class Register
    {
        public string getEGN(string FullTeacherName)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spGetTeacherEGNByFullName_tblTeacherInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TeacherName", FullTeacherName);

                con.Open();
                string result = cmd.ExecuteScalar().ToString();
                con.Close();

                return result;
            }
        }
        public int register(int grade, char letter, int specializationId, string teacherEGN)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spCreateClass_tblClass", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ClassGrade", grade);
                cmd.Parameters.AddWithValue("@ClassLetter", letter);
                cmd.Parameters.AddWithValue("@SpecializationId", specializationId);
                cmd.Parameters.AddWithValue("@ClassTeacherEGN", teacherEGN);

                con.Open();
                int result = (int)cmd.ExecuteScalar();
                con.Close();

                return result;
            }
        }     
    }
}
