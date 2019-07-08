<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Subject.Subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Предмети</h2>
     <table class="hideBorder">
        <tr>
            <td>
                <img alt="Предмети" class="resizeImage" title="Предмети" src="../../Images/Subject.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на предметите" class="resizeImageSmall" title="Преглед на предметите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Вписване на предмет" class="resizeImageSmall" title="Вписване на предмет" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на предмет" class="resizeImageSmall" title="Промяна на предмет" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на предмет" class="resizeImageSmall" title="Премахване на предмет" src="../../Images/Remove.png" /></a>
                </td>

            </tr>
        </asp:Panel>
    </table>
</asp:Content>
