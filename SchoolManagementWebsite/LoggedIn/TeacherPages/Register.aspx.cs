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
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2),"Teacher");

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
                BusinessLayer.Teacher.CRUDInfo teacher = new BusinessLayer.Teacher.CRUDInfo();

                string Message;
                System.Drawing.Color Color;

                teacher.Create(txtFirstName.Text, txtMiddleName.Text, txtFamilyName.Text, Convert.ToInt32(ddlSubject.SelectedValue),
                    txtEGN.Text, txtNumber.Text, txtAdress.Text, Convert.ToInt32(ddlPosition.SelectedValue)
                    , fileUploadPhoto,out Message, out Color);

                lblMessage.Text = Message;
                lblMessage.ForeColor = Color;
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            fileUploadPhoto.Attributes.Clear();
        }
    }
}