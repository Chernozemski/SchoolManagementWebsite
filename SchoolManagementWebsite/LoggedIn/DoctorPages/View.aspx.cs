using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.DoctorPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(3), "Doctor");
        }

        protected void doctors_DataBound(object sender, EventArgs e)
        {
            lblDoctorCount.Text = "Брой доктори :" +doctors.Rows.Count;
        }
    }
}