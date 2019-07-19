<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на клас</h2>
    <table class="BigText">
        <tr>
            <td>Въведете клас :</td>
            <td>
                <asp:DropDownList ID="ddlGrade" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да изберете цифра." ControlToValidate="ddlGrade" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Буква на клас :</td>
            <td>
                <asp:DropDownList ID="ddlLetter" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error" 
                    ErrorMessage="Трябва да изберете буква." ControlToValidate="ddlLetter" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Име на паралелката:</td>
            <td>
                <asp:DropDownList ID="ddlSpecialization" runat="server" AppendDataBoundItems="true" DataSourceID="getSpecialization" DataTextField="Specialization" DataValueField="Id" >
                    <asp:ListItem Text="Изберете име на паралелка" Value="0" /> 
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getSpecialization" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Specialization.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете името на паралелката." ControlToValidate="ddlSpecialization" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Име на учителя:</td>
            <td>
                <asp:DropDownList ID="ddlTeacher" runat="server" AppendDataBoundItems="True" DataSourceID="getTeacher" DataTextField="FullTeacherName" DataValueField="EGN" />
                <asp:ObjectDataSource ID="getTeacher" runat="server" SelectMethod="ReadWithFullNameAndEGN" TypeName="BusinessLayer.Teacher.CRUDInfo"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                            <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете името на учителя." ControlToValidate="ddlTeacher" runat="server" Display="Dynamic" />
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
