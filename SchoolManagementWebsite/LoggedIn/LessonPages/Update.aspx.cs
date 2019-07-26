using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.LessonPages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (BusinessLayer.SharedMethods.isUserAuthorized(2) || BusinessLayer.SharedMethods.hasTeacherClass())
            {
                BusinessLayer.SharedMethods.redirectUser(true, "../Home");
            }
        }

        protected void gridViewLesson_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gridViewLesson.EditIndex == e.Row.RowIndex)
            {
                (e.Row.FindControl("calendarOnDate") as Calendar).SelectedDate = DateTime.Parse((e.Row.FindControl("lblOnDate") as Label).Text);
                dt = DateTime.Parse((e.Row.FindControl("lblOnDate") as Label).Text);

          }
      }
        public static DateTime dt;
        protected void getAndUpdateLesson_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void calendarOnDate_SelectionChanged(object sender, EventArgs e)
        {
            dt = (sender as Calendar).SelectedDate;
        }

        protected void getAndUpdateLesson_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
                e.InputParameters["OnDate"] = dt;
        }
    }
}