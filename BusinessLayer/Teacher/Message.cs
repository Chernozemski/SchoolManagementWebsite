using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace BusinessLayer.Teacher
{
    internal class Message
    {
        public void Register(int resultNum,out string message,out Color color)
        {
            switch (resultNum)
            {
                case 1:
                    message="Успешно вписване.";
                    color =Color.Green;
                    break;
                case -1:
                    message="Учителят вече е вписван.";
                    color =Color.DarkRed;
                    break;
                case 0:
                    message="Длъжността директор е заета.";
                    color=Color.DarkRed;
                    break;
                default:
                    message="Възникна проблем, който не е разпознат.";
                    color=Color.DarkRed;
                    break;
            }
        }
        public void Update(int resultNum, out string message, out Color color)
        {
            switch (resultNum)
            {
                case 1:
                    message="Успешно редактиране.";
                    color=Color.Green;
                    break;
                case 2 :
                    message="Успешно редактиране без променяне на снимка.";
                                            color=Color.Green;
                    break;
                case 0:
                    message="Учител с този номер не е намерен."  ;
                    color=Color.DarkRed;
                    break;
                case -1:
                    message="Избраният предмет не съществува."               ;   
                    color=Color.DarkRed;
                    break;
                case -2:
                    message="Длъжността директор вече е заета.";
                    color=Color.DarkRed;
                    break;
                default:
                    message="Възникна проблем, който не е разпознат.";
                    color=Color.DarkRed;
                    break;
            }
        }
        public void Delete(int resultnum, out string message, out Color color)
        {
            switch (resultnum)
            {
                case 1 :
                    message = "Успешно беше премахнат този запис.";
                    color = Color.Green;
                    break;
                case 0 :
                    message = "Записът на учителя не беше изтрит.";
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
