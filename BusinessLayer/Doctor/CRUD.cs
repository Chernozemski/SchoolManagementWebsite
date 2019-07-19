using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Doctor
{
    public class CRUD
    {
        private DataAccessLayer.Doctor.CRUD crud = new DataAccessLayer.Doctor.CRUD();
        private BusinessLayer.Doctor.Message message = new Message();
        public void Create(string doctorFirstName, string doctorFamilyName, string doctorPhoneNumber
            ,out string Message,out System.Drawing.Color Color)
        {
            Object.Doctor doctor = new Object.Doctor();

            doctor.FirstName = doctorFirstName;
            doctor.FamilyName = doctorFamilyName;
            doctor.PhoneNumber = doctorPhoneNumber;

            int ResultNumber = crud.Create(doctor);

            message.Create(ResultNumber,out Message,out Color);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("FullDoctorName");

            return crud.ReadWithId(table);
        }
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("FirstName");
            table.Columns.Add("FamilyName");
            table.Columns.Add("PhoneNumber");

            return crud.ReadFull(table);
        }
        public void Update(int Id, string FirstName, string FamilyName, string Phonenumber
            ,out string Message,out System.Drawing.Color Color)
        {
            Object.Doctor doctor = new Object.Doctor();
            doctor.Id = Id;
            doctor.FirstName = FirstName;
            doctor.FamilyName = FamilyName;
            doctor.PhoneNumber = Phonenumber;

            int ResultNumber = crud.Update(doctor);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id, out string Message, out System.Drawing.Color Color)
        {
            Object.Doctor doctor = new Object.Doctor();
            doctor.Id = Id;

            int ResultNumber = crud.Delete(doctor);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
