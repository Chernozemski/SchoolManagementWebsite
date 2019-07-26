<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassStudentPages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на ученик в клас</h2>
     <table class="BigText">
        <tr>
            <td>Ученик :</td>
            <td>
                <asp:DropDownList ID="ddlStudent" runat="server" AppendDataBoundItems="true" DataSourceID="getStudent" DataTextField="FullName" DataValueField="Id">
                    <asp:ListItem Text="Изберете ученик" Value="0" />
                </asp:DropDownList>
                                    <asp:ObjectDataSource ID="getStudent" runat="server" SelectMethod="ReadStudentWithoutClassId" TypeName="BusinessLayer.Class.CRUDClassStudent"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator  ValidationGroup="Register" InitialValue="0" Text="*" CssClass="error"
                     ErrorMessage="Трябва да изберете ученик ." ControlToValidate="ddlStudent" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Клас :</td>
            <td>
                <asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="true" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id">
                    <asp:ListItem Text="Изберете клас" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator  ValidationGroup="Register" InitialValue="0" Text="*" CssClass="error"
                     ErrorMessage="Трябва да изберете клас ." ControlToValidate="ddlClass" runat="server" Display="Dynamic" />
            </td>
            </tr>
                 <tr>
            <td>Номер в клас : </td>
            <td>
                <asp:DropDownList ID="ddlStudentClassId" runat="server" OnLoad="ddlStudentClassId_Load" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlStudentClassId" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да изберете номер." InitialValue="0" Text="*" ValidationGroup="Register" />
            </td>
        </tr>
        <tr>
            <td>Отсъствия :</td>
            <td>
                <asp:TextBox ID="txtAbsent" placeholder="Брой отсъстия" runat="server" >0</asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете отсъствия." ControlToValidate="txtAbsent" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете отсъствия само с цифри." ValidationExpression="^[0-9]+$" ControlToValidate="txtAbsent" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Извинени отсъствия:</td>
            <td>
                <asp:TextBox ID="txtExcusedAbsent" placeholder="Брой отсъстия" runat="server" >0</asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете извинени отсъствия." ControlToValidate="txtExcusedAbsent" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете извинени отсъствия само с цифри." ValidationExpression="^[0-9]+$" ControlToValidate="txtExcusedAbsent" runat="server" Display="Dynamic" />
            </td>
        </tr>
                 <tr>
            <td>Закъснения:</td>
            <td>
                <asp:TextBox ID="txtLate" placeholder="Брой отсъстия" runat="server" >0.00</asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете число за закъснения." ControlToValidate="txtLate" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете число за закъснения в този формат (0.00)." ValidationExpression="^[0-9]{1,2}\.[0-9]{1,2}$" ControlToValidate="txtLate" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Записване" OnClick="btnRegister_Click" CausesValidation="true"  CssClass="bigButton" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
