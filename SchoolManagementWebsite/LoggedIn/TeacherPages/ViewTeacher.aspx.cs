using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.TeacherPages
{
    public partial class ViewTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_DataBinding(object sender, EventArgs e)
        {
            if (Session["Rank"].ToString() == "1" || Session["Rank"].ToString() == "2")
            {
                // adress (3) and position (4) 
                gridViewTeacherInfo.Columns[3].Visible = true;
                gridViewTeacherInfo.Columns[4].Visible = true;
            }
        }
    }
}