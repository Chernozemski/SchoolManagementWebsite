using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Teacher
{
   public class CRUDInfo
    {
       public int Create(Object.TeacherInfo teacher)
       {
           using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
           {
               SqlCommand cmd = new SqlCommand("spAddTeacher_tblTeacherInfo", con);
               cmd.CommandType = CommandType.StoredProcedure;

               cmd.Parameters.AddWithValue("@FirstName", teacher.FirstName);
               cmd.Parameters.AddWithValue("@MiddleName", teacher.MiddleName);
               cmd.Parameters.AddWithValue("@FamilyName", teacher.FamilyName);
               cmd.Parameters.AddWithValue("@SubjectId", teacher.SubjectId);
               cmd.Parameters.AddWithValue("@EGN", teacher.EGN);
               cmd.Parameters.AddWithValue("@PhoneNumber", teacher.PhoneNumber);
               cmd.Parameters.AddWithValue("@Adress", teacher.Adress);
               cmd.Parameters.AddWithValue("@Position", teacher.PositionId);
               cmd.Parameters.AddWithValue("@Photo", teacher.Photo);

               SqlParameter Result = new SqlParameter("@ResultNumber", SqlDbType.Int);
               Result.Direction = ParameterDirection.Output;
               cmd.Parameters.Add(Result);

               con.Open();
               cmd.ExecuteScalar();
               con.Close();

               return (int)Result.Value;
           }
       }
       public DataTable Read(DataTable table)
       {
           using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
           {
               SqlCommand cmd = new SqlCommand("Select * From vwTeacherInfo_tblTeacherInfo", con);
               cmd.CommandType = CommandType.Text;

               con.Open();
               using (SqlDataReader rdr = cmd.ExecuteReader())
               {

                   while (rdr.Read())
                   {
                       DataRow row = table.NewRow();

                       row["FullName"] = rdr["FullName"];
                       row["SubjectName"] = rdr["SubjectName"];
                       row["PhoneNumber"] = rdr["PhoneNumber"];
                       row["Adress"] = rdr["Adress"];
                       row["Position"] = rdr["Position"];
                       row["Photo"] = rdr["Photo"];
                       row["Class"] = rdr["Class"];

                       table.Rows.Add(row);
                   }

                   return table;
               }
           }
       }
       public DataTable ReadWithId(DataTable table)
       {
           using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
           {
               SqlCommand cmd = new SqlCommand("Select * From vwTeacherInfoId_tblTeacherInfo", con);
               cmd.CommandType = CommandType.Text;

               con.Open();
               using (SqlDataReader rdr = cmd.ExecuteReader())
               {
                   while (rdr.Read())
                   {
                       DataRow row = table.NewRow();

                       row["Id"] = rdr["Id"];
                       row["FullName"] = rdr["FullName"];
                       row["SubjectName"] = rdr["SubjectName"];
                       row["PhoneNumber"] = rdr["PhoneNumber"];
                       row["Adress"] = rdr["Adress"];
                       row["Position"] = rdr["Position"];
                       row["Photo"] = rdr["Photo"];
                       row["Class"] = rdr["Class"];

                       table.Rows.Add(row);
                   }

                   return table;
               }
           }
       }
       public DataTable ReadWithSelectId(DataTable table, Object.TeacherInfo teacher)
       {
           using (SqlConnection con = new SqlConnection(DataAccessLayer.SharedMethods.getConnectionString()))
           {
               SqlCommand cmd = new SqlCommand("Select * From vwTeacherInfoNameAndSubjectId_tblTeacherInfo Where SubjectId = @SubjectId", con);
               cmd.CommandType = CommandType.Text;

               cmd.Parameters.AddWithValue("@SubjectId", teacher.Id);
               con.Open();
               using (SqlDataReader rdr = cmd.ExecuteReader())
               {
                   while (rdr.Read())
                   {
                       DataRow row = table.NewRow();

                       row["SubjectName"] = rdr["SubjectName"];
                       row["FullName"] = rdr["FullName"];

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
               SqlCommand cmd = new SqlCommand("Select * From tblTeacherInfo", con);
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
                       row["SubjectId"] = rdr["SubjectId"];
                       row["EGN"] = rdr["EGN"];
                       row["PhoneNumber"] = rdr["PhoneNumber"];
                       row["Adress"] = rdr["Adress"];
                       row["PositionId"] = rdr["PositionId"];
                       row["Photo"] = rdr["Photo"];

                       table.Rows.Add(row);
                   }

                   return table;
               }
           }
       }
       public int Update(Object.TeacherInfo teacher)
       {
           using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
           {
               SqlCommand cmd = new SqlCommand("spUpdateTeacherInfo_tblTeacherInfo",con);
               cmd.CommandType = CommandType.StoredProcedure;

               cmd.Parameters.AddWithValue("@Id",teacher.Id);
               cmd.Parameters.AddWithValue("@FirstName", teacher.FirstName);
               cmd.Parameters.AddWithValue("@MiddleName", teacher.MiddleName);
               cmd.Parameters.AddWithValue("@FamilyName", teacher.FamilyName);
               cmd.Parameters.AddWithValue("@SubjectId", teacher.SubjectId);
               cmd.Parameters.AddWithValue("@EGN", teacher.EGN);
               cmd.Parameters.AddWithValue("@PhoneNumber", teacher.PhoneNumber);
               cmd.Parameters.AddWithValue("@Adress", teacher.Adress);
               cmd.Parameters.AddWithValue("@PositionId", teacher.PositionId);
               cmd.Parameters.AddWithValue("@Photo", teacher.Photo);

               SqlParameter Result = new SqlParameter("@ResultNumber", SqlDbType.Int);
               Result.Direction = ParameterDirection.Output;
               cmd.Parameters.Add(Result);

               con.Open();
               cmd.ExecuteScalar();
               con.Close();

               return (int)Result.Value;
           }
       }
       public int Delete(Object.TeacherInfo teacher)
       {
           using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
           {
               SqlCommand cmd = new SqlCommand("Delete From tblTeacherInfo Where Id = @Id", con);
               cmd.Parameters.AddWithValue("@Id", teacher.Id);

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
