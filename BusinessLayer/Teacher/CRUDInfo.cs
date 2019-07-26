using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Teacher
{
    public class CRUDInfo
    {
        Message message = new Message();
        private DataAccessLayer.Teacher.CRUDInfo crud = new DataAccessLayer.Teacher.CRUDInfo();
        public void Create(string firstName, string middleName, string familyName,
            int subjectId, string EGN, string phoneNumber, string adress,
            int positionId, System.Web.UI.WebControls.FileUpload fileUploadPhoto,out string Message,out System.Drawing.Color Color)
        {
            Object.TeacherInfo teacher = new Object.TeacherInfo();
            teacher.FirstName = firstName;
            teacher.MiddleName = middleName;
            teacher.FamilyName = familyName;
            teacher.SubjectId = subjectId;
            teacher.EGN = EGN;
            teacher.PhoneNumber = phoneNumber;
            teacher.Adress = adress;
            teacher.PositionId = positionId;
            teacher.Photo = SharedMethods.getImage(fileUploadPhoto);

            //If image has not been chosen, mark photo as null instead of 0 or ""
            if (teacher.Photo.Length == 0)
                teacher.Photo = null;

            int resultNumber = crud.Create(teacher);

            message.Create(resultNumber,out Message,out Color);
        }

        public DataTable Read()
        {
            DataTable table = new DataTable();
            table.Columns.Add("FullName");
            table.Columns.Add("SubjectName");
            table.Columns.Add("PhoneNumber");
            table.Columns.Add("Adress");
            table.Columns.Add("Position");
            table.Columns.Add("Photo", typeof(byte[]));
            table.Columns.Add("Class");

            return crud.Read(table);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("FullName");
            table.Columns.Add("SubjectName");
            table.Columns.Add("PhoneNumber");
            table.Columns.Add("Adress");
            table.Columns.Add("Position");
            table.Columns.Add("Photo", typeof(byte[]));
            table.Columns.Add("Class");

            return crud.ReadWithId(table);
        }
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("FirstName");
            table.Columns.Add("MiddleName");
            table.Columns.Add("FamilyName");
            table.Columns.Add("SubjectId");
            table.Columns.Add("SubjectName");
            table.Columns.Add("EGN");
            table.Columns.Add("PhoneNumber");
            table.Columns.Add("Adress");
            table.Columns.Add("PositionId");
            table.Columns.Add("Position");
            table.Columns.Add("Photo", typeof(byte[]));

            return crud.ReadFull(table);
        }
        public DataTable ReadWithFullNameAndEGN()
        {
            DataTable table = new DataTable();
            table.Columns.Add("FullTeacherName");
            table.Columns.Add("EGN");

            return crud.ReadWithFullNameAndEGN(table);
        }
        public DataTable ReadWithSelectSubjectId(int Id)
        {
            //Gets the selected subject id value from gridview and displays teacher full name gridview
            DataTable table = new DataTable();

            table.Columns.Add("EGN");
            table.Columns.Add("FullName");

            Object.Subject subject = new Object.Subject();
            subject.Id = Id;

            return crud.ReadWithSelectSubjectId(table, subject);
        }
        public DataTable ReadWithSelectedPositionId(int Id)
        {
            //Gets the selected subject id value from gridview and displays teacher full name gridview
            DataTable table = new DataTable();

            table.Columns.Add("FullName");

            Object.Position position = new Object.Position();
            position.Id = Id;

            return crud.ReadWithSelectedPositionId(table, position);
        }
        public DataTable ReadWithoutClass()
        {
            DataTable table = new DataTable();
            table.Columns.Add("FullName");
            table.Columns.Add("EGN");

            return crud.ReadWithoutClass(table);
        }
        public int GetTeacherClassId()
        {
            string EGN = System.Web.HttpContext.Current.Session["EGN"].ToString();

            Object.TeacherInfo teacher = new Object.TeacherInfo();
            teacher.EGN = EGN;

            int classId = crud.GetTeacherClassId(teacher);

            if (classId == 0)
            {
                return 0;
            }
            else
            {
                return classId;
            }
        }
        public void Update(int Id, string FirstName, string MiddleName, string FamilyName, string EGN, int SubjectId
            , string PhoneNumber, string Adress, int PositionId, string Photo,out string Message,out System.Drawing.Color Color)
        {
            if (Id == 1 && PositionId != 1)
            {
                message.Update(-3, out Message, out Color);
            }
            else
            {
                Object.TeacherInfo teacher = new Object.TeacherInfo();

                teacher.Id = Id;

                teacher.FirstName = FirstName;
                teacher.MiddleName = MiddleName;
                teacher.FamilyName = FamilyName;

                teacher.EGN = EGN;
                teacher.SubjectId = SubjectId;
                teacher.PhoneNumber = PhoneNumber;
                teacher.Adress = Adress;
                teacher.PositionId = PositionId;
                if (Photo != null)
                    teacher.Photo = BusinessLayer.SharedMethods.getImageBase64(Photo);

                int resultNum = crud.Update(teacher);

                message.Update(resultNum, out Message, out Color);
            }
        }
        public void Delete(int Id, out string Message,out System.Drawing.Color Color)
        {
            Object.TeacherInfo teacher = new Object.TeacherInfo();
            teacher.Id = Id;

            if (Id == 1)
            {
                message.Delete(-1, out Message, out Color);
            }
            else
            {
                int resultNum = crud.Delete(teacher);

                message.Delete(resultNum, out Message, out Color);
            }
        }
    }
}
