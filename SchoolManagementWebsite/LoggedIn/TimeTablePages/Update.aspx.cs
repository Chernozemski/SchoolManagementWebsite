using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.TimeTablePages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "TimeTable");
        }

        protected void getAndDeleteTimeTable_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        private ListItem[] ddlLessonHour()
        {
            ListItem[] li = new ListItem[10];
            int hour = 1;
            for (int i = 0; i < 10; i++)
            {
                li[i] = new ListItem(hour.ToString(), hour.ToString());
                hour++;
            }
            return li;
        }
        private ListItem[] ddlHour()
        {
            ListItem[] li = new ListItem[24];
            int hour = 0;
            for (int i = 0; i <= 23; i++)
            {
                if (hour < 10)
                {
                    li[i] = new ListItem("0" + hour.ToString(), "0" + hour.ToString());
                }
                else
                    li[i] = new ListItem(hour.ToString(), hour.ToString());

                hour++;
            }
            return li;
        }
        private ListItem[] ddlMinutes()
        {
            ListItem[] li = new ListItem[12];
            int minute = 0;
            for (int i = 0; i < 12; i++)
            {
                if (minute < 10)
                {
                    li[i] = new ListItem("0" + minute.ToString(), "0" + minute.ToString());
                }
                else
                    li[i] = new ListItem(minute.ToString(), minute.ToString());

                minute += 5;
            }
            return li;
        }

        protected void gridViewTimeTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gridViewTimeTable.EditIndex == e.Row.RowIndex)
            {
                (e.Row.FindControl("ddlLessonHour") as DropDownList).Items.AddRange(ddlLessonHour());
                (e.Row.FindControl("ddlLessonHour") as DropDownList).SelectedValue = (e.Row.FindControl("lblLessonHour") as Label).Text;

                (e.Row.FindControl("ddlHour") as DropDownList).Items.AddRange(ddlHour());
                (e.Row.FindControl("ddlHour") as DropDownList).SelectedValue = (e.Row.FindControl("lblLessonTime") as Label).Text.Split(':')[0].ToString();
                OriginalHour = (e.Row.FindControl("lblLessonTime") as Label).Text.Split(':')[0].ToString();

                (e.Row.FindControl("ddlMinutes") as DropDownList).Items.AddRange(ddlMinutes());
                (e.Row.FindControl("ddlMinutes") as DropDownList).SelectedValue = (e.Row.FindControl("lblLessonTime") as Label).Text.Split(':')[1].ToString();
                OriginalMinute = (e.Row.FindControl("lblLessonTime") as Label).Text.Split(':')[1].ToString();
            }
        }
        private static int LessonHour = 0;
        private string Hour = null;
        private static string OriginalHour = null;
        private string Minute = null;
        private string OriginalMinute = null;

        protected void ddlLessonHour_SelectedIndexChanged(object sender, EventArgs e)
        {
            LessonHour = int.Parse((sender as DropDownList).SelectedValue);
        }

        protected void ddlHour_SelectedIndexChanged(object sender, EventArgs e)
        {
            Hour = (sender as DropDownList).SelectedValue;
        }

        protected void ddlMinutes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Minute = (sender as DropDownList).SelectedValue;
        }

        protected void getAndDeleteTimeTable_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            if (!String.IsNullOrEmpty(Hour) && String.IsNullOrEmpty(Minute))
            {
                e.InputParameters["LessonTime"] = DateTime.Parse(Hour + ":" + OriginalMinute);
            }
            else if (String.IsNullOrEmpty(Hour) && !String.IsNullOrEmpty(Minute))
            {
                e.InputParameters["LessonTime"] = DateTime.Parse(OriginalHour + ":" + Minute);
            }
            else if (!String.IsNullOrEmpty(Hour) && !String.IsNullOrEmpty(Minute))
            {
                e.InputParameters["LessonTime"] = DateTime.Parse(Hour + ":" + Minute);
            }
            if (LessonHour != 0)
            {
                e.InputParameters["LessonHour"] = LessonHour;
            }
        }
    }
}