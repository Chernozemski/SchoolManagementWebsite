using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.TeacherPages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Teacher");
        }

        protected void gridViewUpdateTeacher_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            BusinessLayer.SharedMethods.getAndUpdateImage(e,ref gridViewUpdateTeacher,ref getAndUpdateTeacher);
        }
        protected void gridViewUpdateTeacher_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            BusinessLayer.SharedMethods.setPhotoPerRowOnUpdate(e, ref gridViewUpdateTeacher);
        }

        protected void getAndUpdateTeacher_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }
    }
}