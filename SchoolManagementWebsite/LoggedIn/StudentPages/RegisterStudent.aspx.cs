using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.StudentPages
{
    public partial class RegisterStudent : System.Web.UI.Page
    {
        int doctorId = -1;
        BusinessLayer.Student.Register student = new BusinessLayer.Student.Register();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            fileUploadPhoto.Attributes.Clear();
        }

        protected void btncheckDoctorId_Click(object sender, EventArgs e)
        {
            int result = student.getDoctorId(txtDoctor.Text);
                            hasDoctorImage.Visible = true;

            if (result == 0)
            {
                hasDoctorImage.ImageUrl = "/Images/Remove.png";
            }
            else
            {
                hasDoctorImage.ImageUrl = "/Images/Check.png";
                doctorId = result;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Student.Register student = new BusinessLayer.Student.Register();

                if (doctorId == -1)
                {
                    doctorId = student.getDoctorId(txtDoctor.Text);
                }
                    object[] result = student.register(txtFirstName.Text, txtMiddleName.Text, txtFamilyName.Text, txtEGN.Text, txtNumber.Text
    , txtAdress.Text, Convert.ToInt32(ddlLetter.SelectedValue), fileUploadPhoto, doctorId, txtParentName.Text
    , txtParentNumber.Text, txtParentAdress.Text);

                lblMessage.Text = result[0].ToString();
                lblMessage.ForeColor = (System.Drawing.Color)result[1];
            }
        }
    }
}