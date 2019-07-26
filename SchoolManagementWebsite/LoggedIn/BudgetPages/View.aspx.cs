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
                //get the control from the table and remove лв. from it, in order to sum the total expense and income
                Label lbl = (e.Row.Cells[4].FindControl("lblSalary") as Label);

                if (e.Row.Cells[2].Text == "Приход")
                {
                    totalIncome += decimal.Parse(lbl.Text.Remove(lbl.Text.Length - 4));
                }
                else
                {
                    totalExpense += decimal.Parse(lbl.Text.Remove(lbl.Text.Length - 4));
                }
            }
        }

        protected void gridViewBudget_DataBound(object sender, EventArgs e)
        {
            lblBudgetItemsCount.Text = "Брой на приходите/разходите :" + gridViewBudget.Rows.Count; 
            if (gridViewBudget.Rows.Count > 0)
            gridViewBudget.FooterRow.Cells[4].Text += "Приходи : " + totalIncome.ToString("0.00 лв") + "\nРазходи : " + totalExpense.ToString("0.00 лв");
        }
    }
}