<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.PositionPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 251px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на учител</h2>
    <table class="BigText">
        <tr>
            <td>Длъжност :
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtPosition" placeholder="Длъжност" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="txtPosition"
                    ErrorMessage="Трябва да въведете позиция." Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="txtPosition"
                    ErrorMessage="Трябва да въведете длъжност на кирилца от А до Я." ValidationExpression="^[а-яА-Я ]+$" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Заплащане :
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtSalary" placeholder="Длъжност" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="txtSalary"
                    ErrorMessage="Трябва да въведете заплащане." Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="txtSalary"
                    Error="Трябва да въведете заплата само с числа и точка (1000 или 1000.00)." ValidationExpression="(^[0-9]{1,9}$|^[0-9]{1,7}[.]{1}[0-9]{2}$)" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" Text="Записване" CssClass="bigButton" OnClick="btnRegister_Click" ValidationGroup="Register" CausesValidation="true" runat="server" />
            </td>
        </tr>
    </table>
        <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
