<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RegisterClass.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassPages.RegisterClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Вписване на клас</h2>
    <table>
        <tr>
            <td>Въведете клас :</td>
            <td>
                <asp:DropDownList ID="ddlGrade" runat="server">
                    <asp:ListItem Text="Изберете клас" Value="0" />
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да изберете цифра." ControlToValidate="ddlGrade" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Буква на клас :</td>
            <td>
                <asp:TextBox ID="txtClassLetter" placeholder="Буква (А до Я)" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете буква." ControlToValidate="txtClassLetter" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationExpression="[А-Я]" ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете буква от А до Я." ControlToValidate="txtClassLetter" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Име на паралелката:</td>
            <td>
                <asp:DropDownList ID="ddlSpecialization" runat="server" DataSourceID="getSpecialization" DataTextField="Specialization" DataValueField="Id" >
                    <asp:ListItem Text="Изберете име на паралелка" Value="0" /> 
                </asp:DropDownList>
                <asp:SqlDataSource ID="getSpecialization" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="SELECT * FROM [vwSpecialization_tblSpecialization]" />
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете името на паралелката." ControlToValidate="ddlSpecialization" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Име на учителя:</td>
            <td>
                <asp:TextBox ID="txtTeacherName" placeholder="Името на учителя" runat="server"></asp:TextBox>
                <asp:Button ID="btnCheckTeacherEGN" Text="Провери" OnClick="btnCheckTeacherEGN_Click" runat="server" style="height: 26px" />
                <asp:Image ID="imgValidTeacher" CssClass="resizeImageSmall" runat="server" Visible="false" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете името на учителя." ControlToValidate="txtTeacherName" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Вписване" OnClick="btnRegister_Click" CssClass="bigButton" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
