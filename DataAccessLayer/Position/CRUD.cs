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
        public DataTable Read()
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id, Position From tblPosition", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    DataTable table = new DataTable();
                    table.Columns.Add("Id");
                    table.Columns.Add("Position");

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Position"] = rdr["Position"];
                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
    }
}
