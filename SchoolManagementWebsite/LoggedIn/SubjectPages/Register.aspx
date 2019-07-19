<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.SubjectPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на предмет</h2>
    <table class="BigText">
        <tr>
            <td>Името на предмета:
            </td>
            <td>
                <asp:TextBox ID="txtSubjectName" placeholder="Име на предмет" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ErrorMessage="Трябва да въведете името на предмета." Display="Dynamic"
                    ControlToValidate="txtSubjectName" runat="server" CssClass="error" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" ErrorMessage="Името на предмет трябва да се състой само от букви (кирилица), цифри, терета и интервали." Display="Dynamic"
                    ControlToValidate="txtSubjectName" ValidationExpression="^[а-яА-Я0-9- ]+$" runat="server" CssClass="error" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" Text="Записване" CssClass="bigButton" OnClick="btnRegister_Click" CausesValidation="true" ValidationGroup="Register" runat="server" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
