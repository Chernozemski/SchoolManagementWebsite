<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Programme.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Programme.Programme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Програми</h2>
     <table class="hideBorder">
        <tr>
            <td>
                <img alt="Програми" class="resizeImage" title="Програми" src="../../Images/Programme.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на програмите" class="resizeImageSmall" title="Преглед на програмите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Записване на програма" class="resizeImageSmall" title="Записване на програма" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на програма" class="resizeImageSmall" title="Промяна на програма" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на програма" class="resizeImageSmall" title="Премахване на програма" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
        </asp:Panel>
         </table>
</asp:Content>
