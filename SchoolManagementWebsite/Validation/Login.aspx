<%@ Page Title="" Language="C#" MasterPageFile="~/FreePages.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolManagementWebsite.Validation.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>Потребителско име : </td>
            <td>
                <asp:TextBox ID="txtUserName" placeholder="Потребителско име" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="Трябва да въведете потребителско име." ValidationGroup="Login" Text="*" ForeColor="Red" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Парола : </td>
            <td>
                <asp:TextBox ID="txtPassword" placeholder="Парола" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Трябва да въведете парола име." ValidationGroup="Login" Text="*" ForeColor="Red" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnLogin" Text="Вход" CssClass="bigButton" runat="server" ValidationGroup="Login" OnClick="btnLogin_Click" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ValidationGroup="Login" HeaderText="Проблеми при вход" ShowSummary="true" ForeColor="DarkRed" DisplayMode="List" runat="server" />
    <asp:Label ID="lblMessage" runat="server"/>
</asp:Content>
