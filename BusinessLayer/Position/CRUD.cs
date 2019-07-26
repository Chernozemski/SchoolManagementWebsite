using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Position
{
    public class CRUD
    {
        DataAccessLayer.Position.CRUD crud = new DataAccessLayer.Position.CRUD();
        BusinessLayer.Position.Message message = new Message();
        public void Create(string Position, decimal Salary,out string Message,out System.Drawing.Color Color)
        {
            Object.Position position = new Object.Position();
            position.Name = Position;
            position.Salary = Salary;

            int ResultNumber =  crud.Create(position);
            
            message.Create(ResultNumber,out Message,out Color);
        }
        public DataTable Read()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("Position");
            table.Columns.Add("Salary");

            return crud.Read(table);
        }
        public DataTable ReadWithStaffCount()
        {
            DataTable table = new DataTable();
            table.Columns.Add("Id");
            table.Columns.Add("Position");
            table.Columns.Add("Salary");
            table.Columns.Add("StaffCount");

            return crud.ReadWithStaffCount(table);
        }
        public decimal GetTotalSalary()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Salary");

            return crud.GetTotalSalary(table);
        }
        public void Update(int Id, string Position, decimal Salary, out string Message, out System.Drawing.Color Color)
        {
            Position = Position.Trim();

            Object.Position position = new Object.Position();

            position.Id = Id;
            position.Name = Char.ToUpper(Position[0]) + Position.Substring(1);
            position.Salary = Salary;

            int ResultNumber = crud.Update(position);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id,out string Message, out System.Drawing.Color Color)
        {
            Object.Position position = new Object.Position();
            position.Id = Id;

            int ResultNumber = crud.Delete(position);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
