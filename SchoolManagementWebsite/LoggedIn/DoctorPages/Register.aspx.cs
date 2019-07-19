using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.DoctorPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Doctor");
        }

        protected void register_Click(object sender, EventArgs e)
        {
            BusinessLayer.Doctor.CRUD crud = new BusinessLayer.Doctor.CRUD();
            string Message;
            System.Drawing.Color Color;
            crud.Create(txtFirstName.Text, txtFamilyName.Text, txtPhoneNumber.Text,out Message,out Color);

            lblMessage.Text = Message;
            lblMessage.ForeColor = Color;
        }
    }
}