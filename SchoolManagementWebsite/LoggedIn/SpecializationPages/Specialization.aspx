<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Specialization.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Specialization.Specialization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Специалности</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Клас" class="resizeImage" title="Клас" src="../../Images/Specialization.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на специалностите" class="resizeImageSmall" title="Преглед на специалностите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на специалност" class="resizeImageSmall" title="Прибавяне на специалност" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на специалност" class="resizeImageSmall" title="Промяна на специалност" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на специалност" class="resizeImageSmall" title="Премахване на специалност" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
        </asp:Panel>
    </table>
</asp:Content>
