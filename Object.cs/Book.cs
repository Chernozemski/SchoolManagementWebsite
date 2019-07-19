using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Object
{
    public class Book
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PublisherId { get; set; }
        public int Grade { get; set; }
        public int SubjectId { get; set; }
        public int PublishedYear { get; set; }
        public int Quantity { get; set; }
    }
}
