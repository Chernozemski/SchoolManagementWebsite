using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;

namespace DataAccessLayer.TimeTable
{
    public class CRUDShift
    {
        public DataTable ReadFull(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select ShiftType,ShiftName From tblShift", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["ShiftType"] = rdr["ShiftType"];
                        row["ShiftName"] = rdr["ShiftName"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
    }
}
