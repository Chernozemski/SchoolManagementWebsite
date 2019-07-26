<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Grade.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.GradePages.Grade" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Оценки</h2>
     <table class="hideBorder">
        <tr>
            <td>
                <img alt="Оценки" class="resizeImage" title="Оценки" src="../../Images/Grade.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="Register.aspx">
                    <img alt="Прибавяне на оценка" class="resizeImageSmall" title="Прибавяне на оценка" src="../../Images/Add.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="teacherClassPanel" runat="server" OnLoad="teacherClassPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="View.aspx">
                        <img alt="Преглед на оценките" class="resizeImageSmall" title="Преглед на оценките" src="../../Images/See.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на оценка" class="resizeImageSmall" title="Промяна на оценка" src="../../Images/Update.png" /></a>
                </td>
            </tr>
            <tr>
                <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
                    <td>
                        <a href="Remove.aspx">
                            <img alt="Премахване на оценка" class="resizeImageSmall" title="Премахване на оценка" src="../../Images/Remove.png" /></a>
                    </td>
                </asp:Panel>
            </tr>
        </asp:Panel>
    </table>
    <asp:Label ID="lblMessage" CssClass="BigText" ForeColor="Blue" runat="server" />
</asp:Content>
