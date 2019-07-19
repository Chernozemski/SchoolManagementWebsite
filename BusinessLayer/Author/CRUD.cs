using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Author
{
   public class CRUD
    {
       DataAccessLayer.Author.CRUD crud = new DataAccessLayer.Author.CRUD();
       BusinessLayer.Author.Message message = new BusinessLayer.Author.Message();
       public void Create(string Publisher,out string Message, out System.Drawing.Color Color)
       {
           Object.Author author = new Object.Author();

           author.Publisher = Publisher;

           int ResultNumber = crud.Create(author);

           message.Create(ResultNumber, out Message, out Color);
       }
       public DataTable ReadWithId()
       {
           DataTable table = new DataTable();

           table.Columns.Add("Id");
           table.Columns.Add("Publisher");

           return crud.ReadWithId(table);
       }
       public DataTable ReadWithBookCount()
       {
           DataTable table = new DataTable();

           table.Columns.Add("Id");
           table.Columns.Add("Publisher");
           table.Columns.Add("BookCount");

           return crud.ReadWithBookCount(table);
       }
       public void Update(int Id,string Publisher,out string Message, out System.Drawing.Color Color)
       {
           Object.Author author = new Object.Author();

           author.Id = Id;
           author.Publisher = Publisher;

           int ResultNumber = crud.Update(author);

           message.Update(ResultNumber, out Message, out Color);
       }
       public void Delete(int Id,string Publisher,out string Message, out System.Drawing.Color Color)
       {
           Object.Author author = new Object.Author();

           author.Id = Id;

           int ResultNumber = crud.Delete(author);

           message.Delete(ResultNumber, out Message, out Color);
       }
    }
}
