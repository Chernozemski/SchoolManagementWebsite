<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="BudgetType.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetTypePages.BudgetType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2> Операция</h2>
        <table class="hideBorder">
        <tr>
            <td>
                <img alt="Операция" class="resizeImage" title="Операция" src="../../Images/Operation.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на операциите" class="resizeImageSmall" title="Преглед на операциите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на операция" class="resizeImageSmall" title="Прибавяне на операция" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на операция" class="resizeImageSmall" title="Промяна на операция" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на операция" class="resizeImageSmall" title="Премахване на операция" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
        </asp:Panel>
</asp:Content>
