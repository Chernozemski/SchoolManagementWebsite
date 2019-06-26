using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementWebsite.Validation
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;

             using (SqlConnection con = new SqlConnection(cs))
             {
                 SqlCommand command = new SqlCommand("spLoginTeacher_tblTeacherAccount", con);
                 command.CommandType = CommandType.StoredProcedure;

                 string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

                 SqlParameter userName = new SqlParameter("@UserName", txtUserName.Text);
                 SqlParameter password = new SqlParameter("@Password", encryptedPassword);

                 command.Parameters.Add(userName);
                 command.Parameters.Add(password);

                 con.Open();
                 int count = (int)command.ExecuteScalar();
                 con.Close();

                 if (count == 1)
                 {
                     FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
                     Session["UserName"] = txtUserName.Text;
                 }
                 else
                 {
                     lblMessage.Text = "Грешно име / парола или потребителят не съществува.";
                     lblMessage.ForeColor = System.Drawing.Color.Red;
                 }
             }
        }
    }
}