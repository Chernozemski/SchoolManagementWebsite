using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer.Budget
{
    public class CRUDOPerationType
    {
        DataAccessLayer.Budget.CRUDOPerationType crud = new DataAccessLayer.Budget.CRUDOPerationType();
        public DataTable ReadWithId()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("Operation");

            return crud.ReadWithId(table);
        }
    }
}
