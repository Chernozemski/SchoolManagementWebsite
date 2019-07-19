<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.AuthorPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на издатели</h2>
    <table class="BigText">
        <tr>
            <td>Име на издателя:
            </td>
            <td>
                <asp:TextBox ID="txtPublisher" placeholder="Името на издателя" runat="server" />
            </td>
            <td>
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtPublisher" Text="*" CssClass="error"
                    ErrorMessage="Трябва да въведете името на издателя." runat="server" />
                <asp:RegularExpressionValidator ValidationGroup ="Register" ControlToValidate="txtPublisher" Text="*" CssClass="error"
                    ErrorMessage="Трябва името на издателя да е от 1 до 20 знака." ValidationExpression="^.{1,20}$" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Записване" OnClick="btnRegister_Click"  CssClass="bigButton" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
