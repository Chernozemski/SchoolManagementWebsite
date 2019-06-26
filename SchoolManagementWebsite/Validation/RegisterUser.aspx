<%@ Page Title="" Language="C#" MasterPageFile="~/FreePages.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="SchoolManagementWebsite.Validation.RegisterUser" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Регистрационна форма:</h2>
    <table>
        <tr>
            <td>Потребителско име :
            </td>
            <td>
                <asp:TextBox ID="txtUserName" placeholder="Потребилтеско име" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да въведете потребителско име." ControlToValidate="txtUserName" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Парола :
            </td>
            <td>
                <asp:TextBox ID="txtPassword" placeholder="Парола" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да въведете парола." ControlToValidate="txtPassword" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Повторна парола :
            </td>
            <td>
                <asp:TextBox ID="txtRepeatPassword" placeholder="Парола" runat="server" TextMode="Password" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да въведете повторна парола." ControlToValidate="txtRepeatPassword" runat="server" Display="Dynamic" />
                <asp:CompareValidator ControlToValidate="txtRepeatPassword" ControlToCompare="txtPassword" ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Паролите не съвпадат." runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>ЕГН :
            </td>
            <td>
                <asp:TextBox ID="txtEGN" placeholder="ЕГН" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да въведете ЕГН." ControlToValidate="txtEGN" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationExpression="^[0-9]{10}$" ValidationGroup="Register" ControlToValidate="txtEGN" ErrorMessage="ЕГН-то трябва да има 10 цифри." Text="*" ForeColor="Red" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Вписване" OnClick="btnRegister_Click" CssClass="bigButton" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" ForeColor="#990000" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
    </style>
</asp:Content>

