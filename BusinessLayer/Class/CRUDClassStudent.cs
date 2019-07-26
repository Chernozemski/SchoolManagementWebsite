using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Class
{
    public class CRUDClassStudent
    {
        DataAccessLayer.Class.CRUDClassStudent crud = new DataAccessLayer.Class.CRUDClassStudent();
        MessageClassStudent message = new MessageClassStudent();
        public void Create(int StudentInClassId, int ClassId, int StudentId, int TimesAbsent, int TimesExcused, float TimesLate, out string Message, out System.Drawing.Color Color)
        {
            Object.ClassStudent classStudent = new Object.ClassStudent();
            classStudent.StudentInClassId = StudentInClassId;
            classStudent.ClassId = ClassId;
            classStudent.StudentId = StudentId;
            classStudent.TimesAbsent = TimesAbsent;
            classStudent.TimesExcused = TimesExcused;
            classStudent.TimesLate = TimesLate;

            int ResultNumber = crud.Create(classStudent);
            message.Create(ResultNumber, out Message, out Color);
        }
        public DataTable ReadStudentWithoutClassId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("StudentInClassId");
            table.Columns.Add("FullName");

            return crud.ReadStudentWithoutClassId(table);
        }
        public DataTable ReadFullByClass(int ClassId)
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("StudentInClassId");
            table.Columns.Add("ClassName");
            table.Columns.Add("ClassId");
            table.Columns.Add("StudentName");
            table.Columns.Add("StudentId");
            table.Columns.Add("TimesAbsent");
            table.Columns.Add("TimesExcused");
            table.Columns.Add("TimesLate");

            if (ClassId == 0)
            {
                return crud.ReadFull(table);
            }
            else
            {
                Object.ClassStudent classStudent = new Object.ClassStudent();
                classStudent.ClassId = ClassId;

                return crud.ReadFullByClass(table,classStudent);
            }
        }
        public DataTable ReadStudentWithIdByClass(int ClassId)
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("StudentInClassId");
            table.Columns.Add("FullName");

           Object.ClassStudent classStudent = new Object.ClassStudent();
           classStudent.ClassId = ClassId;

           return crud.ReadStudentWithIdByClass(table, classStudent);
        }
        public DataTable ReadStudentWithClassId(int ClassId)
        {
            DataTable table = new DataTable();

            table.Columns.Add("StudentInClassId");
            table.Columns.Add("FullName");

            Object.ClassStudent classStudent = new Object.ClassStudent();
            classStudent.ClassId = ClassId;

            return crud.ReadStudentWithClassId(table, classStudent);
        }
        public void Update(int Id,int StudentInClassId,int ClassId, int StudentId, int TimesAbsent, int TimesExcused, float TimesLate, out string Message, out System.Drawing.Color Color)
        {
            Object.ClassStudent classStudent = new Object.ClassStudent();
            classStudent.StudentInClassId = StudentInClassId;
            classStudent.Id = Id;
            classStudent.ClassId = ClassId;
            classStudent.StudentId = StudentId;
            classStudent.TimesAbsent = TimesAbsent;
            classStudent.TimesExcused = TimesExcused;
            classStudent.TimesLate = TimesLate;

            int ResultNumber = crud.Update(classStudent);
            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id, out string Message, out System.Drawing.Color Color)
        {
            Object.ClassStudent classStudent = new Object.ClassStudent();
            classStudent.Id = Id;

            int ResultNumber = crud.Delete(classStudent);
            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
