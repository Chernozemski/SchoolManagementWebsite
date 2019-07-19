using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Student
{
    public class Register
    {
        DataAccessLayer.Student.Register student = new DataAccessLayer.Student.Register();
        public object[] register(string FirstName,string MiddleName,string FamilyName,string EGN,string StudentPhone
            ,string Adress,int ClassId,System.Web.UI.WebControls.FileUpload photo,
            int DoctorId,string ParentFullName,string ParentPhoneNumber,string ParentAdress)
        {
            byte[] image = SharedMethods.getImage(photo);
            int result;

            if (DoctorId == 0)
            {
                return new object[] { "Доктор с това име не е записан.", Color.DarkRed };
            }
            else if (image.Length == 0)
            {
                result = student.register(FirstName, MiddleName, FamilyName, EGN, StudentPhone, Adress, ClassId, null, DoctorId, ParentFullName
                , ParentPhoneNumber, ParentAdress);
                return Message(result);
            }
            else
            {
                result = student.register(FirstName, MiddleName, FamilyName, EGN, StudentPhone, Adress, ClassId, image, DoctorId, ParentFullName
                    , ParentPhoneNumber, ParentAdress);
                return Message(result);
            }
        }
        public int getDoctorId(string doctorFullName)
        {
            int result = DataAccessLayer.Doctor.HelperMethods.getId(doctorFullName);

            return result;
        }
        private object[] Message(int result)
        {
            switch (result)
            {
                case 1 :
                    return new object[] { "Успешно записване.", Color.Green };
                case -1 :
                    return new object[] {"Класът не съществува.",Color.DarkRed};
                case -2 :
                    return new object[] { "Доктор с това име не е записване.", Color.DarkRed };
                case -3 :
                    return new object[] { "ЕГН - то на ученика трябва да е 10 цифри.", Color.DarkRed };
                case -4 :
                    return new object[] { "Телефонният номер на ученика трябва да е 10 цифри", Color.DarkRed };
                case -5 :
                    return new object[] { "Телефонният номер на родителя трябва да е 10 цифри", Color.DarkRed };
                case -6:
                    return new object[] { "Ученикът вече е записване.", Color.DarkRed };
                default :
                    return new object[] { "Възникна проблем, който не е разпознат от системата.", Color.DarkRed };
            }
        }                                                                                          
    }
}
