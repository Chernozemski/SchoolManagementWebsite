<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BookPages.Book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Учебници</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Учебници" class="resizeImage" title="Учебници" src="../../Images/Book.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на учебниците" class="resizeImageSmall" title="Преглед на учебниците" src="../../Images/See.png" /></a>
            </td>
        </tr>
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на учебник" class="resizeImageSmall" title="Прибавяне на учебник" src="../../Images/Add.png" /></a>
                                        <a href="Update.aspx">
                        <img alt="Обновяване на учебник" class="resizeImageSmall" title="Обновяване на учебник" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на учебник" class="resizeImageSmall" title="Премахване на учебник" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
    </table>
</asp:Content>
