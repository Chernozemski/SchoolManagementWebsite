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

namespace SchoolManagementWebsite.Validation
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetDropDownListDefaultValue();
            }
        }
        private void SetDropDownListDefaultValue()
        {
            ddlSubject.Items.Add(new ListItem("Моля изберете предмет", "0"));
            ddlPosition.Items.Add(new ListItem("Моля изберете длъжност", "0"));
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string cs = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spAddTeacher_tblTeacherInfo",con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter firstName = new SqlParameter("@FirstName", txtFirstName.Text);
                    SqlParameter familyName = new SqlParameter("@FamilyName", txtFamilyName.Text);
                    SqlParameter subject = new SqlParameter("@SubjectId", ddlSubject.SelectedItem.Value);
                    SqlParameter EGN = new SqlParameter("@EGN", txtEGN.Text);
                    SqlParameter phoneNum = new SqlParameter("@Phonenum", txtNumber.Text);
                    SqlParameter adress = new SqlParameter("@Adress", txtAdress.Text);
                    SqlParameter position = new SqlParameter("@Position", ddlPosition.SelectedItem.Value);

                    cmd.Parameters.Add(firstName);
                    cmd.Parameters.Add(familyName);
                    cmd.Parameters.Add(subject);
                    cmd.Parameters.Add(EGN);
                    cmd.Parameters.Add(phoneNum);
                    cmd.Parameters.Add(adress);
                    cmd.Parameters.Add(position);

                    con.Open();
                    if ((int)cmd.ExecuteScalar() == 0)
                    {
                        lblMessage.ForeColor= System.Drawing.Color.Red;
                        lblMessage.Text ="Длъжността директор вече е заета.";
                    }
                    else
                    {
                        lblMessage.ForeColor= System.Drawing.Color.Green;
                        lblMessage.Text ="Успешно регистриране";
                    }
                    con.Close();
                }
            }
        }
    }
}