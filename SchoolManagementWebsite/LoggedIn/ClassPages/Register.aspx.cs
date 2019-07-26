using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementWebsite.LoggedIn.ClassPages
{
    public partial class Register : System.Web.UI.Page
    {
        BusinessLayer.Class.CRUD crud = new BusinessLayer.Class.CRUD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlGrade.Items.AddRange(setGrade());
                ddlLetter.Items.AddRange(setLetter());
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Message;
                System.Drawing.Color Color;
                crud.Create(Convert.ToInt32(ddlGrade.SelectedValue), ddlLetter.SelectedValue[0], Convert.ToInt32(ddlSpecialization.SelectedValue), ddlTeacher.SelectedValue
                    , out Message, out Color);

                lblMessage.Text = Message;
                lblMessage.ForeColor = Color;

                if (!lblMessage.ForeColor.Equals(System.Drawing.Color.DarkRed))
                ddlTeacher.Items.Remove(ddlTeacher.SelectedItem);
            }
        }
        private ListItem[] setGrade()
        {
            ListItem[] li = new ListItem[13];

            li[0] = new ListItem("Изберете клас", "0");

            for (int i = 1; i <= 12; i++)
            {
                li[i] = new ListItem((i).ToString(), (i).ToString());
            }
            return li;
        }
        private ListItem[] setLetter()
        {
            ListItem[] li = new ListItem[33];

            li[0] = new ListItem("Изберете буква", "0");

            int letter = 1040; // Bulgarian A

            for (int i = 1; i <= 32; i++)
            {
                li[i] = new ListItem(((char)letter).ToString(), ((char)letter).ToString());
                letter++;
            }
            return li;
        }

    }
}