using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

namespace SchoolManagementWebsite.Validation
{
    public partial class RegisterUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string cs = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spCreateTeacherAccount_tblTeacherAccount", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    string encryptedPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPassword.Text, "SHA1");

                    SqlParameter userName = new SqlParameter("@UserName", txtUserName.Text);
                    SqlParameter password = new SqlParameter("@Password", encryptedPassword);
                    SqlParameter EGN = new SqlParameter("@EGN", txtEGN.Text);

                    cmd.Parameters.Add(userName);
                    cmd.Parameters.Add(password);
                    cmd.Parameters.Add(EGN);

                    con.Open();
                    int result = (int)cmd.ExecuteScalar();
                    if (result == 1)
                    {
                        lblMessage.Text = "Успешно регистриране.";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else if (result == 0)
                    {
                        lblMessage.Text = "Потребител с това ЕГН е записан.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else if (result == -1)
                    {
                        lblMessage.Text = "Грешно въведено ЕГН.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else if (result == -2)
                    {
                        lblMessage.Text = "Потребител с това име е записан.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    con.Close();
                }
            }
        }
    }
}