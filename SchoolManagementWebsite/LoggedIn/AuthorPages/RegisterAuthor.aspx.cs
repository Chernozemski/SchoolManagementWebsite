using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.AuthorPages
{
    public partial class RegisterAuthor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Author");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            BusinessLayer.Author.Register author = new BusinessLayer.Author.Register();

            object[] result = author.register(txtPublisher.Text);

            lblMessage.Text = result[0].ToString();
            lblMessage.ForeColor = (System.Drawing.Color)result[1];
        }
    }
}