<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RegisterBook.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BookPages.RegisterBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Вписване на учебник</h2>
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
            </td>
        </tr>
        <tr>
            <td>Име на издателя:
            </td>
            <td>
                <asp:DropDownList ID="ddlPublisher" AppendDataBoundItems="true" runat="server">
                    <asp:ListItem Text="Трябва да изберете издател" Value="0" Selected="True" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="getPublishers" runat="server"></asp:SqlDataSource>

            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="ddlPublisher" Text="*" CssClass="error"
                    ErrorMessage="Трябва да въведете името на издателя." InitialValue="0" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>За клас:
            </td>
            <td>
                <asp:DropDownList ID="ddlGrade" AppendDataBoundItems="true" runat="server">
                    <asp:ListItem Text="Трябва да изберете клас" Value="0" Selected="True" />
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem Value="7"></asp:ListItem>
                    <asp:ListItem Value="8"></asp:ListItem>
                    <asp:ListItem Value="9"></asp:ListItem>
                    <asp:ListItem Value="10"></asp:ListItem>
                    <asp:ListItem Value="11"></asp:ListItem>
                    <asp:ListItem Value="12"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="ddlGrade" Text="*" CssClass="error"
                    ErrorMessage="Трябва да изберете клас." InitialValue="0" runat="server" Display="Dynamic" />
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
                <asp:RegularExpressionValidator ValidationGroup="Register" ControlToValidate="txtYear" ValidationExpression="^[0-9]{4}$" Text="*" CssClass="error"
                    ErrorMessage="Годината се пише с цифри и трябва да е в рамките от 1950 до сега." runat="server" Display="Dynamic" />
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
                <asp:RegularExpressionValidator ValidationGroup="Register" ControlToValidate="txtQuantity" ValidationExpression="^[0-9]{4}$" Text="*" CssClass="error"
                    ErrorMessage="Количеството се пише с цифри." runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Вписване" OnClick="btnRegister_Click" CssClass="bigButton BigText" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
