using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Lesson
{
    public class CRUD
    {
        public int Create(Object.Lesson lesson,Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddLesson_tblLesson", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ProgrammeId", lesson.ProgrammeId);
                cmd.Parameters.AddWithValue("@LessonName", lesson.LessonName);
                cmd.Parameters.AddWithValue("@OnDate", lesson.OnDate);
                cmd.Parameters.AddWithValue("@TeacherEGN", lesson.TeacherEGN);
                cmd.Parameters.AddWithValue("@MissingStudentId", lesson.MissingStudentId);
                cmd.Parameters.AddWithValue("@LateStudentId", lesson.LateStudentId);
                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);


                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadTodayLesson(DataTable table,Object.Lesson lesson,Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select a.Id,LessonName from tblLesson a Left Join tblProgramme b On a.ProgrammeId = b.Id Where DateDiff(day,OnDate,@OnDate) = 0 And ClassId = @ClassId", con);

                cmd.Parameters.AddWithValue("@OnDate", lesson.OnDate);
                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["LessonName"] = rdr["LessonName"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public DataTable ReadFullWithoutClass(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select * from vwLessonFull_tblLesson", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["LessonName"] = rdr["LessonName"];
                        row["OnDate"] = rdr["OnDate"];
                        row["TeacherEGN"] = rdr["TeacherEGN"];
                        row["MissingStudentId"] = rdr["MissingStudentId"];
                        row["LateStudentId"] = rdr["LateStudentId"];
                        row["ProgrammeId"] = rdr["ProgrammeId"];
                        row["ClassName"] = rdr["ClassName"];
                        row["ClassId"] = rdr["ClassId"];
                        row["NameDay"] = rdr["NameDay"];
                        row["LessonHour"] = rdr["LessonHour"];
                        row["SubjectName"] = rdr["SubjectName"];
                        row["SubjectId"] = rdr["SubjectId"];
                        row["TeacherFullName"] = rdr["TeacherFullName"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public DataTable ReadFull(DataTable table, Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select * from vwLessonFull_tblLesson Where ClassId = @ClassId", con);

                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["LessonName"] = rdr["LessonName"];
                        row["OnDate"] = rdr["OnDate"];
                        row["TeacherEGN"] = rdr["TeacherEGN"];
                        row["MissingStudentId"] = rdr["MissingStudentId"];
                        row["LateStudentId"] = rdr["LateStudentId"];
                        row["ProgrammeId"] = rdr["ProgrammeId"];
                        row["ClassName"] = rdr["ClassName"];
                        row["ClassId"] = rdr["ClassId"];
                        row["NameDay"] = rdr["NameDay"];
                        row["LessonHour"] = rdr["LessonHour"];
                        row["SubjectName"] = rdr["SubjectName"];
                        row["SubjectId"] = rdr["SubjectId"];
                        row["TeacherFullName"] = rdr["TeacherFullName"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public int Update(Object.Lesson lesson)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateLesson_tblLesson", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", lesson.Id);
                cmd.Parameters.AddWithValue("@ProgrammeId", lesson.ProgrammeId);
                cmd.Parameters.AddWithValue("@LessonName", lesson.LessonName);
                cmd.Parameters.AddWithValue("@OnDate", lesson.OnDate);
                cmd.Parameters.AddWithValue("@TeacherEGN", lesson.TeacherEGN);
                cmd.Parameters.AddWithValue("@MissingStudentId", lesson.MissingStudentId);
                cmd.Parameters.AddWithValue("@LateStudentId", lesson.LateStudentId);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Lesson lesson,Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spDeleteLesson_tblLesson", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", lesson.Id);
                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
    }
}
