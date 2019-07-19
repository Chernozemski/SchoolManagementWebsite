<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Budget.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetPages.Budget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Бюджет</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Клас" class="resizeImage" title="Бюджет" src="../../Images/Budget.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на класовете" class="resizeImageSmall" title="Преглед на бюджета" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на клас" class="resizeImageSmall" title="Прибавяне на приход/разход" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на клас" class="resizeImageSmall" title="Промяна на приход/разход" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на клас" class="resizeImageSmall" title="Премахване на приход/разход" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
        </asp:Panel>
    </table>
</asp:Content>
