<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Student.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Ученици" class="resizeImage" title="Ученици" src="../../Images/Student.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="ViewStudent.aspx">
                    <img alt="Преглед на учениците" class="resizeImageSmall" title="Преглед на учениците" src="../../Images/See.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="directorPanel" runat="server" Visible="false" OnLoad="directorPanel_Load">
            <tr>
                <td>
                    <a href="RegisterStudent.aspx">
                        <img alt="Прибавяне на ученик" class="resizeImageSmall" title="Прибавяне на ученик" src="../../Images/Add.png" /></a>
                    <a href="RemoveStudent.aspx">
                        <img alt="Премахване на ученик" class="resizeImageSmall" title="Премахване на ученик" src="../../Images/Remove.png" /></a>
                </td>

            </tr>
                    </asp:Panel>
    </table>
</asp:Content>
