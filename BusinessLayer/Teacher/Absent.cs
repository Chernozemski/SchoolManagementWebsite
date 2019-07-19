using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BusinessLayer.Teacher
{
    public class Absent
    {
        DataAccessLayer.Teacher.Absent teacher = new DataAccessLayer.Teacher.Absent();
        DataAccessLayer.Teacher.HelperMethods methods = new DataAccessLayer.Teacher.HelperMethods();
        public object[] absent(string AbsentTeacher,
            string lessonsAbsent, string substituteTeacher)
                {
                    DateTime onDate = DateTime.Parse(DateTime.Now.ToString("dddd, dd MMMM yyyy"));
                    string SenderEGN = HttpContext.Current.Session["EGN"].ToString();
                    int SenderRank = (int)HttpContext.Current.Session["Rank"];
                    string absentTeacherEGN = methods.getTeacherEGN(AbsentTeacher);
                    string substituteTeacherEGN = methods.getTeacherEGN(substituteTeacher);

                    if (absentTeacherEGN == "0")
                    {
                        return new object[] { "Няма записан учител под това име.", Color.DarkRed };
                    }
                    else if (substituteTeacherEGN == "0")
                    {
                        return new object[] { "Няма записан заместник учител под това име.", Color.DarkRed };
                    }
                    else if (substituteTeacherEGN == absentTeacherEGN)
                    {
                        return new object[] { "Не може заместник учител да се запише като отсъстващ.", Color.DarkRed };
                    }
                    else if (lessonsAbsent.Length > 1 && SenderRank > 2)
                    {
                        return new object[] { "Нямате правата да запишете повече от 1 час на заместване.", Color.DarkRed };
                    }
                    else if (SenderEGN != substituteTeacherEGN && SenderRank > 2)
                    {
                        return new object[] { "Нямате правата да запишете друг учител като заместник.", Color.DarkRed };
                    }
                    else
                    {
                        int result = teacher.absent(SenderEGN, SenderRank, absentTeacherEGN, string.Join(" ", lessonsAbsent), onDate, substituteTeacherEGN);

                        return Message(result);
                    }
                }
        public object[] Message(int result)
        {
            switch (result)
            {
                case 1:
                    return new object[] { "Записано.", Color.Green };
                case 0:
                    return new object[] { "Вие не се заместващият учител.", Color.DarkRed };
                //-1
                default:
                    return new object[] { "Не се избрали час или сте избрали повече от 1 час", Color.DarkRed };
            }
        }
    }

}
