<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="ClassStudent.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassStudentPages.ClassStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Ученици в клас</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Ученици в клас" class="resizeImage" title="Ученици в клас" src="../../Images/ClassStudent.png" />
            </td>
        </tr>
        <asp:Panel ID="teacherPanel" runat="server" OnLoad="teacherPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="View.aspx">
                        <img alt="Преглед на учениците в клас" class="resizeImageSmall" title="Преглед на учениците в клас" src="../../Images/See.png" /></a>
                </td>
            </tr>
            <tr>
                <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
                    <td>
                        <a href="Register.aspx">
                            <img alt="Прибавяне на ученик в клас" class="resizeImageSmall" title="Прибавяне на ученик в клас" src="../../Images/Add.png" /></a>
                        <a href="Remove.aspx">
                            <img alt="Премахване на ученик в клас" class="resizeImageSmall" title="Премахване на ученик в клас" src="../../Images/Remove.png" /></a>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td>
                    <a href="Update.aspx">
                        <img alt="Промяна на ученик в клас" class="resizeImageSmall" title="Промяна на ученик в клас" src="../../Images/Update.png" /></a>
                </td>
            </tr>
        </asp:Panel>
    </table>
    <asp:Label ID="lblMessage" CssClass="BigText" ForeColor="Blue" runat="server" />
</asp:Content>
