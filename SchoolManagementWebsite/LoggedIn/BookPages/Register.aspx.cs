using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BookPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Book");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string message;
                System.Drawing.Color color;

                BusinessLayer.Book.CRUD crud = new BusinessLayer.Book.CRUD();
                  crud.Create(txtBook.Text,int.Parse(ddlPublisher.SelectedValue),int.Parse(ddlGrade.SelectedValue)
                ,int.Parse(ddlSubject.SelectedValue),int.Parse(txtYear.Text),int.Parse(txtQuantity.Text),out message,out color);

                  lblMessage.Text = message;
                  lblMessage.ForeColor = color;
            }
        }

        protected void ddlGrade_Load(object sender, EventArgs e)
        {
            for (int i = 1; i <= 12; i++)
            {
                ddlGrade.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void Unnamed7_Load(object sender, EventArgs e)
        {
            (sender as RangeValidator).MaximumValue = DateTime.Now.Year.ToString();
        }
    }
}