using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Class
{
    public class CRUD
    {
        private DataAccessLayer.Class.CRUD crud = new DataAccessLayer.Class.CRUD();
        private BusinessLayer.Class.Message message = new BusinessLayer.Class.Message();
        public void Create(int grade, char letter, int specializationId
            , string teacherEGN, out string Message, out System.Drawing.Color Color)
        {
            Object.Class Class = new Object.Class();
            Class.Grade = grade;
            Class.Letter = letter;
            Class.SpecializationId = specializationId;

            DataTable table = new DataTable();

            table.Columns.Add("Grade");
            table.Columns.Add("Letter");
            table.Columns.Add("SpecializationId");
            table.Columns.Add("ClassTeacherEGN");

            if (teacherEGN.Length == 10)
            {
                Class.ClassTeacherEGN = teacherEGN;

                int resultNum = crud.Create(Class);
                message.Create(resultNum, out Message, out Color);
            }
            else if (grade < 1 || grade > 12)
            {
                message.Create(-5, out Message, out Color);
            }
            else
            {
                message.Create(-3, out Message, out Color);
            }
        }
        public string getEGN(string TeacherFullName)
        {
            DataAccessLayer.Class.HelperMethods getEGN = new DataAccessLayer.Class.HelperMethods();
            return getEGN.getEGN(TeacherFullName);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Grade");

            return crud.ReadWithId(table);
        }
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Grade");
            table.Columns.Add("Letter");
            table.Columns.Add("SpecializationId");
            table.Columns.Add("Specialization");
            table.Columns.Add("ClassTeacherEGN");
            table.Columns.Add("FullTeacherName");

            return crud.ReadFull(table);
        }
        public DataTable ReadWithSelectedId(int Id)
        {
            DataTable table = new DataTable();
            Object.Specialization specialization = new Object.Specialization();
            specialization.Id = Id;

            table.Columns.Add("Grade");
            table.Columns.Add("Letter");

            return crud.ReadWithSelectedId(table, specialization);
        }
        public DataTable Test()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("Grade");
            table.Columns.Add("Letter");
            table.Columns.Add("SpecializationId");
            table.Columns.Add("ClassTeacherEGN");

            return crud.Test(table);
        }
        public void Update(int Id, int Grade, char Letter, int SpecializationId, string ClassTeacherEGN,
            out string Message, out System.Drawing.Color Color)
        {
            if (Grade < 1 || Grade > 12)
            {
                message.Update(-3, out Message, out Color);
            }
            else if (Letter < 'А' || Letter > 'Я'){
                message.Update(-4, out Message, out Color);
            }
            else
            {
                Object.Class Class = new Object.Class();
                Class.Id = Id;
                Class.Grade = Grade;
                Class.Letter = Letter;
                Class.SpecializationId = SpecializationId;
                Class.ClassTeacherEGN = ClassTeacherEGN;

                int resultNumber = crud.Update(Class);
                message.Update(resultNumber, out Message, out Color);
            }
        }
        public void Delete(int Id, out string Message, out System.Drawing.Color Color)
        {
            Object.Class Class = new Object.Class();
            Class.Id = Id;

            int ResultNumber = crud.Delete(Class);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
