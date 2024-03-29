﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" ValidateRequest="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.RegisterTeacher.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на учител</h2>
    <table class="BigText">
        <tr>
            <td>Собствено име :
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" placeholder="Собствено име" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете собствено име." ControlToValidate="txtFirstName" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error"
                    ErrorMessage="Собственото име не трябва да съдържа цифри или символи или интервали"
                    ControlToValidate="txtFirstName" ValidationExpression="^[а-яА-Я-]+$" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Бащино име :
            </td>
            <td>
                <asp:TextBox ID="txtMiddleName" placeholder="Бащино име" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете бащино име." ControlToValidate="txtMiddleName" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error"
                    ErrorMessage="Бащиното име не трябва да съдържа цифри или символи или интервали"
                    ControlToValidate="txtMiddleName" ValidationExpression="^[а-яА-Я-]+$" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Фамилно име :
            </td>
            <td>
                <asp:TextBox ID="txtFamilyName" placeholder="Фамилно име" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете фамилно име." ControlToValidate="txtFamilyName" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error"
                    ErrorMessage="Бащиното име не трябва да съдържа цифри или символи или интервали"
                    ControlToValidate="txtFamilyName" ValidationExpression="^[а-яА-Я-]+$" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Предмет:
            </td>
            <td>
                <asp:DropDownList ID="ddlSubject" AppendDataBoundItems="True" runat="server" DataSourceID="getSubject" DataTextField="SubjectName" DataValueField="Id" />
                <asp:ObjectDataSource ID="getSubject" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Subject.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да изберете предмет." ControlToValidate="ddlSubject" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td >ЕГН:
            </td>
            <td>
                <asp:TextBox ID="txtEGN" placeholder="ЕГН (10 цифри)" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете ЕГН." ControlToValidate="txtEGN" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationExpression="^[0-9]{10}$" ValidationGroup="Register" ControlToValidate="txtEGN" ErrorMessage="ЕГН-то трябва да има 10 цифри." Text="*" CssClass="error" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Телефонен Номер:
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtNumber" placeholder="Номер (10 цифри)" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете телефонен номер." ControlToValidate="txtNumber" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationExpression="^[0-9]{10}$" ValidationGroup="Register" ControlToValidate="txtNumber" ErrorMessage="Телефонният номер трябва да има 10 цифри." Text="*" CssClass="error" runat="server" Display="Dynamic" />

            </td>
        </tr>
        <tr>
            <td>Адрес:
            </td>
            <td>
                <asp:TextBox ID="txtAdress" placeholder="Адрес на местоживеене" Width="200px" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете адрес на местоживеене." ControlToValidate="txtAdress" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Позиция:
            </td>
            <td>
                <asp:DropDownList ID="ddlPosition" AppendDataBoundItems="True" runat="server" DataSourceID="getPosition" DataTextField="Position" DataValueField="Id" />
                <asp:ObjectDataSource ID="getPosition" runat="server" SelectMethod="Read" TypeName="BusinessLayer.Position.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете длъжност." ControlToValidate="ddlPosition" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Снимка:
            </td>
            <td>
                <asp:FileUpload ID="fileUploadPhoto" runat="server" placeholder="Снимка на учител" accept="image/jpg, image/png, image/jpeg" />
                <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click" />
            </td>
            <td>
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="fileUploadPhoto"
                    Text="*" CssClass="error"
                    ErrorMessage="Само файлове с .jpg,.png,.jpeg са позволени или празна снимка."
                    ValidationGroup="Register"
                    ValidationExpression="((.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$)|(^ $)" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Записване" OnClick="btnRegister_Click" CssClass="bigButton" CausesValidation="true" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #ddlSubject {
            width: 200px;
        }

        #ddlPosition {
            width: 200px;
        }
    </style>
</asp:Content>

