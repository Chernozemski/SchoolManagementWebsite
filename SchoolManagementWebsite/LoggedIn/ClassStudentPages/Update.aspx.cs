using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.ClassStudentPages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BusinessLayer.SharedMethods.hasTeacherClass())
            {
                BusinessLayer.SharedMethods.redirectUser(true, "ClassStudent");
            }
        }

        protected void getAndUpdateStudent_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void ddlClass_DataBinding(object sender, EventArgs e)
        {
            if (BusinessLayer.SharedMethods.hasTeacherClass() || BusinessLayer.SharedMethods.isUserAuthorized(3))
            {
                ddlClass.Enabled = false;
                ddlClass.SelectedValue = Session["ClassId"].ToString();
                ddlClass.SelectedItem.Text = "";
            }
        }

        protected void gridViewClassStudent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
             if (e.Row.RowType == DataControlRowType.DataRow && gridViewClassStudent.EditIndex == e.Row.RowIndex)
            {
                (e.Row.FindControl("ddlStudentInClassId") as DropDownList).Items.AddRange(studentInClassId());
                (e.Row.FindControl("ddlStudentInClassId") as DropDownList).SelectedValue = (e.Row.FindControl("lblStudentInClassId") as Label).Text;
             }
        }
        private ListItem[] studentInClassId()
        {
            ListItem[] li = new ListItem[50];

            for (int i = 0; i < 50; i++)
            {
                li[i] = new ListItem((i + 1).ToString(), (i + 1).ToString());
            }
            return li;
        }
        private int StudentInClassId = 0;
        protected void getAndUpdateStudent_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            if (StudentInClassId > 0)
            {
                e.InputParameters["StudentInClassId"] = StudentInClassId;
            }
        }

        protected void ddlStudentInClassId_SelectedIndexChanged(object sender, EventArgs e)
        {
            StudentInClassId = int.Parse((sender as DropDownList).SelectedValue);
        }
    }
}