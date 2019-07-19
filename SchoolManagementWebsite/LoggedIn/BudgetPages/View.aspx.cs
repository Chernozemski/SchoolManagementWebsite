using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BudgetPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(3), "Budget");
        }
        decimal totalIncome = 0;
        decimal totalExpense = 0;
        protected void gridViewBudget_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[2].Text == "Приход")
                {
                    totalIncome += decimal.Parse(e.Row.Cells[4].Text);
                }
                else
                {
                    totalExpense += decimal.Parse(e.Row.Cells[4].Text);
                }
            }
        }

        protected void gridViewBudget_DataBound(object sender, EventArgs e)
        {
            gridViewBudget.FooterRow.Cells[4].Text += "Приходи : " + totalIncome.ToString() + "\nРазходи : " + totalExpense.ToString();
        }
    }
}