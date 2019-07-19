using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace DataAccessLayer.Position
{
    public class CRUD
    {
        public int Create(Object.Position position)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddPosition_tblPosition", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Position", position.Name);
                cmd.Parameters.AddWithValue("@Salary", position.Salary);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable Read(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id, Position,Salary From tblPosition", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Position"] = rdr["Position"];
                        row["Salary"] = rdr["Salary"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadWithStaffCount(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,Position,Salary,StaffCount From vwPositionWithStaffCount_tblPosition", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Position"] = rdr["Position"];
                        row["Salary"] = rdr["Salary"];
                        row["StaffCount"] = rdr["StaffCount"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.Position position)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdatePosition_tblPosition", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", position.Id);
                cmd.Parameters.AddWithValue("@Position", position.Name);
                cmd.Parameters.AddWithValue("@Salary", position.Salary);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Position position)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblPosition Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", position.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }
        }
    }
}
