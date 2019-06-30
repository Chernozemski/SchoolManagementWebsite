using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace SchoolManagementWebsite.RegisterTeacher
{
    public partial class RegisterUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Teacher.RegisterAccount teacher = new BusinessLayer.Teacher.RegisterAccount();
                object[] result = teacher.register(txtUserName.Text, txtPassword.Text, txtEGN.Text);
                lblMessage.Text = (string)result[0];
                lblMessage.ForeColor = (System.Drawing.Color)result[1];
            }
        }
    }
}