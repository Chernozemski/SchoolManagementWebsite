using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security;
using System.Web;

namespace BusinessLayer.Teacher
{
    public class SharedMethods
    {
        public static string encryptPassword(string password)
        {
            return  System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
        }
        public static bool isUserAuthorized()
        {
            if ((int)HttpContext.Current.Session["Rank"] < 2)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static void redirectUser(bool isUserAuthorized)
        {
            if (!isUserAuthorized)
            {
                System.Web.Security.FormsAuthentication.RedirectToLoginPage();
                HttpContext.Current.Session["Rank"] = null;
                HttpContext.Current.Session["EGN"] = null;
                HttpContext.Current.Session["UserName"] = null;
            }
        }
    }
}
