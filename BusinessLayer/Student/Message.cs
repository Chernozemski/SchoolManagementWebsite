using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Student
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
                case 0 :
                    message = "Този ученик вече е записан";
                    color = Color.DarkRed; 
                    break;
                case -1:
                    message = "Този клас не съществува";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Този доктор не съществува";
                    color = Color.DarkRed;
                    break;
                case -3:
                    message = "ЕГН-то трябва да е 10 цифри";
                    color = Color.DarkRed;
                    break;
                case -4:
                    message = "Телефонният номер трябва да е 10 цифри";
                    color = Color.DarkRed;
                    break;
                case -5:
                    message = "Телефонният номер на родителя трябва да е 10 цифри";
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
                case 1:
                    message = "Успешно променяне на запис с сменяне на снимката.";
                    color = Color.Green;
                    break;
                case 2:
                    message = "Успешно променяне на запис без сменяне на снимката.";
                    color = Color.Green;
                    break;
                case 0 :
                    message = "Ученик с това ЕГН вече съществува.";
                    color = Color.DarkRed;
                    break;
                case -1:
                    message = "Доктор с това Id не съществува.";
                    color = Color.DarkRed;
                    break;
                case -2:
                    message = "Клас с това Id не съществува.";
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
                case 1:
                    message = "Успешно изтриване на ученическият запис.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Не беше изтрит ученическият запис.";
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
