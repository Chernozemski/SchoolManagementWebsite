using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Class
{
    internal class MessageClassStudent
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
                    message = "Този ученик не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този ученик вече е в клас.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Този номер вече е записан.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем който не е записан.";
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
                    message = "Този ученик е записан в клас.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този ученик е записан в клас.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Този номер е зает от друг ученик.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем който не е записан.";
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
                    message = "Ученикът в класа не е изтрит.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем който не е записан.";
                    color = Color.DarkRed;
                    break;
            }
        }
    }
}
