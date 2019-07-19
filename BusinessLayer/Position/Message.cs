using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Position
{
    internal class Message
    {
        public void Create(int resultNumber, out string message, out Color color)
        {
            switch (resultNumber)
            {
                case 1:
                    message = "Успешнo записване.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Длъжност с това име вече е записана.";
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
                    message = "Успешна промяна на длъжността.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Длъжност с това име вече е записана.";
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
                    message = "Успешно изтриване на длъжността.";
                    color = Color.Green;
                    break;
                case 0:
                    message = "Длъжността не е изтрита.";
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
