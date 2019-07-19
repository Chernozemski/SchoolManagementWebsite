using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BudgetPages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Budget");
        }
        protected void gridViewBudget_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == gridViewBudget.EditIndex)
            {
                (e.Row.FindControl("ddlItem") as DropDownList).SelectedValue = (e.Row.FindControl("lblItemId") as Label).Text;

                OnDate = DateTime.Parse((e.Row.FindControl("lblOnDate") as Label).Text);
            }
        }
        private int ItemId = 0;
        private static DateTime OnDate;
        protected void getAndUpdateBudget_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            if (ItemId != 0)
            e.InputParameters["ItemId"] = ItemId;

            e.InputParameters["onDate"] = OnDate;
        }

        protected void ddlItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            ItemId = int.Parse((sender as DropDownList).SelectedValue);
        }

        protected void getAndUpdateBudget_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void calendarOnDate_SelectionChanged(object sender, EventArgs e)
        {
            OnDate = (sender as Calendar).SelectedDate;
        }
    }
}