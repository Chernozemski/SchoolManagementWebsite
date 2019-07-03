using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Doctor
{
    public class HelperMethods
    {
        public static int getId(string doctorName)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select IsNull((Select Id From tblDoctor Where FirstName + ' ' + FamilyName = @DoctorFullName),0)",con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@DoctorFullName", doctorName);

                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
    }
}
