<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.DoctorPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на доктор
    </h2>
    <table class="BigText">
        <tr>
            <td>Собствено име :
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" placeholder="Името на доктора." runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtFirstName" Text="*"
                    ErrorMessage="Трябва да въведете името на доктора." Display="Dynamic" CssClass="error" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Register" ControlToValidate="txtFirstName" ValidationExpression="^[а-яА-Я-]+$" Text="*" ErrorMessage="Името не трябва да съдържа цифри или символи."
                    Display="Dynamic" CssClass="error" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Фамилно име :
            </td>
            <td>
                <asp:TextBox ID="txtFamilyName" placeholder="Фамилията на доктора." runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtFamilyName" Text="*"
                    ErrorMessage="Трябва да въведете фамилията на доктора." Display="Dynamic" CssClass="error" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Register" ControlToValidate="txtFamilyName" ValidationExpression="^[а-яА-Я-]+$" Text="*" ErrorMessage="Фамилията не трябва да съдържа цифри или символи."
                    Display="Dynamic" CssClass="error" runat="server" />
            </td>
        </tr>
                <tr>
            <td>Телефонен номер :</td>
            <td>
                <asp:TextBox ID="txtPhoneNumber" placeholder="Телефонният номер на доктора." runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtPhoneNumber" Text="*"
                    ErrorMessage="Трябва да въведете телефонният на доктора." Display="Dynamic" CssClass="error" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Register" ControlToValidate="txtPhoneNumber" ValidationExpression="^[0-9]{10}$" Text="*" ErrorMessage="Телефонният номер не трябва да съдържа букви или символи."
                    Display="Dynamic" CssClass="error" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="register" ValidationGroup="Register" CssClass="bigButton BigText" Text="Записване" OnClick="register_Click" runat="server" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
