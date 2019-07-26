using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SchoolManagementWebsite.LoggedIn.LessonPages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessLayer.SharedMethods.redirectUser(BusinessLayer.SharedMethods.isUserAuthorized(10), "Lesson");
        }
        protected void btnregister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessLayer.Programme.CRUD crudProgramme = new BusinessLayer.Programme.CRUD();
                int ProgrammeId = crudProgramme.GetProgrammeId(int.Parse(ddlClass.SelectedValue),(int)DateTime.Now.DayOfWeek,int.Parse(ddlHour.SelectedValue));

                List<int> absentStudent = new List<int>();
                List<int> lateStudent = new List<int>();

                foreach(GridViewRow row in gridViewStudentInClass.Rows)
                {
                    string studentState = (row.Cells[1].FindControl("studentPresence") as RadioButtonList).SelectedValue;
                    int studentId = int.Parse(gridViewStudentInClass.DataKeys[row.RowIndex].Value.ToString());
                    switch (studentState)
                    {
                        case "absent":
                            absentStudent.Add(studentId);
                            break;
                        case "late":
                            lateStudent.Add(studentId);
                            break;
                    }
                }

                string message;
                System.Drawing.Color color;

                BusinessLayer.Lesson.CRUD crud = new BusinessLayer.Lesson.CRUD();
                crud.Create(ProgrammeId,int.Parse(ddlClass.SelectedValue), txtLesson.Text, DateTime.Now, Session["EGN"].ToString(), string.Join(", ", absentStudent.ToArray()) + ",",
                    string.Join(", ", lateStudent.ToArray()) + ",", out message, out color);

                lblMessage.Text = message;
                lblMessage.ForeColor = color;
            }
        }
    }
}