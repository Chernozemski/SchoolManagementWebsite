using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Object
{
    public class TeacherInfo
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string FamilyName { get; set; }
        public int SubjectId { get; set; }
        public string EGN { get; set; }
        public string PhoneNumber { get; set; }
        public string Adress { get; set; }
        public int PositionId { get; set; }
        public byte[] Photo { get; set; }
    }
}
