using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.PositionPages
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Position");
        }

        protected void gridViewTeacher_DataBound(object sender, EventArgs e)
        {
            if (gridViewPosition.SelectedIndex >= 0)
            {
                gridViewTeacher.Caption = gridViewPosition.SelectedRow.Cells[1].Text;
            }
        }

        protected void gridViewPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            gridViewTeacher.Visible = true;
        }

        protected void lblTotalSalary_Load(object sender, EventArgs e)
        {
            BusinessLayer.Position.CRUD crud = new BusinessLayer.Position.CRUD();
            (sender as Label).Text = "Общо всички заплати : " + crud.GetTotalSalary().ToString("0.00 лв");
        }

        protected void gridViewPosition_DataBound(object sender, EventArgs e)
        {
            lblPositionCount.Text = "Брой длъжности :" + gridViewPosition.Rows.Count;
        }
    }
}