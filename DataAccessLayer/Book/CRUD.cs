using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Book
{
    public class CRUD
    {
        public int Create(Object.Book book)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddBook_tblBook", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", book.Name);
                cmd.Parameters.AddWithValue("@PublisherId", book.PublisherId);
                cmd.Parameters.AddWithValue("@Grade", book.Grade);
                cmd.Parameters.AddWithValue("@SubjectId", book.SubjectId);
                cmd.Parameters.AddWithValue("@PublishedYear", book.PublishedYear);
                cmd.Parameters.AddWithValue("@Quantity", book.Quantity);

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
                SqlCommand cmd = new SqlCommand("Select Id,Name,Publisher,Grade,SubjectName From vwBook_tblBook", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Name"] = rdr["Name"];
                        row["Publisher"] = rdr["Publisher"];
                        row["Grade"] = rdr["Grade"];
                        row["SubjectName"] = rdr["SubjectName"];

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
                SqlCommand cmd = new SqlCommand("Select Id,Name,PublisherId,Publisher,Grade,SubjectId,SubjectName,PublishedYear,Quantity From vwBookFull_tblBook", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Name"] = rdr["Name"];
                        row["PublisherId"] = rdr["PublisherId"];
                        row["Publisher"] = rdr["Publisher"];
                        row["Grade"] = rdr["Grade"];
                        row["SubjectId"] = rdr["SubjectId"];
                        row["SubjectName"] = rdr["SubjectName"];
                        row["PublishedYear"] = rdr["PublishedYear"];
                        row["Quantity"] = rdr["Quantity"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.Book book)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateBook_tblBook", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", book.Id);
                cmd.Parameters.AddWithValue("@Name", book.Name);
                cmd.Parameters.AddWithValue("@Grade", book.Grade);
                cmd.Parameters.AddWithValue("@PublisherId", book.PublisherId);
                cmd.Parameters.AddWithValue("@SubjectId", book.SubjectId);
                cmd.Parameters.AddWithValue("@PublishedYear", book.PublishedYear);
                cmd.Parameters.AddWithValue("@Quantity", book.Quantity);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Book book)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblBook Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", book.Id);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }
}
