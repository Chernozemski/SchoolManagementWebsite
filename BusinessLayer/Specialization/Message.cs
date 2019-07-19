using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Specialization
{
    internal class Message
    {
        public void Create(int ResultNumber, out string message, out Color color)
        {
            switch (ResultNumber)
            {
                case 1 :
                    message = "Успешно записване на име на паралелка.";
                    color = Color.Green;
                    break;
                case 0 :
                    message = "Специалност с това име вече е записване.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Update(int ResultNumber, out string message, out Color color)
        {
            switch (ResultNumber)
            {
                 case 1 :
                    message = "Успешно променяне на името специалността.";
                    color = Color.Green;
                    break;
                case 0 :
                    message = "Специалност с това име вече е записана.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Delete(int ResultNumber, out string message, out Color color)
        {
            switch (ResultNumber)
            {
                case 1 :
                    message = "Успешно изтриване.";
                    color = Color.Green;
                    break;
                case 0 :
                    message = "Името на специалността не беше изтрито. Възможно е да има класове записани с тази специалност.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат.";
                    color = Color.DarkRed;
                    break;
            }
        }
    }
}
