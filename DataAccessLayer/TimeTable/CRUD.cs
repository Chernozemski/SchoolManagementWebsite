using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.TimeTable
{
    public class CRUD
    {
        public int Create(Object.TimeTable timeTable)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spAddTimeTable_tblTimeTable", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@LessonHour", timeTable.LessonHour);
                cmd.Parameters.AddWithValue("@LessonTime", timeTable.LessonTime);
                cmd.Parameters.AddWithValue("@ShiftType", timeTable.ShiftType);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        
        public DataTable ReadWithId(DataTable table)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,LessonHour From vwTimeTableWithId_tblTimeTable", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["LessonHour"] = rdr["LessonHour"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public DataTable ReadWithIdByClass(DataTable table,Object.Programme programme)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Select Id,LessonHour From vwTimeTableWithIdByClass_tblTimeTable Where ClassId = @ClassId And DayId=@DayId", con);

                cmd.Parameters.AddWithValue("@ClassId", programme.ClassId);
                cmd.Parameters.AddWithValue("@DayId", programme.DayId);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["LessonHour"] = rdr["LessonHour"];

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
                SqlCommand cmd = new SqlCommand("Select Id,LessonHour,LessonTime,ShiftName,ShiftType From vwTimeTableFull_tblTimeTable", con);

                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        DataRow row = table.NewRow();

                        row["Id"] = rdr["Id"];
                        row["LessonHour"] = rdr["LessonHour"];
                        row["LessonTime"] = rdr["LessonTime"];
                        row["ShiftName"] = rdr["ShiftName"];
                        row["ShiftType"] = rdr["ShiftType"];

                        table.Rows.Add(row);
                    }
                }
                con.Close();
                return table;
            }
        }
        public int Update(Object.TimeTable timeTable)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("spUpdateTimeTable_tblTimeTable", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Id", timeTable.Id);
                cmd.Parameters.AddWithValue("@LessonHour", timeTable.LessonHour);
                cmd.Parameters.AddWithValue("@LessonTime", timeTable.LessonTime);
                cmd.Parameters.AddWithValue("@ShiftType", timeTable.ShiftType);

                SqlParameter Result = new SqlParameter("@ResultNumber", DbType.Int32);
                Result.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(Result);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                return (int)Result.Value;
            }
        }
        public int Delete(Object.TimeTable timeTable)
        {
            using (SqlConnection con = new SqlConnection(SharedMethods.getConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("Delete From tblTimeTable Where Id = @Id", con);
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@Id", timeTable.Id);

                con.Open();
                return (int)cmd.ExecuteNonQuery();
            }
        }
    }
}
