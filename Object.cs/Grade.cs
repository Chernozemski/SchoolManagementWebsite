using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Object
{
    public class Grade
    {
       public int Id { get; set; }
       public int grade { get; set; }
       public int ClassId { get; set; }
       public int LessonId { get; set; }
       public int StudentId { get; set; }
       public string TeacherEGN { get; set; }
    }
}
