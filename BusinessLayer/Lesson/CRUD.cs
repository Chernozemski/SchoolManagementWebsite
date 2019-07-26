using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Lesson
{
    public class CRUD
    {
        DataAccessLayer.Lesson.CRUD crud = new DataAccessLayer.Lesson.CRUD();
        Message message = new Message();
        public void Create(int ProgrammeId,int ClassId, string LessonName, DateTime OnDate, string TeacherEGN, string MissingStudentId
            , string LateStudentId, out string Message, out System.Drawing.Color Color)
        {
            Object.Lesson lesson = new Object.Lesson();
            lesson.ProgrammeId = ProgrammeId;
            lesson.LessonName = LessonName;
            lesson.OnDate = OnDate;
            lesson.TeacherEGN = TeacherEGN;
            lesson.MissingStudentId = MissingStudentId;
            lesson.LateStudentId = LateStudentId;

            Object.Programme programme = new Object.Programme();
            programme.ClassId = ClassId;

            int ResultNumber = crud.Create(lesson,programme);

            message.Create(ResultNumber,out Message,out Color);
        }
        public DataTable ReadTodayLesson(int ClassId)
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("LessonName");

            Object.Lesson lesson = new Object.Lesson();
            lesson.OnDate = DateTime.Now;

            Object.Programme programme = new Object.Programme();
            programme.ClassId = ClassId;

            return crud.ReadTodayLesson(table, lesson, programme);
        }
        public DataTable ReadFull(int ClassId)
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("LessonName");
            table.Columns.Add("OnDate");
            table.Columns.Add("TeacherEGN");
            table.Columns.Add("MissingStudentId");
            table.Columns.Add("LateStudentId");
            table.Columns.Add("ProgrammeId");
            table.Columns.Add("ClassName");
            table.Columns.Add("ClassId");
            table.Columns.Add("NameDay");
            table.Columns.Add("LessonHour");
            table.Columns.Add("SubjectName");
            table.Columns.Add("SubjectId");
            table.Columns.Add("TeacherFullName");

            if (ClassId == 0)
            {
                return crud.ReadFullWithoutClass(table);
            }
            else
            {
                Object.Programme programme = new Object.Programme();
                programme.ClassId = ClassId;

                return crud.ReadFull(table, programme);
            }
        }
        public void Update(int Id,int ProgrammeId, string LessonName, DateTime OnDate, string TeacherEGN, string MissingStudentId
    , string LateStudentId, out string Message, out System.Drawing.Color Color)
        {
            Object.Lesson lesson = new Object.Lesson();
            lesson.Id = Id;
            lesson.ProgrammeId = ProgrammeId;
            lesson.LessonName = LessonName;
            lesson.OnDate = OnDate;
            lesson.TeacherEGN = TeacherEGN;
            lesson.MissingStudentId = MissingStudentId;
            lesson.LateStudentId = LateStudentId;

            int ResultNumber = crud.Update(lesson);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id,int ClassId,out string Message, out System.Drawing.Color Color)
        {
            Object.Lesson lesson = new Object.Lesson();
            lesson.Id = Id;

            Object.Programme programme = new Object.Programme();
            programme.ClassId = ClassId;

            int ResultNumber = crud.Delete(lesson,programme);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
