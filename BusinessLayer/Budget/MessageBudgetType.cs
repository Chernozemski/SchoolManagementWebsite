using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Budget
{
    internal class MessageBudgetType
    {
        public void Create(int ResultNumber, out string message, out Color color)
        {
            switch (ResultNumber)
            {
                case 1:
                    message = "Успешно записане.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Тази операция вече е записана.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този тип операция вече е записана.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Тази продължителност на операция не е записана.";
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
                    message = "Успешно записане.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Тази операция вече е записана.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този тип операция вече е записана.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Тази продължителност на операция не е записана.";
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
                    message = "Тази операция не е изтрита.";
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
