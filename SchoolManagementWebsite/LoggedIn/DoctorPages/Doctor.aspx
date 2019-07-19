<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.DoctorPages.Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Доктори</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Доктор" class="resizeImage" title="Доктор" src="../../Images/Doctor.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="View.aspx">
                    <img alt="Преглед на докторите" class="resizeImageSmall" title="Преглед на докторите" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" Visible="false" OnLoad="directorPanel_Load">
            <tr>
                <td>
                    <a href="Register.aspx">
                        <img alt="Прибавяне на доктор" class="resizeImageSmall" title="Прибавяне на доктор" src="../../Images/Add.png" /></a>
                                        <a href="Update.aspx">
                        <img alt="Промяна на доктор" class="resizeImageSmall" title="Промяна на доктор" src="../../Images/Update.png" /></a>
                    <a href="Remove.aspx">
                        <img alt="Премахване на доктор" class="resizeImageSmall" title="Премахване на доктор" src="../../Images/Remove.png" /></a>
                </td>
            </tr>
        </asp:Panel>
        </table>
</asp:Content>
