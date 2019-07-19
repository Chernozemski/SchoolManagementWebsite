using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Specialization
{
    public class CRUD
    {
        public int Create(Object.Specialization specialization)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddSpecialization_tblSpecialization", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", specialization.Id);
                cmd.Parameters.AddWithValue("@Specialization", specialization.Name);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;

                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();

                return (int)Result.Value;
            }
        }
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,Specialization From tblSpecialization", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Specialization"] = rdr["Specialization"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadWithClassesCount(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,Specialization,NumberOfClasses From vwSpecializationWithClassCount_tblSpecialization", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Specialization"] = rdr["Specialization"];
                        row["NumberOfClasses"] = rdr["NumberOfClasses"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.Specialization specialization)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateSpecialization_tblSpecialization", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Specialization", specialization.Name);
                cmd.Parameters.AddWithValue("@Id", specialization.Id);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;

                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Specialization specialization)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spDeleteSpecialization_tblSpecialization", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", specialization.Id);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;

                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();

                return (int)Result.Value;
            }
        }
    }
}
