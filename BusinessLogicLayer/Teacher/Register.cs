using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Teacher
{
    public class RegisterAccount
    {
        DataAccessLayer.Teacher.RegisterAccount teacher = new DataAccessLayer.Teacher.RegisterAccount();
        public object[] register(string userName, string password, string EGN)
        {
            int result = isRegisterValid(userName, password, EGN);

            return Message(result);
        }
        private int isRegisterValid(string userName, string password, string EGN)
        {
            string encryptedPassword = SharedMethods.encryptPassword(password);
            int result = teacher.Register(userName, encryptedPassword, EGN);

            return result;
        }
        private object[] Message(int result)
        {
            switch (result)
            {
                case 1:
                    return new object[] { "Успешно регистриране.", Color.Green };
                case 0:
                    return new object[] { "Потребител с това ЕГН е записан.", Color.DarkRed };
                case -1:
                    return new object[] { "Грешно въведено ЕГН.", Color.DarkRed };
                default:
                    return new object[] { "Потребител с това име е записан.", Color.DarkRed };
            }
        }
    }
}
