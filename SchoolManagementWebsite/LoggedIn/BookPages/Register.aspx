<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BookPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на учебник</h2>
    <table class="BigText">
        <tr>
            <td>Име на учебника:
            </td>
            <td>
                <asp:TextBox ID="txtBook" placeholder="Името на учебника" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtBook" Text="*" CssClass="error"
                    ErrorMessage="Трябва да въведете името на учебника." runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidateGroup="Register" ControlToValidate="txtBook" Text="*" CssClass="error"
                    ErrorMessage="Трябва името на учебника да не е повече от 20 символа." ValidationExpression="^^.{1,20}$" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Име на издателя:
            </td>
            <td>
                <asp:DropDownList ID="ddlPublisher" AppendDataBoundItems="True" runat="server" DataSourceID="getPublisher" DataTextField="Publisher" DataValueField="Id">
                    <asp:ListItem Text="Трябва да изберете издател" Value="0" Selected="True" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getPublisher" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Author.CRUD"></asp:ObjectDataSource>

            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="ddlPublisher" Text="*" CssClass="error"
                    ErrorMessage="Трябва да изберете името на издателя." InitialValue="0" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>За клас:
            </td>
            <td>
                <asp:DropDownList ID="ddlGrade" AppendDataBoundItems="true" runat="server" OnLoad="ddlGrade_Load">
                    <asp:ListItem Text="Трябва да изберете клас" Value="0" Selected="True" />
                </asp:DropDownList>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="ddlGrade" Text="*" CssClass="error"
                    ErrorMessage="Трябва да изберете клас." InitialValue="0" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Предмет:
            </td>
            <td>
                <asp:DropDownList ID="ddlSubject" runat="server" DataSourceID="getSubject" DataTextField="SubjectName" DataValueField="Id" />
                <asp:ObjectDataSource ID="getSubject" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Subject.CRUD" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="ddlSubject" Text="*" CssClass="error"
                    ErrorMessage="Трябва да изберете предмет." InitialValue="0" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Година на издаване:</td>
            <td>
                <asp:TextBox ID="txtYear" placeholder="Годината на издаване на учебника" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtYear" Text="*" CssClass="error"
                    ErrorMessage="Трябва да напишете година." runat="server" Display="Dynamic" />
                <asp:RangeValidator ValidationGroup="Register" ControlToValidate="txtYear" MinimumValue="1949" MaximumValue="" Text="*" CssClass="error"
                    ErrorMessage="Годината се пише с цифри и трябва да е в рамките от 1950 до сега." runat="server" Display="Dynamic" OnLoad="Unnamed7_Load" />
            </td>
        </tr>
        <tr>
            <td>Количество:</td>
            <td>
                <asp:TextBox ID="txtQuantity" placeholder="Количеството на учебници в наличност." runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtQuantity" Text="*" CssClass="error"
                    ErrorMessage="Трябва да напишете количество." runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" ControlToValidate="txtQuantity" ValidationExpression="^([1-9][0-9]+|[0-9]{1})$" Text="*" CssClass="error"
                    ErrorMessage="Количеството трябва да е съставено само от цифри." runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Записване" OnClick="btnRegister_Click" CssClass="bigButton" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
