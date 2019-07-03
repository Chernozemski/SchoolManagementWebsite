using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security;
using System.Web;
using System.IO;

namespace BusinessLayer
{
    public class SharedMethods
    {
        //Helper methods that are too small to be their own class
        //Used for encrypting,checking, setting and redirecting user,setting,filling hiding gridview rows
        public static string encryptPassword(string password)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
        }
        public static bool isUserAuthorized()
        {
            if (HttpContext.Current.Session["Rank"] != null)
            {
                if ((int)HttpContext.Current.Session["Rank"] < 3)
                {
                    return true;
                }
                else
                    return false;
            }
            else
                return false;
        }
        public static void redirectUser(bool isUserAuthorized)
        {
            if (!isUserAuthorized)
            {
                HttpContext.Current.Server.Transfer("Teacher.aspx", false);
                HttpContext.Current.Session["Rank"] = 10;
                HttpContext.Current.Session["EGN"] = null;
                HttpContext.Current.Session["UserName"] = null;
            }
        }
        public static void showPanel(bool isUserAuthorized, ref System.Web.UI.WebControls.Panel panel)
        {
            if (isUserAuthorized)
            {
                panel.Visible = true;
            }
        }
        public static void hideFirstRow(ref System.Web.UI.WebControls.GridView gridView)
        {
            gridView.Rows[0].Visible = false;
        }
        public static void showColumns(int[] columns, ref System.Web.UI.WebControls.GridView gridView)
        {
            for (int i = 0; i < columns.Length; i++)
            {
                gridView.Columns[columns[i]].Visible = true;
            }
        }
        public static byte[] getImage(System.Web.UI.WebControls.FileUpload fileUploadPhoto)
        {
            string fileName = Path.GetFileName(fileUploadPhoto.PostedFile.FileName);
            Stream fileStream = fileUploadPhoto.PostedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(fileStream);

            return binaryReader.ReadBytes((int)fileStream.Length);
        }
    }
}
