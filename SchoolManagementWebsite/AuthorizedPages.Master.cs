using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Data.SqlClient;

namespace SchoolManagementWebsite
{
    public partial class AuthorizedPages : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Session["Rank"] = null;
                FormsAuthentication.RedirectToLoginPage();
            }
        }
        protected void lblUser_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                lblUser.Text = Session["UserName"].ToString();
                lblGreeting.Text = "Добър ден";
                lblGreeting.Visible = true;
            }
            else
            {
                lblUser.Text = "Моля влезте в профила си.";
                lblGreeting.Text = null;
                lblGreeting.Visible = false;
            }
        }

        protected void linkButtonExit_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Session["Rank"] = null;
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}