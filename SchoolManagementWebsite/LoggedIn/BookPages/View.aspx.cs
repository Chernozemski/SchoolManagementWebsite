using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BookPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Book");
        }

        protected void gridViewBook_DataBound(object sender, EventArgs e)
        {
            lblBookCount.Text = "Брой книги :" + gridViewBook.Rows.Count;
        }
    }
}