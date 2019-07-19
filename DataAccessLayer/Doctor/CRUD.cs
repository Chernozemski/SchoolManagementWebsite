using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Doctor
{
    public class CRUD
    {
        public int Create(Object.Doctor doctor)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddDoctor_tblDoctor", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName", doctor.FirstName);
                cmd.Parameters.AddWithValue("@FamilyName", doctor.FamilyName);
                cmd.Parameters.AddWithValue("@PhoneNumber", doctor.PhoneNumber);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select * From vwDoctorWithId_tblDoctor", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["FullDoctorName"] = rdr["FullDoctorName"];

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
                SqlCommand cmd = new SqlCommand("Select * From vwDoctorFull_tblDoctor", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["FirstName"] = rdr["FirstName"];
                        row["FamilyName"] = rdr["FamilyName"];
                        row["PhoneNumber"] = rdr["PhoneNumber"];

                        table.Rows.Add(row);
                    }
                    return table;
                }
            }
        }
        public int Update(Object.Doctor doctor)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateDoctor_tblDoctor",con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id",doctor.Id);
                cmd.Parameters.AddWithValue("@FirstName",doctor.FirstName);
                cmd.Parameters.AddWithValue("@FamilyName",doctor.FamilyName);
                cmd.Parameters.AddWithValue("@PhoneNumber",doctor.PhoneNumber);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }

        public int Delete(Object.Doctor doctor)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblDoctor Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", doctor.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }

        }
    }
}
