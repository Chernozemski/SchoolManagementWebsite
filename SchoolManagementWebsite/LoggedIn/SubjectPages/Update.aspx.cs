﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.SubjectPages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Subject");
        }

        protected void getAndUpdateSubject_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }
    }
}