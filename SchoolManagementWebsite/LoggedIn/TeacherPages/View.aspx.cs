using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.TeacherPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(10), "Teacher");
        }

        protected void getTeacher_Load(object sender, EventArgs e)
        {
            if (!BusinessLayer.SharedMethods.isUserAuthorized(3))
            {
                BusinessLayer.SharedMethods.hideColumns(new int[] { 4, 5 }, ref getTeacher);
            }
        }

        protected void getTeacher_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.DataItem != null)
                (e.Row.FindControl("Photo") as Image).ImageUrl = BusinessLayer.SharedMethods.loadImage(e);
        }

        protected void getTeacher_DataBound(object sender, EventArgs e)
        {
            lblTeacherCount.Text = "Брой учители :" + getTeacher.Rows.Count;
        }
    }
}