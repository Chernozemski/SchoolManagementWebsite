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

        public DataTable Read()
        {
            return crud.Read();
        }
    }
}
