using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.GradePages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(10), "Grade");
        }
        protected void btnregister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Grade.CRUD grade = new BusinessLayer.Grade.CRUD();

                string message;
                System.Drawing.Color color;
                grade.Create(int.Parse(ddlClass.SelectedValue),int.Parse(ddlGrade.SelectedValue), int.Parse(ddlLesson.SelectedValue), int.Parse(ddlStudent.SelectedValue)
                    ,Session["EGN"].ToString(), out message, out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;
            }
        }
    }
}