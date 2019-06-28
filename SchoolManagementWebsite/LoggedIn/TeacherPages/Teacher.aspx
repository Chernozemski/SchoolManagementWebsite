<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Teacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Учители" class="resizeImage" title="Учители" src="../../Images/Teacher.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="ViewTeacher.aspx">
                    <img alt="Преглед на учителите" class="resizeImageSmall" title="Преглед на учителите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="RegisterTeacher.aspx">
                        <img alt="Прибавяне на учител" class="resizeImageSmall" title="Прибавяне на учител" src="../../Images/Add.png" /></a>
                    <a href="RemoveTeacher.aspx">
                        <img alt="Премахване на учител" class="resizeImageSmall" title="Премахване на учител" src="../../Images/Remove.png" /></a>
                </td>

            </tr>
            <tr>
                <td>
                    <a href="AbsenceTeacher.aspx">
                        <img alt="Отсъствия на учители" class="resizeImageSmall" title="Отсъствия на учители" src="../../Images/Presence.png" /></a>
                </td>
            </tr>
        </asp:Panel>
    </table>
</asp:Content>
