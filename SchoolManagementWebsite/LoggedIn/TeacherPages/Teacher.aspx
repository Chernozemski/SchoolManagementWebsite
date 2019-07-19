<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Учители</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Учители" class="resizeImage" title="Учители" src="../../Images/Teacher.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на учителите" class="resizeImageSmall" title="Преглед на учителите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Записване на учител" class="resizeImageSmall" title="Записване на учител" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на учителски запис" class="resizeImageSmall" title="Промяна на учителски запис" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на учител" class="resizeImageSmall" title="Премахване на учител" src="../../Images/Remove.png" /></a>
                </td>

            </tr>
        </asp:Panel>
        <tr>
            <td>
                <a href="Absence.aspx">
                    <img alt="Отсъствия на учители" class="resizeImageSmall" title="Отсъствия на учители" src="../../Images/Presence.png" /></a>
            </td>
        </tr>
    </table>
</asp:Content>
