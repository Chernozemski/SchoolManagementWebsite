using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace BusinessLayer.TimeTable
{
    public class CRUDShift
    {
        DataAccessLayer.TimeTable.CRUDShift crud = new DataAccessLayer.TimeTable.CRUDShift();
        public DataTable ReadFull()
        {
            DataTable table = new DataTable();

            table.Columns.Add("ShiftType");
            table.Columns.Add("ShiftName");

            return crud.ReadFull(table);
        }
    }
}
