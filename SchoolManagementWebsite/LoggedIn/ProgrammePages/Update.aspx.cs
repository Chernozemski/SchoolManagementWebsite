using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.Programme
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(2), "Programme");
        }

        protected void gridViewProgramme_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gridViewProgramme.EditIndex == e.Row.RowIndex)
            {
                (e.Row.FindControl("ddlRoom") as DropDownList).Items.AddRange(LoadRoomList());
                (e.Row.FindControl("ddlRoom") as DropDownList).SelectedValue = (e.Row.FindControl("lblRoomId") as Label).Text;

            }
        }
        private int RoomId = 0;
        private ListItem[] LoadRoomList()
        {
            ListItem[] li = new ListItem[50];
            for (int i = 0; i < 50; i++)
            {
                li[i] = new ListItem((i+1).ToString(), (i+1).ToString());
            }
            return li;
        }
        protected void getAndUpdateProgramme_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            BusinessLayer.SharedMethods.SetMessage(e, ref lblMessage);
        }

        protected void ddlRoom_SelectedIndexChanged(object sender, EventArgs e)
        {
            RoomId = int.Parse((sender as DropDownList).SelectedValue);
        }

        protected void getAndUpdateProgramme_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            if (RoomId != 0)
            {
                e.InputParameters["RoomId"] = RoomId;
            }
        }
    }
}