using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Class
{
    public class Register
    {
        DataAccessLayer.Class.Register Class = new DataAccessLayer.Class.Register();
        public string checkTeacher(string fullTeacherName)
        {
           return Class.getEGN(fullTeacherName);
        }
        public object[] register(int grade, char letter, int specializationId, string EGN)
        {
            if (grade < 0 || grade > 12) return Message(-5);
            if (EGN == "0") return Message(-3);

           return Message(Class.register(grade,Char.ToUpper(letter),specializationId,EGN));
        }
        private object[] Message(int result)
        {
            switch (result)
            {
                case 1:
                    return new object[] { "Успешна регистрация.", Color.Green };
                case 0:
                    return new object[] { "Учителят вече има клас.", Color.DarkRed };
                case -2:
                    return new object[] { "Клас с тези елементи е записан.", Color.DarkRed };
                case -3:
                    return new object[] { "Учителят не съществува", Color.DarkRed };
                default:
                    return new object[] { "Възникна проблем който не е записан.", Color.DarkRed };
            }
        }
    }
}
