using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.Programme
{
    public partial class Remove : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Programme");
        }

        protected void getAndDeleteProgramme_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e,ref lblMessage);
        }
    }
}