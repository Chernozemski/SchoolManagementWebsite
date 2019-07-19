<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Class.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Class.Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Класове</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Клас" class="resizeImage" title="Клас" src="../../Images/Class.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на класовете" class="resizeImageSmall" title="Преглед на класовете" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на клас" class="resizeImageSmall" title="Прибавяне на клас" src="../../Images/Add.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на клас" class="resizeImageSmall" title="Промяна на клас" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на клас" class="resizeImageSmall" title="Премахване на клас" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="../SpecializationPages/Specialization.aspx">
                        <img alt="Паралелка" class="resizeImageSmall" title="Паралелка" src="../../Images/Specialization.png" /></a>
                </td>
            </tr>
        </asp:Panel>
    </table>
</asp:Content>
