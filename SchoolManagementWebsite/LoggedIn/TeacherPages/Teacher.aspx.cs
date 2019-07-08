using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn
{
    public partial class Teacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void directorPanel_Load(object sender, EventArgs e)
        {
            directorPanel.Visible = BusinessLayer.SharedMethods.isUserAuthorized(2);
        }
    }
}