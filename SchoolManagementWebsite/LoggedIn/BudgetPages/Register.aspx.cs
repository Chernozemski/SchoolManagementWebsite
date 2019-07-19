using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BudgetPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Budget");
        }

        protected void calendarOnDate_Load(object sender, EventArgs e)
        {
            calendarOnDate.SelectedDate = DateTime.Now;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Budget.CRUDBudget crud = new BusinessLayer.Budget.CRUDBudget();

                string message;
                System.Drawing.Color color;
                crud.Create(int.Parse(ddlItem.SelectedValue), txtDescriptionForItem.Text, decimal.Parse(txtAmount.Text), calendarOnDate.SelectedDate
                    , out message, out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;
            }
        }   
    }
}