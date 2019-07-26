using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.TimeTable
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
                    message = "Тази смяна не съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този час е зает.";
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
                    message = "Тази смяна не съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този час е зает.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този астрономически час е зает.";
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
                    message = "Този час не беше изтрит.";
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
