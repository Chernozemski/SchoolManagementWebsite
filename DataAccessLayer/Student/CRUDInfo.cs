using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
namespace DataAccessLayer.Student
{
    public class CRUDInfo
    {
        public int Create(Object.StudentInfo student)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddStudent_tblStudentInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FirstName", student.FirstName);
                cmd.Parameters.AddWithValue("@MiddleName", student.MiddleName);
                cmd.Parameters.AddWithValue("@FamilyName", student.FamilyName);
                
                cmd.Parameters.AddWithValue("@EGN", student.EGN);
                cmd.Parameters.AddWithValue("@PhoneNumber", student.PhoneNumber);
                cmd.Parameters.AddWithValue("@Adress", student.Adress);
                cmd.Parameters.AddWithValue("@Photo", student.Photo);

                cmd.Parameters.AddWithValue("@ClassId", student.ClassId);
                cmd.Parameters.AddWithValue("@DoctorId", student.DoctorId);

                cmd.Parameters.AddWithValue("@ParentFullname", student.ParentFullName);
                cmd.Parameters.AddWithValue("@ParentPhoneNumber", student.ParentPhoneNumber);
                cmd.Parameters.AddWithValue("@ParentAdress", student.ParentAdress);

                SqlParameter Result = new SqlParameter("@ResultNumber", SqlDbType.Int);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select * From vwStudentInfoWithId_tblStudentInfo", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];

                        row["FullName"] = rdr["FullName"];
                        row["PhoneNumber"] = rdr["PhoneNumber"];
                        row["Adress"] = rdr["Adress"];
                        row["Photo"] = rdr["Photo"];

                        row["Grade"] = rdr["Grade"];
                        row["DoctorFullName"] = rdr["DoctorFullName"];

                        row["ParentFullName"] = rdr["ParentFullName"];
                        row["ParentPhoneNumber"] = rdr["ParentPhoneNumber"];
                        row["ParentAdress"] = rdr["ParentAdress"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public DataTable ReadFull(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select * From vwStudentInfoFull_tblStudentInfo", con);
                cmd.CommandType = CommandType.Text;

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {

                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];

                        row["FirstName"] = rdr["FirstName"];
                        row["MiddleName"] = rdr["MiddleName"];
                        row["FamilyName"] = rdr["FamilyName"];

                        row["PhoneNumber"] = rdr["PhoneNumber"];
                        row["Adress"] = rdr["Adress"];
                        row["EGN"] = rdr["EGN"];
                        row["Photo"] = rdr["Photo"];

                        row["ClassId"] = rdr["ClassId"];
                        row["DoctorId"] = rdr["DoctorId"];
                        row["Grade"] = rdr["Grade"];
                        row["DoctorFullName"] = rdr["DoctorFullName"];

                        row["ParentFullName"] = rdr["ParentFullName"];
                        row["ParentPhoneNumber"] = rdr["ParentPhoneNumber"];
                        row["ParentAdress"] = rdr["ParentAdress"];

                        table.Rows.Add(row);
                    }

                    return table;
                }
            }
        }
        public int Update(Object.StudentInfo student)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateStudentInfo_tblStudentInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", student.Id);
                cmd.Parameters.AddWithValue("@FirstName", student.FirstName);
                cmd.Parameters.AddWithValue("@MiddleName", student.MiddleName);
                cmd.Parameters.AddWithValue("@FamilyName", student.FamilyName);

                cmd.Parameters.AddWithValue("@EGN", student.EGN);
                cmd.Parameters.AddWithValue("@PhoneNumber", student.PhoneNumber);
                cmd.Parameters.AddWithValue("@Adress", student.Adress);
                cmd.Parameters.AddWithValue("@Photo", student.Photo);

                cmd.Parameters.AddWithValue("@ClassId", student.ClassId);
                cmd.Parameters.AddWithValue("@DoctorId", student.DoctorId);

                cmd.Parameters.AddWithValue("@ParentFullname", student.ParentFullName);
                cmd.Parameters.AddWithValue("@ParentPhoneNumber", student.ParentPhoneNumber);
                cmd.Parameters.AddWithValue("@ParentAdress", student.ParentAdress);

                SqlParameter Result = new SqlParameter("@ResultNumber", SqlDbType.Int);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.StudentInfo student)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblStudentInfo Where Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", student.Id);

                SqlParameter Result = new SqlParameter("@ResultNumber", SqlDbType.Int);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteScalar();
                con.Close();

                return (int)Result.Value;
            }
        }
    }
}
