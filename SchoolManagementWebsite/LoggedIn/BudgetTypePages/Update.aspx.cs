using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.BudgetTypePages
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "BudgetType");
        }

        protected void gridViewBudgetType_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex == gridViewBudgetType.EditIndex)
            {
                (e.Row.FindControl("ddlOperationType") as DropDownList).SelectedValue = (e.Row.FindControl("lblOperationTypeId") as Label).Text;

                (e.Row.FindControl("ddlOperationLength") as DropDownList).SelectedValue = (e.Row.FindControl("lblOperationLengthId") as Label).Text;
            }
        }
        private int OperationTypeId = 0;
        private int OperationLengthId = 0;
        protected void getAndRemoveBudgetType_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void ddlOperationType_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationTypeId = int.Parse((sender as DropDownList).SelectedValue);
        }

        protected void ddlOperationLength_SelectedIndexChanged(object sender, EventArgs e)
        {
            OperationLengthId = int.Parse((sender as DropDownList).SelectedValue);
        }

        protected void getAndRemoveBudgetType_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            //Since drop down lists lose their selected values on row data bound and retrieve their original values, 
            //they need to be assigned to a variables which dont change.
            if (OperationTypeId != 0)
            {
                e.InputParameters["OperationTypeId"] = OperationTypeId;
            }
            if (OperationLengthId != 0)
            {
                e.InputParameters["OperationLengthId"] = OperationLengthId;
            }
        }
    }
}