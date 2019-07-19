using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Author
{
    public class CRUD
    {
        public int Create(Object.Author author)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddAuthor_tblAuthor", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Publisher",author.Publisher);

                SqlParameter Result = new SqlParameter("@ResultNumber",DbType.Int32);
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
                SqlCommand cmd = new SqlCommand("Select Id,Publisher From tblAuthor", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Publisher"] = rdr["Publisher"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadWithBookCount(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,Publisher,BookCount From vwAuthorWithBookCount_tblAuthor", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Publisher"] = rdr["Publisher"];
                        row["BookCount"] = rdr["BookCount"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.Author author)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateAuthor_tblAuthor", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", author.Id);
                cmd.Parameters.AddWithValue("@Publisher", author.Publisher);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Author author)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblAuthor Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", author.Id);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }
}
