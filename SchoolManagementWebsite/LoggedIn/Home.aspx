<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Меню</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <a href="/LoggedIn/ClassPages/Class.aspx" class="MenuText"> Класове
                    <img alt="Класове" class="resizeImage" title="Класове" src="../Images/Class.png" /></a>
            </td>
            <td>
                <a href="/LoggedIn/TeacherPages/Teacher.aspx" class="MenuText"> Учители
                    <img alt="Учители" class="resizeImage" title="Учители" src="../Images/Teacher.png" /></a>
            </td>
            <td>
                <a href="/LoggedIn/StudentPages/Student.aspx" class="MenuText"> Ученици
                    <img alt="Ученици" class="resizeImage" title="Ученици" src="../Images/Student.png" /></a>
            </td>
            <td>
                <a href="/LoggedIn/SubjectPages/Subject.aspx" class="MenuText"> Предмети
                    <img alt="Предмети" class="resizeImage" title="Предмети" src="../Images/Subject.png" /></a>
            </td>
        </tr>
        <tr>
            <asp:Panel ID="directorPanel" Visible="false" OnLoad="directorPanel_Load" runat="server">
                <td>
                    <a href="/LoggedIn/DoctorPages/Doctor.aspx" class="MenuText"> Доктори
                        <img alt="Доктори" class="resizeImage" title="Доктори" src="../Images/Doctor.png" /></a>
                </td>
                <td>
                    <a href="/LoggedIn/BookPages/Book.aspx" class="MenuText"> Учебници
                        <img alt="Учебници" class="resizeImage" title="Учебници" src="../Images/Book.png" /></a>
                </td>
                <td>
                    <a href="/LoggedIn/AuthorPages/Author.aspx" class="MenuText"> Издатели
                        <img alt="Издатели" class="resizeImage" title="Издатели" src="../Images/Author.png" /></a>
                </td>
                                <td>
                    <a href="/LoggedIn/PositionPages/Position.aspx" class="MenuText"> Длъжности
                        <img alt="Длъжности" class="resizeImage" title="Длъжности" src="../Images/Position.png" /></a>
                </td>
                                                <td>
                    <a href="/LoggedIn/BudgetPages/Budget.aspx" class="MenuText"> Бюджет
                        <img alt="Бюджет" class="resizeImage" title="Бюджет" src="../Images/Budget.png" /></a>
                </td>
            </asp:Panel>
        </tr>
    </table>
</asp:Content>
