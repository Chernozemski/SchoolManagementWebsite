using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.GradePages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Grade");
        }

        protected void gridViewGrade_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gridViewGrade.EditIndex == e.Row.RowIndex)
            {
                (e.Row.FindControl("ddlStudentInClass") as DropDownList).SelectedValue = (e.Row.FindControl("lblStudentInClassId") as Label).Text;

            }
        }
        protected void getAndUpdateGrade_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void getAndUpdateGrade_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["ClassId"] = ddlClass.SelectedValue;

            if (studentInClassId > 0)
            {
                e.InputParameters["StudentInClassId"] = studentInClassId;
            }
            if (lessonId > 0)
            {
                e.InputParameters["LessonId"] = lessonId;
            }
        }

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridViewGrade.Visible = true;
        }
                private static int studentInClassId = 0;
        private static int lessonId = 0;
        protected void ddlStudentInClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            studentInClassId = int.Parse((sender as DropDownList).SelectedValue);
        }

        protected void ddlLesson_SelectedIndexChanged(object sender, EventArgs e)
        {
            lessonId = int.Parse((sender as DropDownList).SelectedValue);
        }
    }
}