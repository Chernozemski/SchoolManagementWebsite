using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Subject
{
    public class CRUD
    {
        public int Create(Object.Subject subject)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddSubject_tblSubject", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@SubjectName", subject.SubjectName);

                SqlParameter Result = new SqlParameter("@ResultNumber", SqlDbType.Int);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadWithTeacherNumber(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,SubjectName,NumberOfTeachers From vwSubject_tblSubject", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["SubjectName"] = rdr["SubjectName"];
                        row["NumberOfTeachers"] = rdr["NumberOfTeachers"];
                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,SubjectName From tblSubject", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["SubjectName"] = rdr["SubjectName"];
                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.Subject subject)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateSubject_tblSubject", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", subject.Id);
                cmd.Parameters.AddWithValue("@SubjectName", subject.SubjectName);

                SqlParameter Result = new SqlParameter("@ResultNumber", SqlDbType.Int);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Subject subject)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblSubject Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", subject.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }
        }
    }
}
