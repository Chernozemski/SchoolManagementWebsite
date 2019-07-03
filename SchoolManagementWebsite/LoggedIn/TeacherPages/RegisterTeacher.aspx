<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" ValidateRequest="true" CodeBehind="RegisterTeacher.aspx.cs" Inherits="SchoolManagementWebsite.RegisterTeacher.Register" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Вписване на учител</h2>
    <table class="BigText">
        <tr>
            <td>Собствено име :
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" placeholder="Собствено име" runat="server"></asp:TextBox>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете собствено име." ControlToValidate="txtFirstName" runat="server" Display="Dynamic" />
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
            </td>
        </tr>
        <tr>
            <td>Предмет:
            </td>
            <td>
                <asp:DropDownList ID="ddlSubject" AppendDataBoundItems="true" runat="server" DataSourceID="GetSubject" DataTextField="SubjectName" DataValueField="Id" />
                <asp:SqlDataSource ID="GetSubject" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="spGetSubjects_tblSubject" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td class="hideBorder">
                <asp:CompareValidator Operator="GreaterThan" ValueToCompare="0" ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да изберете предмет." ControlToValidate="ddlSubject" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td class="auto-style10">ЕГН:
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
                <asp:DropDownList ID="ddlPosition" AppendDataBoundItems="True" runat="server" DataSourceID="GetPosition" DataTextField="Position" DataValueField="Id" />
                <asp:SqlDataSource ID="GetPosition" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="spGetPosition_tblPosition" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
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
                <asp:Button ID="btnRegister" runat="server" Text="Вписване" OnClick="btnRegister_Click" CssClass="bigButton" ValidationGroup="Register" />
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

