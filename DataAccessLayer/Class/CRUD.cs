using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Class
{
    public class CRUD
    {
        public int Create(Object.Class Class)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddClass_tblClass", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ClassGrade", Class.Grade);
                cmd.Parameters.AddWithValue("@ClassLetter", Class.Letter);
                cmd.Parameters.AddWithValue("@SpecializationId", Class.SpecializationId);
                cmd.Parameters.AddWithValue("@ClassTeacherEGN", Class.ClassTeacherEGN);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,FullClassName From vwClassWithId_tblClass", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["FullClassName"] = rdr["FullClassName"];

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
                SqlCommand cmd = new SqlCommand("Select Id,Grade,Letter,SpecializationId,Specialization,ClassTeacherEGN,FullTeacherName From vwClassFull_tblClass", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Grade"] = rdr["Grade"];
                        row["Letter"] = rdr["Letter"];
                        row["SpecializationId"] = rdr["SpecializationId"];
                        row["Specialization"] = rdr["Specialization"];
                        row["ClassTeacherEGN"] = rdr["ClassTeacherEGN"];
                        row["FullTeacherName"] = rdr["FullTeacherName"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadWithSelectedId(DataTable table,Object.Specialization specialization)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Grade,Letter From tblClass Where SpecializationId = @SpecializationId", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@SpecializationId", specialization.Id);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Grade"] = rdr["Grade"];
                        row["Letter"] = rdr["Letter"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.Class Class)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateClass_tblClass", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", Class.Id);
                cmd.Parameters.AddWithValue("@Grade", Class.Grade);
                cmd.Parameters.AddWithValue("@Letter", Class.Letter);
                cmd.Parameters.AddWithValue("@SpecializationId", Class.SpecializationId);
                cmd.Parameters.AddWithValue("@ClassTeacherEGN", Class.ClassTeacherEGN);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Class Class)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblClass Where Id = @Id",con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", Class.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }
        }
    }
}
