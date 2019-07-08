using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.SubjectPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void teacherList_DataBound(object sender, EventArgs e)
        {
            if (viewSubject.SelectedIndex >= 0)
            teacherList.HeaderRow.Cells[0].Text = viewSubject.SelectedRow.Cells[1].Text;
        }

        protected void viewSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            teacherList.Visible = true;
        }
    }
}