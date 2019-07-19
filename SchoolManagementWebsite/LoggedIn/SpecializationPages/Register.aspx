<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Specialization.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Записване на специалност</h2>
    <table class="BigText">
        <tr>
            <td>Име на специалността :
            </td>
            <td>
                <asp:TextBox ID="txtSpecialization" placeholder="Името на специалността" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете име на специалност." ControlToValidate="txtSpecialization" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Името на специалността не трябва да притежава цифри или знаци и трябва да е на кирилица." ValidationExpression="^[А-Яа-я- ]+$" ControlToValidate="txtSpecialization" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
              <asp:Button ID="btnRegister" runat="server" Text="Записване"  CssClass="bigButton" ValidationGroup="Register" OnClick="btnRegister_Click" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
