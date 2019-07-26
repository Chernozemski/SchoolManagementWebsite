using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.ClassStudentPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "ClassStudent");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Class.CRUDClassStudent crud = new BusinessLayer.Class.CRUDClassStudent();

                string message;
                System.Drawing.Color color;
                crud.Create(int.Parse(ddlStudentClassId.SelectedValue),int.Parse(ddlClass.SelectedValue), int.Parse(ddlStudent.SelectedValue), int.Parse(txtAbsent.Text),
                    int.Parse(txtExcusedAbsent.Text), float.Parse(txtLate.Text), out message, out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;

                if (lblMessage.ForeColor == System.Drawing.Color.Green)
                {
                    ddlStudent.Items.Remove(ddlStudent.SelectedItem);
                }
            }
        }

        protected void ddlStudentClassId_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlStudentClassId.Items.Add(new ListItem("Изберете номер на ученика", "0"));
                for (int i = 1; i <= 50; i++)
                {
                    ddlStudentClassId.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
        }
    }
}