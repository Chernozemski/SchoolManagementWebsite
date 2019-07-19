<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Position.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.PositionPages.Position" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Длъжности</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Длъжност" class="resizeImage" title="Длъжност" src="../../Images/Specialization.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на длъжностите" class="resizeImageSmall" title="Преглед на длъжностите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на длъжност" class="resizeImageSmall" title="Прибавяне на длъжност" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на длъжност" class="resizeImageSmall" title="Промяна на длъжност" src="../../Images/Update.png" /></a>
                </td>
            </tr>
        </asp:Panel>
    </table>
</asp:Content>
