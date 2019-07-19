using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.ClassPages
{
    public partial class Update : System.Web.UI.Page
    {
        private char letter;
        private int grade;
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Class");
        }

        protected void getAndUpdateClass_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void gridViewClass_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gridViewClass.EditIndex == e.Row.RowIndex)
            {
                (e.Row.FindControl("ddlGrade") as DropDownList).Items.AddRange(setGrade());
                (e.Row.FindControl("ddlGrade") as DropDownList).SelectedValue = (e.Row.FindControl("lblGrade") as Label).Text;

                (e.Row.FindControl("ddlLetter") as DropDownList).Items.AddRange(setLetter());
                (e.Row.FindControl("ddlLetter") as DropDownList).SelectedValue = (e.Row.FindControl("lblLetter") as Label).Text;

                //(e.Row.FindControl("ddlSpecialization") as DropDownList).SelectedValue = (e.Row.FindControl("lblSpecializationId") as Label).Text;

                //(e.Row.FindControl("ddlTeacher") as DropDownList).SelectedValue = (e.Row.FindControl("lblFullTeacherName") as Label).Text;
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
        private ListItem[] setLetter()
        {
            ListItem[] li = new ListItem[32];
            int letter = 1040; // Bulgarian A

            for (int i = 0; i <= 31; i++)
            {
                li[i] = new ListItem(((char)letter).ToString(), ((char)letter).ToString());
                letter++;
            }
            return li;
        }

        protected void getAndUpdateClass_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            //If the drop down list index did not change, then skip this part, it will assign its original value.
            if (letter != 0)
            e.InputParameters["Letter"] = letter;

            if (grade != 0)
                e.InputParameters["Grade"] = grade;
        }
        protected void ddlLetter_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Because the selected value does not get saved on updating (dynamically using setLetter()) declare a variable that stores it and assign it to getAndUpdateClass_Updating event.
            letter = (sender as DropDownList).SelectedValue[0];
        }

        protected void ddlGrade_SelectedIndexChanged(object sender, EventArgs e)
        {
            grade = Convert.ToInt32((sender as DropDownList).SelectedValue);
        }
    }
}