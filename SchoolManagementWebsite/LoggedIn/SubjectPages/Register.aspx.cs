using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.SubjectPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Subject");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            BusinessLayer.Subject.CRUD register = new BusinessLayer.Subject.CRUD();

            string Message;
            System.Drawing.Color color;

            register.Create(txtSubjectName.Text,out Message,out color);

            lblMessage.Text = Message;
            lblMessage.ForeColor = color;
        }
    }
}