using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Subject
{
    public class CRUD
    {
        DataAccessLayer.Subject.CRUD crud = new DataAccessLayer.Subject.CRUD();
        Message message = new Message();
        public void Create(string SubjectName,out string Message,out System.Drawing.Color Color)
        {
            Object.Subject subject = new Object.Subject();
            subject.SubjectName = SubjectName.Trim();

            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("SubjectName");

            int resultNum = crud.Create(subject);
            message.Create(resultNum,out Message, out Color);
        }
        public DataTable ReadWithTeacherNumber()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("SubjectName");
            table.Columns.Add("NumberOfTeachers");

            return crud.ReadWithTeacherNumber(table);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("SubjectName");

            return crud.ReadWithId(table);
        }
        public void Update(int Id, string SubjectName,out string Message,out System.Drawing.Color Color)
        {
            Object.Subject subject = new Object.Subject();

            subject.Id = Id;
            subject.SubjectName = SubjectName;

            int resultNum = crud.Update(subject);
            message.Update(resultNum,out Message, out Color);
        }
        public void Delete(int Id,out string Message,out System.Drawing.Color Color)
        {
            Object.Subject subject = new Object.Subject();
            subject.Id = Id;

            int resultNum = crud.Delete(subject);
            message.Delete(resultNum,out Message, out Color);
        }
    }
}
