using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Teacher
{
    public class HelperMethods
    {
        public int getSessionRank(string username)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
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
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
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
        public string getTeacherEGN(string teacherName)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
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
        public int getTeacherClassId(string EGN)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand command = new SqlCommand("spGetTeacherClassByCheckingEGN_tblTeacherInfo", con);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.Add(new SqlParameter("@EGN", EGN));
                SqlParameter Result = new SqlParameter("@ClassId", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                command.Parameters.Add(Result);

                con.Open();
                command.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
}
}
