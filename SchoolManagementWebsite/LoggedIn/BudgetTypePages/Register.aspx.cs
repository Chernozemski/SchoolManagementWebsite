using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BudgetTypePages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "BudgetType");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Budget.CRUDBudgetType crud = new BusinessLayer.Budget.CRUDBudgetType();

                string message;
                System.Drawing.Color color;
                crud.Create(txtOperation.Text, int.Parse(ddlOperationLength.SelectedValue), int.Parse(ddlOperationType.SelectedValue),out message,out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;
            }
        }
    }
}