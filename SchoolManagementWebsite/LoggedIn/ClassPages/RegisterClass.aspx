<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RegisterClass.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassPages.RegisterClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Вписване на клас</h2>
    <table>
        <tr>
            <td>Въведете клас :</td>
            <td>
                <asp:DropDownList ID="ddlGrade" OnLoad="ddlGrade_Load" runat="server">
                    <asp:ListItem Text="Изберете клас" Value="0" />
                </asp:DropDownList>
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да изберете цифра." ControlToValidate="ddlGrade" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Буква на клас :</td>
            <td>
                <asp:TextBox ID="txtClassLetter" placeholder="Буква (А до Я)" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да въведете буква." ControlToValidate="txtClassLetter" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Име на паралелката:</td>
            <td>
                <asp:DropDownList ID="ddlSpecialization" runat="server" DataSourceID="getSpecialization" DataTextField="Specialization" DataValueField="Id" >
                    <asp:ListItem Text="Изберете име на паралелка" Value="0" /> 
                </asp:DropDownList>
                <asp:SqlDataSource ID="getSpecialization" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="SELECT [Id], [Specialization] FROM [vwGetSpecialization_tblSpecialization]" />
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да въведете името на паралелката." ControlToValidate="ddlSpecialization" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Име на учителя:</td>
            <td>
                <asp:TextBox ID="txtTeacherName" placeholder="Името на учителя" runat="server"></asp:TextBox>
                <asp:Button ID="btnCheckTeacherId" Text="Провери" OnClick="btnCheckTeacherId_Click" runat="server" style="height: 26px" />
                <asp:Image ID="imgValidTeacher" CssClass="resizeImageSmall" runat="server" Visible="false" />
                <asp:RadioButton ID="isTeacherIdChecked" runat="server" Visible="false" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ForeColor="Red" ErrorMessage="Трябва да въведете името на учителя." ControlToValidate="txtTeacherName" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Вписване" OnClick="btnRegister_Click" CssClass="bigButton" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" ForeColor="#990000" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
