using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.TimeTablePages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "TimeTable");
        }

        protected void ddlLessonHour_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlLessonHour.Items.Add(new ListItem("Изберете час","0"));
                for (int i = 1; i <= 10; i++)
                {
                    ddlLessonHour.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }

        protected void ddlHour_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlHour.Items.Add(new ListItem("Изберете час", "-1"));
                for (int i = 0; i <= 23; i++)
                {
                    if (i < 10)
                    {
                        ddlHour.Items.Add(new ListItem("0" + i.ToString(), i.ToString()));
                    }
                    else
                        ddlHour.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }

        protected void ddlMinutes_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlMinutes.Items.Add(new ListItem("Изберете минути", "-1"));
                for (int i = 0; i <= 59; i+=5)
                {
                    if (i < 10)
                    {
                        ddlMinutes.Items.Add(new ListItem("0"+i.ToString(), i.ToString()));
                    }
                    else
                    ddlMinutes.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }

        protected void ddlShift_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlShift.Items.Add(new ListItem("Изберете смяна", "0"));
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.TimeTable.CRUD crud = new BusinessLayer.TimeTable.CRUD();
                string time = ddlHour.SelectedValue + ":" + ddlMinutes.SelectedValue;
                string message;
                System.Drawing.Color color;
                crud.Create(int.Parse(ddlLessonHour.SelectedValue), DateTime.Parse(time), int.Parse(ddlShift.SelectedValue), out message, out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;
            }
        }
    }
}