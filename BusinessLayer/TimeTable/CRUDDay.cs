using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.TimeTable
{
    public class CRUDDay
    {
        DataAccessLayer.TimeTable.CRUDDay crud = new DataAccessLayer.TimeTable.CRUDDay();
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();

            table.Columns.Add("Id");
            table.Columns.Add("NameDay");

            return crud.ReadFull(table);
        }
    }
}
