using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.ClassPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(10), "Class");

            if (IsPostBack)
            {
                gridViewStudent.Visible = true;
                lblStudentCount.Visible = true;
            }
        }

        protected void gridViewStudent_DataBinding(object sender, EventArgs e)
        {
            if (gridView.SelectedIndex > -1)
            {
                gridViewStudent.Caption = "Клас :" +(gridView.Rows[gridView.SelectedIndex].FindControl("lblGrade") as Label).Text
    + (gridView.Rows[gridView.SelectedIndex].FindControl("lblLetter") as Label).Text;
            }
        }

        protected void gridViewStudent_DataBound(object sender, EventArgs e)
        {
            lblStudentCount.Text = "Брой ученици :" + gridViewStudent.Rows.Count.ToString();
        }

        protected void gridView_DataBound(object sender, EventArgs e)
        {
            lblClassCount.Text = "Брой класове :" + gridView.Rows.Count;
        }
    }
}