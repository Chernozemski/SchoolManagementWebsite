﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.LessonPages
{
    public partial class Lesson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(10), "../Home");

        }
        protected void directorPanel_Load(object sender, EventArgs e)
        {
            directorPanel.Visible = BusinessLayer.SharedMethods.isUserAuthorized(3);
        }
        protected void teacherClassPanel_Load(object sender, EventArgs e)
        {
            if (BusinessLayer.SharedMethods.hasTeacherClass() || BusinessLayer.SharedMethods.isUserAuthorized(3))
            {
                teacherClassPanel.Visible = true;
            }
        }
    }
}