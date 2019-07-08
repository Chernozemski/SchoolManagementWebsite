using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.DoctorPages
{
    public partial class RegisterDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Doctor");
        }

        protected void register_Click(object sender, EventArgs e)
        {
            BusinessLayer.Doctor.Register doctor = new BusinessLayer.Doctor.Register();
            object[] result = doctor.register(txtFirstName.Text, txtFamilyName.Text, txtPhoneNumber.Text);

            lblMessage.Text = result[0].ToString();
            lblMessage.ForeColor = (System.Drawing.Color)result[1];
        }
    }
}