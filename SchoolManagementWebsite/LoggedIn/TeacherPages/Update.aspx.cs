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
            if (!IsPostBack)
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Teacher");
        }

        protected void gridViewUpdateTeacher_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            getAndUpdateImage(e);
        }
        protected void gridViewUpdateTeacher_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            setPhotoPerRow(e);
        }

        protected void getAndUpdateTeacher_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, lblMessage);
        }

        private void getAndUpdateImage(GridViewUpdateEventArgs e)
        {
            //Find the uploaded image and convert it to array, then to string and store it.
            FileUpload fileUpload = gridViewUpdateTeacher.Rows[e.RowIndex].FindControl("fileUploadPhoto") as FileUpload;
            if (fileUpload.HasFile)
            {
                byte[] img = BusinessLayer.SharedMethods.getImage(fileUpload);
                string base64 = Convert.ToBase64String(img);

                getAndUpdateTeacher.UpdateParameters["Photo"].DefaultValue = base64;
            }
        }
        private void setPhotoPerRow(GridViewRowEventArgs e)
        {
            //Check if the row is a datarow AND it is NOT edit row.
            if (e.Row.RowType == DataControlRowType.DataRow && gridViewUpdateTeacher.EditIndex != e.Row.RowIndex)
            {
                //Call method to get url, return either Missing.png or string image
                (e.Row.FindControl("Photo") as Image).ImageUrl = BusinessLayer.SharedMethods.loadImage(e);
            }
        }
    }
}