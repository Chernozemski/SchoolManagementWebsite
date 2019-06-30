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
    public class Absent
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;
        public int absent(string SenderEGN, int SenderRank, string AbsentTeacherEGN,
            string lessonsAbsent, DateTime onDate, string substituteTeacherEGN)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spAddAbsentTeacher_tblTeacherAbsence", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@SenderEGN", SenderEGN);
                cmd.Parameters.AddWithValue("@SenderRank", SenderRank);
                cmd.Parameters.AddWithValue("@AbsentTeacherEGN", AbsentTeacherEGN);
                cmd.Parameters.AddWithValue("@LessonsAbsent", lessonsAbsent);
                cmd.Parameters.AddWithValue("@OnDate", onDate);
                cmd.Parameters.AddWithValue("@SubstituteTeacherEGN", substituteTeacherEGN);

                con.Open();
                int result = (int)cmd.ExecuteScalar();
                con.Close();
                return result;
            }
        }
        public string getTeacherEGN(string teacherName)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetTeacherEGNByFullName_tblTeacherInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TeacherName", teacherName);

                con.Open();
                string result = cmd.ExecuteScalar().ToString();
                con.Close();
                return result;
            }
        }
    }
}
