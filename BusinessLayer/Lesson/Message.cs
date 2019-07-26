using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Lesson
{
    internal class Message
    {
        public void Create(int ResultNumber, out string message, out Color color)
        {
            switch (ResultNumber)
            {
                case 1:
                    message = "Успешно записване.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Тази програма не съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този учител не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този урок вече съществува.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат от системата.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Update(int ResultNumber, out string message, out Color color)
        {
            switch (ResultNumber)
            {
                case 1:
                    message = "Успешна промяна.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Тази програма не съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този учител не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този урок вече същетвува.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат от системата.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Delete(int ResultNumber, out string message, out Color color)
        {
            switch (ResultNumber)
            {
                case 1:
                    message = "Успешно изтриване.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Този урок не беше изтрит. Възможно е да има записани оценки на този урок, за да се изтрие, трябва да се отпишат оценките.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат от системата.";
                    color = Color.DarkRed;
                    break;
            }
        }
    }
}
