<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="TimeTable.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TimeTablePages.TimeTable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Часове</h2>
     <table class="hideBorder">
        <tr>
            <td>
                <img alt="Часове" class="resizeImage" title="Часове" src="../../Images/Clock.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на часовете" class="resizeImageSmall" title="Преглед на часовете" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Записване на час" class="resizeImageSmall" title="Записване на час" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на час" class="resizeImageSmall" title="Промяна на час" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на час" class="resizeImageSmall" title="Премахване на час" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
        </asp:Panel>
         </table>
</asp:Content>
