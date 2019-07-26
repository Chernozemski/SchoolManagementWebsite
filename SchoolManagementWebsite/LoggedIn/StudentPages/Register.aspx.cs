using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.StudentPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2),"Student");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            fileUploadPhoto.Attributes.Clear();
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Student.CRUDInfo crud = new BusinessLayer.Student.CRUDInfo();

                string message;
                System.Drawing.Color color;
                crud.Create(txtFirstName.Text, txtMiddleName.Text, txtFamilyName.Text, txtEGN.Text,
                    txtNumber.Text, txtAdress.Text, fileUploadPhoto, int.Parse(ddlDoctor.SelectedValue), txtParentName.Text,
                    txtParentNumber.Text, txtParentAdress.Text, out message, out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;
            }
        }
    }
}