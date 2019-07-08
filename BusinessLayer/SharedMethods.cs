﻿using System;
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
        public static void redirectUser(bool isUserAuthorized,string toPage)
        {
            if (!isUserAuthorized)
            {
                HttpContext.Current.Server.Transfer(toPage+".aspx", false);
                HttpContext.Current.Session["Rank"] = 10;
                HttpContext.Current.Session["EGN"] = null;
                HttpContext.Current.Session["UserName"] = null;
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

            //Check if the row is a datarow AND it is NOT edit row.
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
        public static Label SetMessage(ObjectDataSourceStatusEventArgs e,Label lblMessage)
        {
            lblMessage.Text = e.OutputParameters["Message"].ToString();
            lblMessage.ForeColor = (System.Drawing.Color)e.OutputParameters["Color"];
            //get output parameters and assing to label

            return lblMessage;
        }
    }
}
