using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.TimeTable
{
    public class CRUDDay
    {
        public DataTable ReadFull(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,NameDay From tblDay", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["NameDay"] = rdr["NameDay"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
    }
}
