using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security;
using System.Web;
using System.IO;
using System.Web.UI.WebControls;

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
        public static bool isUserAuthorized(int lowerThanRank)
        {
            if (HttpContext.Current.Session["Rank"] != null)
            {
                if ((int)HttpContext.Current.Session["Rank"] < lowerThanRank)
                {
                    return true;
                }
                else
                    return false;
            }
            else
                return false;
        }
        public static bool hasTeacherClass()
        {
           if (HttpContext.Current.Session["ClassId"]!= null)
            {
                if ((int)HttpContext.Current.Session["ClassId"] > 0)
                    return true;
                else
                    return false;
            }
            else
                return false;
        }
        public static void resetSessionInfo()
        {
            HttpContext.Current.Session["UserName"] = null;
            HttpContext.Current.Session["Rank"] = null;
            HttpContext.Current.Session["EGN"] = null;
            HttpContext.Current.Session["ClassId"] = null;
        }
        public static void redirectUser(bool isUserAuthorized,string toPage)
        {
            if (!isUserAuthorized)
            {
                resetSessionInfo();
                HttpContext.Current.Server.Transfer(toPage+".aspx", false);
            }
        }
        public static void hideFirstRow(ref System.Web.UI.WebControls.GridView gridView)
        {
            gridView.Rows[0].Visible = false;
        }
        public static void hideColumns(int[] columns, ref System.Web.UI.WebControls.GridView gridView)
        {
            for (int i = 0; i < columns.Length; i++)
            {
                gridView.Columns[columns[i]].Visible = false;
            }
        }
        public static byte[] getImage(System.Web.UI.WebControls.FileUpload fileUploadPhoto)
        {
            Stream fileStream = fileUploadPhoto.PostedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(fileStream);

            return binaryReader.ReadBytes((int)fileStream.Length);
        }
        public static byte[] getImageBase64(string base64)
        {
            return Convert.FromBase64String(base64);
        }
        public static string loadImage(GridViewRowEventArgs e)
        {
            //Get the row.
            System.Data.DataRowView dataRowView = (System.Data.DataRowView)e.Row.DataItem;

            //The database can have null photos, so every null photo is set to Missing.png from the project folder.
            if (!Convert.IsDBNull(dataRowView["Photo"]))
                {
                    //Convert the array to a readable image.
                    return "data:Image/jpg;base64," + Convert.ToBase64String((byte[])dataRowView["Photo"]);
                }
                else
                {
                    return @"..\..\Images\Missing.png";
                }
        }
        public static void SetMessage(ObjectDataSourceStatusEventArgs e, ref Label lblMessage)
        {
            //get output parameters and assing to label
            lblMessage.Text = e.OutputParameters["Message"].ToString();
            lblMessage.ForeColor = (System.Drawing.Color)e.OutputParameters["Color"];
        }
        public static void getAndUpdateImage(GridViewUpdateEventArgs e,ref GridView gridView,ref ObjectDataSource getAndUpdate)
        {
            //Find the uploaded image and convert it to array, then to string and store it.
            FileUpload fileUpload = gridView.Rows[e.RowIndex].FindControl("fileUploadPhoto") as FileUpload;
            if (fileUpload.HasFile)
            {
                byte[] img = BusinessLayer.SharedMethods.getImage(fileUpload);
                string base64 = Convert.ToBase64String(img);

                getAndUpdate.UpdateParameters["Photo"].DefaultValue = base64;
            }
        }
        public static void setPhotoPerRowOnUpdate(GridViewRowEventArgs e, ref GridView gridView)
        {
            //Check if the row is a datarow AND it is NOT edit row.
            if (e.Row.RowType == DataControlRowType.DataRow && gridView.EditIndex != e.Row.RowIndex)
            {
                //Call method to get url, return either Missing.png or string image
                (e.Row.FindControl("Photo") as Image).ImageUrl = BusinessLayer.SharedMethods.loadImage(e);
            }
        }
    }
}
