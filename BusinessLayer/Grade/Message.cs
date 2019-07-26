using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Grade
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
                    message = "Този клас не съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този урок не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този ученик не съществува.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Този ученик не е бил в час.";
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
                    message = "Този клас не съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този урок не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този ученик не съществува.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Не може да се напише оценка ученик, който не съществува.";
                    color = Color.DarkRed;
                    break;
                case -4:
                    message = "Този урок вече е записан на друг клас.";
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
                    message = "Тази оценка не беше изтрита.";
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
