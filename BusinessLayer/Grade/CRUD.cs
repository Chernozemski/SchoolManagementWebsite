using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Grade
{
    public class CRUD
    {
        DataAccessLayer.Grade.CRUD crud = new DataAccessLayer.Grade.CRUD();
        Message message = new Message();
        public void Create(int ClassId,int Grade,int LessonId,int StudentId,string TeacherEGN,out string Message,out System.Drawing.Color Color)
        {
            Object.Grade grade = new Object.Grade();
            grade.ClassId = ClassId;
            grade.grade = Grade;
            grade.LessonId = LessonId;
            grade.StudentId = StudentId;
            grade.TeacherEGN = TeacherEGN;

            int ResultNumber = crud.Create(grade);

            message.Create(ResultNumber,out Message,out Color);
        }
        public DataTable ReadFull(int ClassId)
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("Grade");
            table.Columns.Add("ClassId");
            table.Columns.Add("ClassName");
            table.Columns.Add("LessonId");
            table.Columns.Add("LessonName");
            table.Columns.Add("OnDate");
            table.Columns.Add("StudentInClassId");
            table.Columns.Add("StudentName");
            table.Columns.Add("FullTeacherName");
            table.Columns.Add("TeacherEGN");

            if (ClassId == 0)
            {
                return crud.ReadFull(table);
            }
            else
            {
                Object.Grade grade = new Object.Grade();
                grade.ClassId = ClassId;

                return crud.ReadFull(table, grade);
            }
        }
        public void Update(int Id, int Grade, int ClassId, int LessonId, int StudentInClassId, string TeacherEGN, out string Message, out System.Drawing.Color Color)
        {
            Object.Grade grade = new Object.Grade();
            grade.Id = Id;
            grade.grade = Grade;
            grade.ClassId = ClassId;
            grade.LessonId = LessonId;
            grade.StudentId = StudentInClassId;
            grade.TeacherEGN = TeacherEGN;

            int ResultNumber = crud.Update(grade);

            message.Update(ResultNumber,out Message,out Color);
        }
        public void Delete(int Id, out string Message, out System.Drawing.Color Color)
        {
            Object.Grade grade = new Object.Grade();
            grade.Id = Id;

            int ResultNumber = crud.Delete(grade);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
