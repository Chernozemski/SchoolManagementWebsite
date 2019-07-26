using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Class
{
    public class CRUDClassStudent
    {
        public int Create(Object.ClassStudent classStudent)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddStudentInClass_tblStudentInfoInClass", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ClassId", classStudent.ClassId);
                cmd.Parameters.AddWithValue("@StudentInClassId", classStudent.StudentInClassId);
                cmd.Parameters.AddWithValue("@StudentId", classStudent.StudentId);
                cmd.Parameters.AddWithValue("@TimesAbsent", classStudent.TimesAbsent);
                cmd.Parameters.AddWithValue("@TimesExcused ", classStudent.TimesExcused);
                cmd.Parameters.AddWithValue("@TimesLate", classStudent.TimesLate);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadFullByClass(DataTable table,Object.ClassStudent classStudent)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,StudentInClassId,ClassName,ClassId,StudentName,StudentId,TimesAbsent,TimesExcused,TimesLate From vwStudentInfoInClassFull_tblStudentInfoInClass Where ClassId = @ClassId", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@ClassId", classStudent.ClassId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["StudentInClassId"] = rdr["StudentInClassId"];
                        row["ClassName"] = rdr["ClassName"];
                        row["ClassId"] = rdr["ClassId"];
                        row["StudentName"] = rdr["StudentName"];
                        row["StudentId"] = rdr["StudentId"];
                        row["TimesAbsent"] = rdr["TimesAbsent"];
                        row["TimesExcused"] = rdr["TimesExcused"];
                        row["TimesLate"] = rdr["TimesLate"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadFull(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,StudentInClassId,ClassName,ClassId,StudentName,StudentId,TimesAbsent,TimesExcused,TimesLate From vwStudentInfoInClassFull_tblStudentInfoInClass", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["StudentInClassId"] = rdr["StudentInClassId"];
                        row["ClassName"] = rdr["ClassName"];
                        row["ClassId"] = rdr["ClassId"];
                        row["StudentName"] = rdr["StudentName"];
                        row["StudentId"] = rdr["StudentId"];
                        row["TimesAbsent"] = rdr["TimesAbsent"];
                        row["TimesExcused"] = rdr["TimesExcused"];
                        row["TimesLate"] = rdr["TimesLate"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadStudentWithoutClassId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,StudentInClassId,FullName From vwStudentInfoWithClassId_tblStudentInfoInClass Where ClassId is Null", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["StudentInClassId"] = rdr["StudentInClassId"];
                        row["FullName"] = rdr["FullName"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadStudentWithIdByClass(DataTable table, Object.ClassStudent classStudent)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,StudentInClassId,FullName From vwStudentInfoWithId_tblStudentInfo Where ClassId = @ClassId", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@ClassId", classStudent.ClassId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["StudentInClassId"] = rdr["StudentInClassId"];
                        row["FullName"] = rdr["FullName"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadStudentWithClassId(DataTable table, Object.ClassStudent classStudent)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select StudentInClassId,FullName From vwStudentInfoWithId_tblStudentInfo Where ClassId = @ClassId", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@ClassId", classStudent.ClassId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["StudentInClassId"] = rdr["StudentInClassId"];
                        row["FullName"] = rdr["StudentInClassId"].ToString() + " " + rdr["FullName"].ToString();

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }

        public int Update(Object.ClassStudent classStudent)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateStudentInClass_tblStudentInfoInClass", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", classStudent.Id);

                cmd.Parameters.AddWithValue("@ClassId", classStudent.ClassId);
                cmd.Parameters.AddWithValue("@StudentInClassId", classStudent.StudentInClassId);
                cmd.Parameters.AddWithValue("@StudentId", classStudent.StudentId);
                cmd.Parameters.AddWithValue("@TimesAbsent", classStudent.TimesAbsent);
                cmd.Parameters.AddWithValue("@TimesExcused ", classStudent.TimesExcused);
                cmd.Parameters.AddWithValue("@TimesLate", classStudent.TimesLate);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.ClassStudent classStudent)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblStudentInfoInClass Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", classStudent.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }
        }
    }
}
