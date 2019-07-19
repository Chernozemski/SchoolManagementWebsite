using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.StudentPages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Student");
        }

        protected void gridViewStudent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            BusinessLayer.SharedMethods.getAndUpdateImage(e, ref gridViewStudent,ref getAndUpdateStudent);
        }
        protected void gridViewStudent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            BusinessLayer.SharedMethods.setPhotoPerRowOnUpdate(e, ref gridViewStudent);
        }
        protected void getAndUpdateStudent_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }
    }
}