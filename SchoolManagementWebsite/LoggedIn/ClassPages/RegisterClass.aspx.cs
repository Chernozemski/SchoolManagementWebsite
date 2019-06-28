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
    public partial class RegisterClass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCheckTeacherId_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetTeacherId_tblTeacherInfo", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TeacherName", txtTeacherName.Text);

                con.Open();
               isTeacherIdChecked.Text = cmd.ExecuteScalar().ToString();
                con.Close();
            }

            imgValidTeacher.Visible = true;
            if (isTeacherIdChecked.Text == "0")
            {
                imgValidTeacher.ImageUrl = "/Images/Remove.png";
            }
            else
            {
                imgValidTeacher.ImageUrl = "/Images/Check.png";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (isTeacherIdChecked.Checked)
            {
                string cs = ConfigurationManager.ConnectionStrings["SchoolManagementDBConnectionString"].ConnectionString;
                int result = 0;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spCreateClass_tblClass", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    SqlParameter ClassGrade = new SqlParameter("@ClassGrade", ddlGrade.SelectedItem.Value);
                    SqlParameter ClassLetter = new SqlParameter("@ClassLetter", txtClassLetter.Text);
                    SqlParameter SpecializationId = new SqlParameter("@SpecializationId", ddlSpecialization.SelectedItem.Value);
                    SqlParameter ClassTeacherId = new SqlParameter("@ClassTeacherId", isTeacherIdChecked.Text);
                    cmd.Parameters.Add(ClassGrade);
                    cmd.Parameters.Add(ClassLetter);
                    cmd.Parameters.Add(SpecializationId);
                    cmd.Parameters.Add(ClassTeacherId);

                    con.Open();
                    result = (int)cmd.ExecuteScalar();
                    con.Close();
                }
                switch (result)
                {
                    case 1:
                        sendMessage("Успешна регистрация.", false);
                        break;
                    case 0:
                        sendMessage("Учителят вече има клас.");
                        break;
                    case -1:
                        sendMessage("Трябва да изберете паралелка.");
                        break;
                    case -2:
                        sendMessage("Клас с тези елементи е записан.");
                        break;
                    case -3:
                        sendMessage("Учителят не е вписан или не съществува.");
                        break;
                    case -4:
                        sendMessage("Трябва да изберете буква от А до Я на български език.");
                        break;
                    case -5:
                        sendMessage("Трябва да изберете клас 1 до 12.");
                        break;
                }
            }
            else
            {
                sendMessage("Моля проверете учителя като натиснете бутона 'провери'.");
            }
        }
        private void sendMessage(string message,bool isRed = true)
        {
            if (isRed == true)
                lblMessage.ForeColor = System.Drawing.Color.DarkRed;
            else
                lblMessage.ForeColor = System.Drawing.Color.Green;

            lblMessage.Text = message;
        }
        protected void ddlGrade_Load(object sender, EventArgs e)
        {
            for (int i = 1; i < 13; i++)
            {
                ddlGrade.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
    }
}