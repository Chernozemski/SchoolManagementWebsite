using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.StudentPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!BusinessLayer.SharedMethods.isUserAuthorized(3))
            {
                BusinessLayer.SharedMethods.hideColumns(new int[]{3,5,8},ref viewStudent);
            }
        }

        protected void viewStudent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //On binding each row get the database value and check 
            //if the image exists, if not bind it to image from website "Missing.png"
            System.Data.DataRowView dataRowView = (System.Data.DataRowView)e.Row.DataItem;

            if (dataRowView != null)
                if (!Convert.IsDBNull(dataRowView["Photo"]))
                {
                    string url = "data:Image/jpg;base64," + Convert.ToBase64String((byte[])dataRowView["Photo"]);

                    (e.Row.FindControl("img") as Image).ImageUrl = url;
                }
                else
                {
                    string url = @"..\..\Images\Missing.png";
                    (e.Row.FindControl("img") as Image).ImageUrl = url;
                }
        }
        protected void viewStudentObject_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //On binding each row get the database value and check 
            //if the image exists, if not bind it to image from website "Missing.png"
            System.Data.DataRowView dataRowView = (System.Data.DataRowView)e.Row.DataItem;

            if (dataRowView != null)
                if (!Convert.IsDBNull(dataRowView["Photo"]))
                {
                    string url = "data:Image/jpg;base64," + Convert.ToBase64String((byte[])dataRowView["Photo"]);

                    (e.Row.FindControl("Photo") as Image).ImageUrl = url;
                }
                else
                {
                    string url = @"..\..\Images\Missing.png";
                    (e.Row.FindControl("Photo") as Image).ImageUrl = url;
                }
        }

        protected void viewStudent_DataBound(object sender, EventArgs e)
        {
            lblStudentCount.Text = "Брой ученици :" +viewStudent.Rows.Count;
        }
    }
}