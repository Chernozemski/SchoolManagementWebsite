using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Programme
{
    public class CRUD
    {
        public int Create(Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddProgramme_tblProgramme",con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);
                cmd.Parameters.AddWithValue("@DayId", programme.DayId);
                cmd.Parameters.AddWithValue("@HourId", programme.HourId);
                cmd.Parameters.AddWithValue("@SubjectId", programme.SubjectId);
                cmd.Parameters.AddWithValue("@RoomId", programme.RoomId);
                cmd.Parameters.AddWithValue("@TeacherEGN", programme.TeacherEGN);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public DataTable ReadFull(DataTable table,Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,ClassName,ClassId,NameDay,DayId,LessonHour,HourId,SubjectName,SubjectId,RoomId,TeacherFullName,TeacherEGN From vwProgrammeFull_tblProgramme Where ClassId = @ClassId", con);

                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();
                        row["Id"] = rdr["Id"];
                        row["ClassName"] = rdr["ClassName"];
                        row["ClassId"] = rdr["ClassId"];
                        row["NameDay"] = rdr["NameDay"];
                        row["DayId"] = rdr["DayId"];
                        row["LessonHour"] = rdr["LessonHour"];
                        row["HourId"] = rdr["HourId"];
                        row["SubjectName"] = rdr["SubjectName"];
                        row["SubjectId"] = rdr["SubjectId"];
                        row["RoomId"] = rdr["RoomId"];
                        row["TeacherFullName"] = rdr["TeacherFullName"];
                        row["TeacherEGN"] = rdr["TeacherEGN"];

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
                SqlCommand cmd = new SqlCommand("Select Id,ClassName,ClassId,NameDay,DayId,LessonHour,HourId,SubjectName,SubjectId,RoomId,TeacherFullName,TeacherEGN From vwProgrammeFull_tblProgramme", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();
                        row["Id"] = rdr["Id"];
                        row["ClassName"] = rdr["ClassName"];
                        row["ClassId"] = rdr["ClassId"];
                        row["NameDay"] = rdr["NameDay"];
                        row["DayId"] = rdr["DayId"];
                        row["LessonHour"] = rdr["LessonHour"];
                        row["HourId"] = rdr["HourId"];
                        row["SubjectName"] = rdr["SubjectName"];
                        row["SubjectId"] = rdr["SubjectId"];
                        row["RoomId"] = rdr["RoomId"];
                        row["TeacherFullName"] = rdr["TeacherFullName"];
                        row["TeacherEGN"] = rdr["TeacherEGN"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,ClassName,NameDay,LessonHour From vwProgrammeFull_tblProgramme", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();
                        row["Id"] = rdr["Id"];
                        row["Programme"] = "Клас :" + rdr["ClassName"].ToString() + "\n Ден:" + rdr["NameDay"] + "\n Час : " + rdr["LessonHour"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public int GetProgrammeId(Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id From tblProgramme Where ClassId = @ClassId And DayId = @DayId And HourId = @HourId", con);

                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);
                cmd.Parameters.AddWithValue("@DayId", programme.DayId);
                cmd.Parameters.AddWithValue("@HourId", programme.HourId);

                con.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
        public int Update(Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateProgramme_tblProgramme", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", programme.Id);
                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);
                cmd.Parameters.AddWithValue("@DayId", programme.DayId);
                cmd.Parameters.AddWithValue("@HourId", programme.HourId);
                cmd.Parameters.AddWithValue("@SubjectId", programme.SubjectId);
                cmd.Parameters.AddWithValue("@RoomId", programme.RoomId);
                cmd.Parameters.AddWithValue("@TeacherEGN", programme.TeacherEGN);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblProgramme Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", programme.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }
        }
    }
}
