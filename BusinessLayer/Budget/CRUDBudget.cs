using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Budget
{
    public class CRUDBudget
    {
        DataAccessLayer.Budget.CRUDBudget crud = new DataAccessLayer.Budget.CRUDBudget();
        MessageBudget message = new MessageBudget();
        public void Create(int ItemId,string DescriptionForItem,decimal Amount,DateTime onDate
            ,out string Message, out System.Drawing.Color Color)
        {
            Object.Budget budget = new Object.Budget();
            budget.ItemId = ItemId;
            budget.DescriptionForItem = DescriptionForItem;
            budget.Amount = Amount;
            budget.OnDate = onDate;

            int ResultNumber = crud.Create(budget);

            message.Create(ResultNumber, out Message, out Color);
        }
        public DataTable ReadFull(int ItemId,int Year)
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("ItemId");
            table.Columns.Add("Item");
            table.Columns.Add("Operation");
            table.Columns.Add("Payment");
            table.Columns.Add("DescriptionForItem");
            table.Columns.Add("Amount");
            table.Columns.Add("OnDate");

            Object.Budget budget = new Object.Budget();
            budget.ItemId = ItemId;

            return crud.ReadFull(table,budget,Year);
        }
        public List<int> ReadYears()
        {
            return crud.ReadYears();
        }
        public void Update(int Id,int ItemId, string DescriptionForItem, decimal Amount, DateTime onDate
            , out string Message, out System.Drawing.Color Color)
        {
            Object.Budget budget = new Object.Budget();
            budget.Id = Id;
            budget.ItemId = ItemId;
            budget.DescriptionForItem = DescriptionForItem;
            budget.Amount = Amount;
            budget.OnDate = onDate;

            int ResultNumber = crud.Update(budget);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id
            , out string Message, out System.Drawing.Color Color)
        {
            Object.Budget budget = new Object.Budget();
            budget.Id = Id;

            int ResultNumber = crud.Delete(budget);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
