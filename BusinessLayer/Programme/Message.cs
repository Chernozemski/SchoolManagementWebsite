using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Programme
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
                    message = "На този час и ден, на този клас, вече е записан час.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този клас не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този час не съществува.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Този предмет не съществува.";
                    color = Color.DarkRed;
                    break;
                case -4:
                    message = "Този учител не съществува.";
                    color = Color.DarkRed;
                    break;
                case -5:
                    message = "Този учител вече е записан за друг час.";
                    color = Color.DarkRed;
                    break;
                case -6:
                    message = "Тази стая вече е заета.";
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
                    message = "Този час вече е зает.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този клас не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този час не съществува.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Този предмет не съществува.";
                    color = Color.DarkRed;
                    break;
                case -4:
                    message = "Този учител не съществува.";
                    color = Color.DarkRed;
                    break;
                case -5:
                    message = "Този учител вече е записан за друг час.";
                    color = Color.DarkRed;
                    break;
                case -6:
                    message = "Тази стая вече е заета.";
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
                    message = "Този час от програмата не беше изтрит.";
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
