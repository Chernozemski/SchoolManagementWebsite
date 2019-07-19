using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace BusinessLayer.Budget
{
    public class CRUDOperationLength
    {
        DataAccessLayer.Budget.CRUDOperationLength crud = new DataAccessLayer.Budget.CRUDOperationLength();
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Payment");

            return crud.ReadWithId(table);
        }
    }
}
