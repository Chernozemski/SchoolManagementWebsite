<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Меню</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <a>
                    <img alt="Класове" class="resizeImage" title="Класове" src="../Images/Grade.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Учители" class="resizeImage" title="Учители" src="../Images/Teacher.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Учители" class="resizeImage" title="Ученици" src="../Images/Student.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Предмети" class="resizeImage" title="Предмети" src="../Images/Subject.png" /></a>
            </td>
        </tr>
        <tr>
            <td>
                <a>
                    <img alt="Преглед на класовете" class="resizeImageSmall" title="Преглед на класовете" src="../Images/See.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Преглед на учителите" class="resizeImageSmall" title="Преглед на учителите" src="../Images/See.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Преглед на учениците" class="resizeImageSmall" title="Преглед на учениците" src="../Images/See.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Преглед на предметите" class="resizeImageSmall" title="Преглед на предметите" src="../Images/See.png" /></a>
            </td>
        </tr>
        <tr>
            <td>
                <a>
                    <img alt="Редактиране на класовете" class="resizeImageSmall" title="Редактиране на класовете" src="../Images/AddRemove.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Редактиране на учителите" class="resizeImageSmall" title="Редактиране на учителите" src="../Images/AddRemove.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Редактиране на учениците" class="resizeImageSmall" title="Редактиране на учениците" src="../Images/AddRemove.png" /></a>
            </td>
            <td>
                <a>
                    <img alt="Редактиране на предметите" class="resizeImageSmall" title="Редактиране на предметите" src="../Images/AddRemove.png" /></a>
            </td>
        </tr>
    </table>
</asp:Content>
