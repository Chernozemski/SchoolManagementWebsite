using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.TeacherPages
{
    public partial class AbsenceTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            BusinessLayer.Teacher.Absent teacher = new BusinessLayer.Teacher.Absent();

            //Get footer elements that are used in insert
            TextBox txtAbsentTeacher = GridView2.FooterRow.FindControl("txtAbsentTeacherName") as TextBox;
            CheckBoxList checkBoxList = GridView2.FooterRow.FindControl("checkboxListLessonsAbsent") as CheckBoxList;
            TextBox txtSubstituteTeacher = GridView2.FooterRow.FindControl("txtSubstituteTeacherName") as TextBox;

            List<string> getCheckBoxList = new List<string>();
            foreach (ListItem li in checkBoxList.Items)
            {
                if (li.Selected)
                {
                    getCheckBoxList.Add(li.Value);
                }
            }

            object[] result = teacher.absent(txtAbsentTeacher.Text, string.Join(" ", getCheckBoxList), txtSubstituteTeacher.Text);
            lblMessage.Text = result[0].ToString();
            lblMessage.ForeColor = (System.Drawing.Color)result[1];

            if (lblMessage.ForeColor == System.Drawing.Color.Green)
            {
                GridView2.DataBind();
            }
        }
        protected void GridView2_DataBound(object sender, EventArgs e)
        {
            //Hide first row (dummy row)
            BusinessLayer.SharedMethods.hideFirstRow(ref GridView2);
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //Hide all rows if is a teacher
            if (e.Row.RowType == DataControlRowType.DataRow && (int)Session["Rank"] > 2)
            {
                e.Row.Visible = false;
            }
        }
    }
}