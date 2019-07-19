using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.Specialization
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(3), "Specialization");
        }

        protected void gridViewSpecialization_SelectedIndexChanged(object sender, EventArgs e)
        {
            classList.Visible = true;
            classList.Caption = gridViewSpecialization.SelectedRow.Cells[1].Text;
        }
    }
}