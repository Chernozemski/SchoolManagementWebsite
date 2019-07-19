using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Budget
{
    internal class MessageBudget
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
                    message = "Този тип операция не е записан.";
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
                    message = "Този тип операция не е записан.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Този издател не е записан.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този предмет не е записан.";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "Количеството учебници не може да е отрицателно.";
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
                    message = "Този тип операция не е изтрита.";
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
