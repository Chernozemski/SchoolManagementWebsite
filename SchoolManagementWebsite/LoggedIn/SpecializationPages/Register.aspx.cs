using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.Specialization
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Specialization");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            BusinessLayer.Specialization.CRUD crud = new BusinessLayer.Specialization.CRUD();
            
            string Message;
            System.Drawing.Color Color;

            crud.Create(txtSpecialization.Text, out Message, out Color);

            lblMessage.Text = Message;
            lblMessage.ForeColor = Color;
        }
    }
}