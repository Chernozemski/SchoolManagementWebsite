using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Grade
{
    public class CRUD
    {
        public int Create(Object.Grade grade)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddGrade_tblGrade", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Grade", grade.grade);
                cmd.Parameters.AddWithValue("@ClassId", grade.ClassId);
                cmd.Parameters.AddWithValue("@LessonId", grade.LessonId);
                cmd.Parameters.AddWithValue("@StudentInClassId", grade.StudentId);
                cmd.Parameters.AddWithValue("@TeacherEGN", grade.TeacherEGN);


                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadFull(DataTable table, Object.Grade grade)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,Grade,ClassId,ClassName,LessonId,LessonName,OnDate,StudentInClassId,StudentName,FullTeacherName,TeacherEGN From vwGradeFull_tblGrade Where ClassId = @ClassId", con);

                cmd.Parameters.AddWithValue("@ClassId", grade.ClassId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Grade"] = rdr["Grade"];
                        row["ClassId"] = rdr["ClassId"];
                        row["ClassName"] = rdr["ClassName"];
                        row["LessonId"] = rdr["LessonId"];
                        row["LessonName"] = rdr["LessonName"];
                        row["OnDate"] = rdr["OnDate"];
                        row["StudentInClassId"] = rdr["StudentInClassId"];
                        row["StudentName"] = rdr["StudentName"];
                        row["FullTeacherName"] = rdr["FullTeacherName"];
                        row["TeacherEGN"] = rdr["TeacherEGN"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public DataTable ReadFull(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,Grade,ClassId,ClassName,LessonId,LessonName,OnDate,StudentInClassId,StudentName,FullTeacherName,TeacherEGN From vwGradeFull_tblGrade", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["Grade"] = rdr["Grade"];
                        row["ClassId"] = rdr["ClassId"];
                        row["ClassName"] = rdr["ClassName"];
                        row["LessonId"] = rdr["LessonId"];
                        row["LessonName"] = rdr["LessonName"];
                        row["OnDate"] = rdr["OnDate"];
                        row["StudentInClassId"] = rdr["StudentInClassId"];
                        row["StudentName"] = rdr["StudentName"];
                        row["FullTeacherName"] = rdr["FullTeacherName"];
                        row["TeacherEGN"] = rdr["TeacherEGN"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public int Update(Object.Grade grade)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateGrade_tblGrade", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", grade.Id);
                cmd.Parameters.AddWithValue("@Grade", grade.grade);
                cmd.Parameters.AddWithValue("@ClassId", grade.ClassId);
                cmd.Parameters.AddWithValue("@LessonId", grade.LessonId);
                cmd.Parameters.AddWithValue("@StudentInClassId", grade.StudentId);
                cmd.Parameters.AddWithValue("@TeacherEGN", grade.TeacherEGN);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Grade grade)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblGrade Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", grade.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }
        }
    }
}
