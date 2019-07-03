using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SchoolManagementWebsite.RegisterTeacher
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized());

            if (!IsPostBack)
            {
                SetDropDownListDefaultValue();
            }
        }
        private void SetDropDownListDefaultValue()
        {
            ddlSubject.Items.Add(new ListItem("Изберете предмет", "0"));
            ddlPosition.Items.Add(new ListItem("Изберете длъжност", "0"));
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Teacher.RegisterInfo teacher = new BusinessLayer.Teacher.RegisterInfo();

                object[] result = teacher.Register(txtFirstName.Text,txtMiddleName.Text, txtFamilyName.Text, ddlSubject.SelectedValue,
                    txtEGN.Text, txtNumber.Text, txtAdress.Text, ddlPosition.SelectedValue,fileUploadPhoto);
                
                lblMessage.Text = result[0].ToString();
                lblMessage.ForeColor = (System.Drawing.Color)result[1];
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            fileUploadPhoto.Attributes.Clear();
        }
    }
}