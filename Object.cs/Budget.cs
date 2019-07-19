using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Object
{
    public class Budget
    {
      public int Id { get; set; }
      public int ItemId { get; set; }
      public string DescriptionForItem { get; set; }
      public decimal Amount { get; set; }
      public DateTime OnDate { get; set; }
    }
}
