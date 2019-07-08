using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Object
{
    public class StudentInfo
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string FamilyName { get; set; }
        public string EGN { get; set; }
        public string PhoneNumber { get; set; }
        public string Adress { get; set; }
        public byte[] Photo { get; set; }
        public int ClassId { get; set; }
        public int DoctorId { get; set; }
        public string ParentFullName { get; set; }
        public string ParentPhoneNumber { get; set; }
        public string ParentAdress { get; set; }
    }
}
