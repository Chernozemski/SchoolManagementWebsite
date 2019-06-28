<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Меню</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <a href="/LoggedIn/ClassPages/Class.aspx">
                    <img alt="Класове" class="resizeImage" title="Класове" src="../Images/Class.png" /></a>
            </td>
            <td>
                <a href="/LoggedIn/TeacherPages/Teacher.aspx">
                    <img alt="Учители" class="resizeImage" title="Учители" src="../Images/Teacher.png" /></a>
            </td>
            <td>
                <a href="/LoggedIn/StudentPages/Student.aspx">
                    <img alt="Ученици" class="resizeImage" title="Ученици" src="../Images/Student.png" /></a>
            </td>
            <td>
                <a href="/LoggedIn/SubjectPages/Subject.aspx">
                    <img alt="Предмети" class="resizeImage" title="Предмети" src="../Images/Subject.png" /></a>
            </td>
        </tr>
    </table>
</asp:Content>
