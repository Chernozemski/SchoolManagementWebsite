<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.LessonPages.Lesson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Урок</h2>
    <table class="hideBorder">
        <tr>
            <td>
                <img alt="Уроци" class="resizeImage" title="Уроци" src="../../Images/Lesson.png" />
            </td>
        </tr>
        <tr>
            <td>
                <a href="Register.aspx">
                    <img alt="Прибавяне на уроци" class="resizeImageSmall" title="Прибавяне на уроци" src="../../Images/Add.png" /></a>
            </td>
        </tr>
        <asp:Panel ID="teacherClassPanel" runat="server" OnLoad="teacherClassPanel_Load" Visible="false">
            <tr>
                <td>
                    <a href="View.aspx">
                        <img alt="Преглед на уроците" class="resizeImageSmall" title="Преглед на уроците" src="../../Images/See.png" /></a>
                    <a href="Update.aspx">
                        <img alt="Промяна на урок" class="resizeImageSmall" title="Промяна на урок" src="../../Images/Update.png" /></a>
                </td>
            </tr>
            <tr>
                <asp:Panel ID="directorPanel" runat="server" OnLoad="directorPanel_Load" Visible="false">
                    <td>
                        <a href="Remove.aspx">
                            <img alt="Премахване на урок" class="resizeImageSmall" title="Премахване на урок" src="../../Images/Remove.png" /></a>
                    </td>
                </asp:Panel>
            </tr>
        </asp:Panel>
    </table>
    <asp:Label ID="lblMessage" CssClass="BigText" ForeColor="Blue" runat="server" />
</asp:Content>
