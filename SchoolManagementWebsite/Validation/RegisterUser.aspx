<%@ Page Title="" Language="C#" MasterPageFile="~/FreePages.Master" AutoEventWireup="true" CodeBehind="RegisterUser.aspx.cs" Inherits="SchoolManagementWebsite.RegisterTeacher.RegisterUser" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Регистрационна форма</h2>
    <table class="middlePositionTable BigText">
        <tr>
            <td>Потребителско име :
            </td>
            <td>
                <asp:TextBox ID="txtUserName" placeholder="Потребилтеско име" runat="server"/>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете потребителско име." ControlToValidate="txtUserName" runat="server" Display="Dynamic" />
           <asp:RegularExpressionValidator ValidationGroup ="Register" Text="*" CssClass ="error" ErrorMessage ="Потребителското име може да съдържа само букви(кирилица,латиница),цифри(0-9) и долна черта( _ )" ControlToValidate="txtUserName" ValidationExpression="^[a-zA-Z0-9_а-яА-Я]+$" runat="server" Display="Dynamic" />
                 </td>
        </tr>
        <tr>
            <td>Парола :
            </td>
            <td>
                <asp:TextBox ID="txtPassword" placeholder="Парола" runat="server" TextMode="Password"/>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете парола." ControlToValidate="txtPassword" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Повторна парола :
            </td>
            <td>
                <asp:TextBox ID="txtRepeatPassword" placeholder="Парола" runat="server" TextMode="Password" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете повторна парола." ControlToValidate="txtRepeatPassword" runat="server" Display="Dynamic" />
                <asp:CompareValidator ControlToValidate="txtRepeatPassword" ControlToCompare="txtPassword" ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Паролите не съвпадат." runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>ЕГН :
            </td>
            <td>
                <asp:TextBox ID="txtEGN" placeholder="ЕГН" runat="server"/>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете ЕГН." ControlToValidate="txtEGN" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationExpression="^[0-9]{10}$" ValidationGroup="Register" ControlToValidate="txtEGN" ErrorMessage="ЕГН-то трябва да има 10 цифри." Text="*" CssClass="error" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Вписване" OnClick="btnRegister_Click" CssClass="bigButton" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label CssClass="BigText error" runat="server" ID="lblMessage"/>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
    </style>
</asp:Content>

