using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BookPages
{
    public partial class Update : System.Web.UI.Page
    {
        private int grade;
        private int SubjectId;
        private int PublisherId;
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Book");
        }

        protected void getAndUpdateBook_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void publishedYearValidator_Load(object sender, EventArgs e)
        {
            (sender as RangeValidator).MaximumValue = DateTime.Now.Year.ToString();
        }

        protected void gridViewBook_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gridViewBook.EditIndex == e.Row.RowIndex)
            {
                (e.Row.FindControl("ddlGrade") as DropDownList).Items.AddRange(setGrade());
                (e.Row.FindControl("ddlGrade") as DropDownList).SelectedValue = (e.Row.FindControl("lblGrade") as Label).Text;

                (e.Row.FindControl("ddlSubject") as DropDownList).SelectedValue = (e.Row.FindControl("lblSubjectId") as Label).Text;

                (e.Row.FindControl("ddlPublisher") as DropDownList).SelectedValue = (e.Row.FindControl("lblPublisherId") as Label).Text;
            }
        }
        private ListItem[] setGrade()
        {
            ListItem[] li = new ListItem[12];

            for (int i = 0; i < 12; i++)
            {
                li[i] = new ListItem((i + 1).ToString(), (i + 1).ToString());
            }
            return li;
        }

        protected void getAndUpdateBook_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            //If the drop down list index did not change, then skip this part, it will assign its original value.
            if (grade != 0)
                e.InputParameters["Grade"] = grade;

            if (SubjectId != 0)
                e.InputParameters["SubjectId"] = SubjectId;

            if (PublisherId != 0)
                e.InputParameters["PublisherId"] = PublisherId;
        }

        protected void ddlGrade_SelectedIndexChanged(object sender, EventArgs e)
        {
            grade = Convert.ToInt32((sender as DropDownList).SelectedValue);
        }

        protected void getAndUpdateBook_Updated1(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e,ref lblMessage);
        }

        protected void ddlPublisher_SelectedIndexChanged(object sender, EventArgs e)
        {
            PublisherId = Convert.ToInt32((sender as DropDownList).SelectedValue);
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubjectId = Convert.ToInt32((sender as DropDownList).SelectedValue);
        }
    }
}