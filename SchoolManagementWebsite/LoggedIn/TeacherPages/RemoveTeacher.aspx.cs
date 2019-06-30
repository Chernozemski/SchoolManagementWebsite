using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.TeacherPages
{
    public partial class RemoveTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.Teacher.SharedMethods.redirectUser(BusinessLayer.Teacher.SharedMethods.isUserAuthorized());
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            GridView1.Rows[0].Visible = false;
        }
    }
}