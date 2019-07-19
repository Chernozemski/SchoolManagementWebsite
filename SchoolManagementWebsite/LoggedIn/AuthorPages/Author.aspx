<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Author.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.AuthorPages.Author" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Издатели</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Издатели" class="resizeImage" title="Издатели" src="../../Images/Author.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на издателите" class="resizeImageSmall" title="Преглед на издателите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" />
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на издател" class="resizeImageSmall" title="Прибавяне на издател" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Обновяване на издател" class="resizeImageSmall" title="Обновяване на издател" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на издател" class="resizeImageSmall" title="Премахване на издател" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
    </table>
</asp:Content>
