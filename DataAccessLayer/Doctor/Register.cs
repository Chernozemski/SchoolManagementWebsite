using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Doctor
{
    public class Register
    {
        public int register(string firstName, string familyName, string phoneNumber)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddDoctor_tblDoctor",con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@FamilyName", familyName);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
    }
}
