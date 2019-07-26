using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.Programme
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Programme");
        }

        protected void ddlRoom_Load(object sender, EventArgs e)
        {
            for (int i = 1; i < 50; i++)
            {
                ddlRoom.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Programme.CRUD crud = new BusinessLayer.Programme.CRUD();
                
                string message;
                System.Drawing.Color color;
                crud.Create(int.Parse(ddlClass.SelectedValue), int.Parse(ddlDay.SelectedValue), int.Parse(ddlHour.SelectedValue),
                    int.Parse(ddlSubject.SelectedValue), int.Parse(ddlRoom.SelectedValue), ddlTeacher.SelectedValue, out message, out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;
            }
        }
    }
}