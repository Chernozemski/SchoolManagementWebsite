using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.LessonPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BusinessLayer.SharedMethods.isUserAuthorized(3) || BusinessLayer.SharedMethods.hasTeacherClass())
            {
            BusinessLayer.SharedMethods.redirectUser(true,"Lesson");
            }
        }

        protected void gridViewLesson_DataBound(object sender, EventArgs e)
        {
            lblLessonCount.Text = "Брой уроци :"+ gridViewLesson.Rows.Count;
        }

        protected void ddlClass_DataBinding(object sender, EventArgs e)
        {
            if (BusinessLayer.SharedMethods.isUserAuthorized(3))
            {
                ddlClass.Enabled = true;
            }
            else if (BusinessLayer.SharedMethods.hasTeacherClass())
            {
                ddlClass.Enabled = false;
                ddlClass.SelectedValue = Session["ClassId"].ToString();
                ddlClass.SelectedItem.Text = "";
            }
        }
    }
}