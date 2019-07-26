using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Object
{
    public class Lesson
    {
       public int Id { get; set; }
       public int ProgrammeId { get; set; }
       public string LessonName { get; set; }
       public DateTime OnDate { get; set; }
       public string TeacherEGN { get; set; }
       public string MissingStudentId { get; set; }
       public string LateStudentId { get; set; }
    }
}
