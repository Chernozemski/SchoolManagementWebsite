using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace BusinessLayer.Book
{
    public class CRUD
    {
        DataAccessLayer.Book.CRUD crud = new DataAccessLayer.Book.CRUD();
        Message message = new Message();
        public void Create(string Name, int PublisherId, int Grade, int SubjectId, int PublishedYear, int Quantity,
            out string Message, out System.Drawing.Color Color)
        {
            Object.Book book = new Object.Book();
            book.Name = Name;
            book.PublisherId = PublisherId;
            book.Grade = Grade;
            book.PublishedYear = PublishedYear;
            book.SubjectId = SubjectId;
            book.Quantity = Quantity;

            int ResultNumber = crud.Create(book);

            message.Create(ResultNumber, out Message, out Color);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Name");
            table.Columns.Add("Publisher");
            table.Columns.Add("Grade");
            table.Columns.Add("SubjectName");

            return crud.ReadWithId(table);
        }
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Name");
            table.Columns.Add("PublisherId");
            table.Columns.Add("Publisher");
            table.Columns.Add("Grade");
            table.Columns.Add("SubjectId");
            table.Columns.Add("SubjectName");
            table.Columns.Add("PublishedYear");
            table.Columns.Add("Quantity");

            return crud.ReadFull(table);
        }
        public void Update(int Id,string Name,int PublisherId,int Grade,int SubjectId,int PublishedYear,int Quantity,
            out string Message, out System.Drawing.Color Color)
        {
            Object.Book book = new Object.Book();
            book.Id = Id;
            book.Name = Name;
            book.Grade = Grade;
            book.PublisherId = PublisherId;
            book.PublishedYear = PublishedYear;
            book.SubjectId = SubjectId;
            book.Quantity = Quantity;

            int ResultNumber = crud.Update(book);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id,out string Message, out System.Drawing.Color Color)
        {
            Object.Book book = new Object.Book();
            book.Id = Id;

            int ResultNumber = crud.Delete(book);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
