using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DataAccessLayer.Student
{
    public class Register
    {
        public int register(string studentFirstName,string studentMiddleName,string studentFamilyName,
            string EGN,string studentPhone,string studentAdress,int classId,byte[] photo,
            int doctorId,string parentFullName,string parentPhoneNumber, string parentAdress)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddStudent_tblStudentInfo", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName",studentFirstName);
                cmd.Parameters.AddWithValue("@MiddleName",studentMiddleName);
                cmd.Parameters.AddWithValue("@FamilyName",studentFamilyName);
                cmd.Parameters.AddWithValue("@EGN",EGN);
                cmd.Parameters.AddWithValue("@Phone",studentPhone);
                cmd.Parameters.AddWithValue("@Adress",studentAdress);
                cmd.Parameters.AddWithValue("@ClassId",classId);
                cmd.Parameters.AddWithValue("@Photo",photo);
                cmd.Parameters.AddWithValue("@DoctorId",doctorId);
                cmd.Parameters.AddWithValue("@ParentFullName",parentFullName);
                cmd.Parameters.AddWithValue("@ParentPhoneNumber",parentPhoneNumber);
                cmd.Parameters.AddWithValue("@ParentAdress",parentAdress);

                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
    }
}
