<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Budget.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetPages.Budget" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Бюджет</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Бюджет" class="resizeImage" title="Бюджет" src="../../Images/Budget.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на бюджета" class="resizeImageSmall" title="Преглед на бюджета" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на приход/разход" class="resizeImageSmall" title="Прибавяне на приход/разход" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на приход/разход" class="resizeImageSmall" title="Промяна на приход/разход" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на приход/разход" class="resizeImageSmall" title="Премахване на приход/разход" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="../BudgetTypePages/BudgetType.aspx">
                        <img alt="Прибавяне на операция" class="resizeImageSmall" title="Операция" src="../../Images/Operation.png" /></a>
                </td>
            </tr>
        </asp:Panel>
    </table>
</asp:Content>
