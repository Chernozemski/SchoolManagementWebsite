using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.Specialization
{
    public partial class Specialization : System.Web.UI.Page
    {
        bool isUserAuthorized = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(3), "../ClassPages/Class");
        }

        protected void directorPanel_Load(object sender, EventArgs e)
        {
            directorPanel.Visible = isUserAuthorized;
        }
    }
}