using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Subject
{
    internal class Message
    {
        public void Create(int resultNumber, out string message, out Color color)
        {
            switch (resultNumber)
            {
                case 1:
                    message = "Успешно записване.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Предмет с това име вече е записан.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Update(int resultNumber, out string message, out Color color)
        {
            switch (resultNumber)
            {
                case 1:
                    message = "Успешна промяна.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Id-то не съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Предмет с това име вече е записан.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем, който не е разпознат.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Delete(int resultNumber, out string message, out Color color)
        {
            switch (resultNumber)
            {
                case 1:
                    message = "Успешно отписване.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Не е изтрит този запис.";
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
