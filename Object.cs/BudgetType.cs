using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Object
{
    public class BudgetType
    {
       public int Id { get; set; }
       public string Item { get; set; }
       public int OperationTypeId { get; set; }
       public int OperationLengthId { get; set; }
    }
}
