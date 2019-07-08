using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Author
{
    public class Register
    {
        public int register(string publisherName)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddAuthor_tblAuthor", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Name", publisherName);

                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
    }
}
