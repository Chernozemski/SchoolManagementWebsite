using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Doctor
{
    public class Register
    {
        public object[] register(string doctorFirstName,string doctorFamilyName,string doctorPhoneNumber)
        {
            DataAccessLayer.Doctor.Register doctor = new DataAccessLayer.Doctor.Register();

            int result = doctor.register(doctorFirstName,doctorFamilyName,doctorPhoneNumber);

            return Messages(result);
        }
        private object[] Messages(int result)
        {
            switch (result)
            {
                case 0 :
                    return new object[] { "Телефонният номер не е 10 цифри.", Color.DarkRed };
                case 1:
                    return new object[] { "Успешно вписване.", Color.Green };
                default:
                    return new object[] { "Възникна проблем, който не е разпознат от системата.", Color.DarkRed };
            }
        }
    }
}
