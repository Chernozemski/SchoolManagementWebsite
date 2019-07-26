using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Programme
{
    public class CRUD
    {
        DataAccessLayer.Programme.CRUD crud = new DataAccessLayer.Programme.CRUD();
        Message message = new Message();
        public void Create(int ClassId,int DayId,int HourId,int SubjectId,int RoomId,string TeacherEGN,
            out string Message, out System.Drawing.Color Color)
        {
            Object.Programme programme = new Object.Programme();
            programme.ClassId = ClassId;
            programme.DayId = DayId;
            programme.HourId = HourId;
            programme.SubjectId = SubjectId;
            programme.RoomId = RoomId;
            programme.TeacherEGN = TeacherEGN;

            int ResultNumber = crud.Create(programme);

            message.Create(ResultNumber, out Message, out Color);
        }
        public DataTable ReadFull(int ClassId)
        {
            Object.Programme programme = new Object.Programme();
            programme.ClassId = ClassId;

            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("ClassName");
            table.Columns.Add("ClassId");
            table.Columns.Add("NameDay");
            table.Columns.Add("DayId");
            table.Columns.Add("LessonHour");
            table.Columns.Add("HourId");
            table.Columns.Add("SubjectName");
            table.Columns.Add("SubjectId");
            table.Columns.Add("RoomId");
            table.Columns.Add("TeacherFullName");
            table.Columns.Add("TeacherEGN");

            if (programme.ClassId == 0)
            {
                return crud.ReadFullWithoutClass(table);
            }
            else
            return crud.ReadFull(table, programme);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Programme");

            return crud.ReadWithId(table);
        }
        public int GetProgrammeId(int ClassId,int DayId,int HourId)
        {
            Object.Programme programme = new Object.Programme();

            programme.ClassId = ClassId;
            programme.DayId = DayId;
            programme.HourId = HourId;

            return crud.GetProgrammeId(programme);
        }
        public void Update(int Id,int ClassId, int DayId, int HourId, int SubjectId, int RoomId, string TeacherEGN,
    out string Message, out System.Drawing.Color Color)
        {
            Object.Programme programme = new Object.Programme();
            programme.Id = Id;
            programme.ClassId = ClassId;
            programme.DayId = DayId;
            programme.HourId = HourId;
            programme.SubjectId = SubjectId;
            programme.RoomId = RoomId;
            programme.TeacherEGN = TeacherEGN;

            int ResultNumber = crud.Update(programme);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id,out string Message, out System.Drawing.Color Color)
        {
            Object.Programme programme = new Object.Programme();
            programme.Id = Id;

            int ResultNumber = crud.Delete(programme);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
