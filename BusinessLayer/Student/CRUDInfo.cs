﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Student
{
    public class CRUDInfo
    {
        private Message message = new Message();
        private DataAccessLayer.Student.CRUDInfo crud = new DataAccessLayer.Student.CRUDInfo();
        public void Create(string firstName, string middleName, string familyName,
            string EGN, string phoneNumber, string adress,
            System.Web.UI.WebControls.FileUpload fileUploadPhoto,
            int ClassId,int DoctorId,string ParentFullName,string ParentPhoneNumber,
            string ParentAdress,out string Message, out System.Drawing.Color Color)
        {
            Object.StudentInfo student = new Object.StudentInfo();
            student.FirstName = firstName;
            student.MiddleName = middleName;
            student.FamilyName = familyName;

            student.EGN = EGN;
            student.PhoneNumber = phoneNumber;
            student.Adress = adress;
            student.Photo = SharedMethods.getImage(fileUploadPhoto);

            student.ClassId = ClassId;
            student.DoctorId = DoctorId;

            student.ParentFullName = ParentFullName;
            student.ParentPhoneNumber = phoneNumber;
            student.ParentAdress = ParentAdress;

            //If image has not been chosen, mark photo as null instead of 0 or ""
            if (student.Photo.Length == 0)
                student.Photo = null;

            int resultNumber = crud.Create(student);

            message.Register(resultNumber, out Message, out Color);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");

            table.Columns.Add("FullName");
            table.Columns.Add("PhoneNumber");

            table.Columns.Add("Adress");
            table.Columns.Add("Photo", typeof(byte[]));

            table.Columns.Add("Grade");
            table.Columns.Add("DoctorFullName");

            table.Columns.Add("ParentFullName");
            table.Columns.Add("ParentPhoneNumber");
            table.Columns.Add("ParentAdress");

            return crud.ReadWithId(table);
        }
        public void Update(int Id,string firstName, string middleName, string familyName,
            string EGN, string phoneNumber, string adress, string Photo,
            int ClassId,int DoctorId,string ParentFullName,string ParentPhoneNumber,
            string ParentAdress,out string Message, out System.Drawing.Color Color)
        {
            Object.StudentInfo student = new Object.StudentInfo();

            student.Id = Id;
            student.FirstName = firstName;
            student.MiddleName = middleName;
            student.FamilyName = familyName;

            student.EGN = EGN;
            student.PhoneNumber = phoneNumber;
            student.Adress = adress;

            if (Photo != null)
                student.Photo = BusinessLayer.SharedMethods.getImageBase64(Photo);

            student.ClassId = ClassId;
            student.DoctorId = DoctorId;

            student.ParentFullName = ParentFullName;
            student.ParentPhoneNumber = phoneNumber;
            student.ParentAdress = ParentAdress;

            int resultNum = crud.Update(student);

            message.Update(resultNum, out Message, out Color);
        }
        public void Delete(int Id, out string Message, out System.Drawing.Color Color)
        {
            Object.StudentInfo student = new Object.StudentInfo();
            student.Id = Id;

            int resultNum = crud.Delete(student);

            message.Delete(resultNum, out Message, out Color);
        }
    }
}
