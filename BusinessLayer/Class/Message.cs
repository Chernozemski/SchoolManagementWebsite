using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Class
{
    public class Message
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
                    message = "Учителят вече има клас.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Грешно въведена специалност.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Клас с тези елементи е записан.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Учителят не съществува.";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем който не е записан.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Update(int resultNumber, out string message, out Color color)
        {
            switch (resultNumber)
            {
                case 1:
                    message = "Успешна промяна на класа.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Този клас вече съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този учител не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този учител е записан като класен на друг клас.";
                    color = Color.DarkRed;
                    break;
                case -3 :
                    message = "Трябва да изберете клас от 1 до 12.";
                    color = Color.DarkRed;
                    break;
                case -4:
                    message = "Буквата трябва да е на български и да е от А до Я";
                    color = Color.DarkRed;
                    break;
                default:
                    message = "Възникна проблем който не е записан.";
                    color = Color.DarkRed;
                    break;
            }
        }
        public void Delete(int resultNumber, out string message, out Color color)
        {
            switch (resultNumber)
            {
                case 1:
                    message = "Успешно изтриване на запис.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Записът не е изтрит.";
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
