using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using DataAccessLayer;
using System.Security;

namespace BusinessLayer.Teacher
{
            public class Login
            {
                DataAccessLayer.Teacher.LoginAccount teacher = new DataAccessLayer.Teacher.LoginAccount();
                DataAccessLayer.Teacher.HelperMethods methods = new DataAccessLayer.Teacher.HelperMethods();

                public string login(string username, string password)
                {
                    //Check if user is valid
                    int result = isUserValid(username, password);

                    //Assign sessions OR return message error
                    if (result==1)
                    {
                        int rank = getRank(username);
                        //EGN always is proper
                        string EGN = getEGN(username);
                        assingSession(username,rank,EGN);
                    }

                    return Messages(result);
                }
                private int isUserValid(string username, string password)
                {
                    string encryptedPassword = SharedMethods.encryptPassword(password);
                    int result = teacher.Login(username, encryptedPassword);

                    return result;
                }
                private string Messages(int result)
                {
                    if (result == 1)
                    {
                        return "";
                    }
                    else
                    {
                        return "Грешно име / парола или потребителят не съществува.";
                    }
                }
                private void assingSession(string username,int Rank,string EGN)
                {
                 HttpContext.Current.Session["UserName"] = username;
                 HttpContext.Current.Session["Rank"] = Rank;
                 HttpContext.Current.Session["EGN"] = EGN;
                        
                        //Goto school system
                 System.Web.Security.FormsAuthentication.RedirectFromLoginPage(username, false);
                }
                private int getRank(string username)
                {
                    return methods.getSessionRank(username);
                }
                private string getEGN(string username)
                {
                    return methods.getEGN(username).ToString();
                }
            }
}

