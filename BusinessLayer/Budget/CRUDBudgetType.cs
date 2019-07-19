using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.Budget
{
    public class CRUDBudgetType
    {
        DataAccessLayer.Budget.CRUDBudgetType crud = new DataAccessLayer.Budget.CRUDBudgetType();
        MessageBudgetType message = new MessageBudgetType();
        public void Create(string Item,int OperationLengthId,int OperationTypeId
            , out string Message, out System.Drawing.Color Color)
        {
            Object.BudgetType budgetType = new Object.BudgetType();
            budgetType.Item = Item;
            budgetType.OperationLengthId = OperationLengthId;
            budgetType.OperationTypeId = OperationTypeId;

            int ResultNumber = crud.Create(budgetType);

            message.Create(ResultNumber, out Message, out Color);
        }
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Item");
            table.Columns.Add("OperationTypeId");
            table.Columns.Add("OperationType");
            table.Columns.Add("OperationLengthId");
            table.Columns.Add("OperationLength");

            return crud.ReadFull(table);
        }
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Item");

            return crud.ReadWithId(table);
        }
        public void Update(int Id,string Item,int OperationLengthId,int OperationTypeId
            , out string Message, out System.Drawing.Color Color)
        {
            Object.BudgetType budgetType = new Object.BudgetType();
            budgetType.Id = Id;
            budgetType.Item = Item;
            budgetType.OperationLengthId = OperationLengthId;
            budgetType.OperationTypeId = OperationTypeId;

            int ResultNumber = crud.Update(budgetType);

            message.Update(ResultNumber, out Message, out Color);
        }
        public void Delete(int Id
            , out string Message, out System.Drawing.Color Color)
        {
            Object.BudgetType budgetType = new Object.BudgetType();
            budgetType.Id = Id;

            int ResultNumber = crud.Delete(budgetType);

            message.Delete(ResultNumber, out Message, out Color);
        }
    }
}
