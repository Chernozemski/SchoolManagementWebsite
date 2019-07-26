using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.TimeTable
{
    public class CRUD
    {
        DataAccessLayer.TimeTable.CRUD crud = new DataAccessLayer.TimeTable.CRUD();
        Message message = new Message();
        public void Create(int LessonHour,DateTime LessonTime, int ShiftType, out string Message, out System.Drawing.Color Color)
        {
            Object.TimeTable timeTable = new Object.TimeTable();
            timeTable.LessonHour = LessonHour;
            timeTable.LessonTime = LessonTime;
            timeTable.ShiftType = ShiftType;

            int ResultNumber = crud.Create(timeTable);

            message.Create(ResultNumber,out Message,out Color);
        }
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("LessonHour");
            table.Columns.Add("LessonTime");
            table.Columns.Add("ShiftName");
            table.Columns.Add("ShiftType");

            return crud.ReadFull(table);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("LessonHour");

            return crud.ReadWithId(table);
        }
        public DataTable ReadWithIdByClass(int ClassId)
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("LessonHour");

            Object.Programme programme = new Object.Programme();
            programme.ClassId = ClassId;
            programme.DayId = (int)DateTime.Now.DayOfWeek;

            return crud.ReadWithIdByClass(table, programme);
        }
        public void Update(int Id,int LessonHour,DateTime LessonTime, int ShiftType, out string Message, out System.Drawing.Color Color)
        {
            Object.TimeTable timeTable = new Object.TimeTable();
            timeTable.Id = Id;
            timeTable.LessonHour = LessonHour;
            timeTable.LessonTime = LessonTime;
            timeTable.ShiftType = ShiftType;

            int ResultNumber = crud.Update(timeTable);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id,out string Message, out System.Drawing.Color Color)
        {
            Object.TimeTable timeTable = new Object.TimeTable();
            timeTable.Id = Id;

            int ResultNumber = crud.Delete(timeTable);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
