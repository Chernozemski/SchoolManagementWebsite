using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementWebsite.LoggedIn.ClassPages
{
    public partial class RegisterClass : System.Web.UI.Page
    {
        private string teacherEGN;
        BusinessLayer.Class.Register Class = new BusinessLayer.Class.Register();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckTeacherEGN_Click(object sender, EventArgs e)
        {
            imgValidTeacher.Visible = true;
            teacherEGN = Class.checkTeacher(txtTeacherName.Text);
            if (teacherEGN == "0")
            {
                imgValidTeacher.ImageUrl = "/Images/Remove.png";
            }
            else
            {
                imgValidTeacher.ImageUrl = "/Images/Check.png";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            object[] result;
            if (teacherEGN == "0" || teacherEGN == null)
            {
                teacherEGN = Class.checkTeacher(txtTeacherName.Text);
                result = Class.register(Convert.ToInt32(ddlGrade.SelectedValue), txtClassLetter.Text[0], Convert.ToInt32(ddlSpecialization.SelectedValue), teacherEGN);
            }
            else
            {
                result = Class.register(Convert.ToInt32(ddlGrade.SelectedValue), txtClassLetter.Text[0], Convert.ToInt32(ddlSpecialization.SelectedValue), teacherEGN);
            }

            lblMessage.Text = result[0].ToString();
            lblMessage.ForeColor = (System.Drawing.Color)result[1];
        }
    }
}