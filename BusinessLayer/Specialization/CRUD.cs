using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Specialization
{
    public class CRUD
    {
        private DataAccessLayer.Specialization.CRUD crud = new DataAccessLayer.Specialization.CRUD();
        private Message message = new Message();
        public void Create(string specializationName,out string Message,out System.Drawing.Color Color)
        {
            Object.Specialization specialization = new Object.Specialization();

            specialization.Name = specializationName;

            int ResultNumber = crud.Create(specialization);

            message.Create(ResultNumber, out Message, out Color);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Specialization");

           return crud.ReadWithId(table);
        }
        public DataTable ReadWithNumberOfClasses()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Specialization");
            table.Columns.Add("NumberOfClasses");

            return crud.ReadWithClassesCount(table);
        }
        public void Update(int Id,string specialization,out string Message,out System.Drawing.Color Color)
        {
            Object.Specialization Specialization = new Object.Specialization();
            Specialization.Id = Id;
            Specialization.Name = specialization;

            int ResultNumber = crud.Update(Specialization);
            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id,out string Message,out System.Drawing.Color Color)
        {
            Object.Specialization specialization = new Object.Specialization();
            specialization.Id = Id;

            int ResultNumber = crud.Delete(specialization);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
