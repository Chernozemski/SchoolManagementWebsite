<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.StudentPages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Записване на ученик</h2>
    <table class="BigText">
        <tr>
            <td>Собствено име :
            </td>
            <td>
                <asp:TextBox ID="txtFirstName" placeholder="Собствено име на ученика" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете собствено име на ученика." ControlToValidate="txtFirstName" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Собственото име не трябва да притежава цифри или знаци" ValidationExpression="^[А-Яа-я-]+$" ControlToValidate="txtFirstName" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Бащино име :
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtMiddleName" placeholder="Бащино име на ученика" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете бащино име на ученика." ControlToValidate="txtMiddleName" runat="server" Display="Dynamic" />
                 <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Бащиното име не трябва да притежава цифри или знаци" ValidationExpression="^[А-Яа-я-]+$" ControlToValidate="txtMiddleName" runat="server" Display="Dynamic" />
                 </td>
        </tr>
        <tr>
            <td>Фамилно име :
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtFamilyName" placeholder="Фамилно име на ученика" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете фамилно име на ученика." ControlToValidate="txtFamilyName" runat="server" Display="Dynamic" />
                            <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Фамилията не трябва да притежава цифри или знаци" ValidationExpression="^[А-Яа-я-]+$" ControlToValidate="txtFamilyName" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>ЕГН:
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtEGN" placeholder="ЕГН-то на ученика (10 цифри)" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете ЕГН-то на ученика." ControlToValidate="txtEGN" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationExpression="^[0-9]{10}$" ValidationGroup="Register" ControlToValidate="txtEGN" ErrorMessage="ЕГН-то трябва да има 10 цифри." Text="*" CssClass="error" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Телефонен Номер:
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtNumber" placeholder="Телефонен номер на ученика (10 цифри)" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете телефонният номер на ученика." ControlToValidate="txtNumber" runat="server" Display="Dynamic" />
                <asp:RegularExpressionValidator ValidationExpression="^[0-9]{10}$" ValidationGroup="Register" ControlToValidate="txtNumber" ErrorMessage="Телефонният номер трябва да има 10 цифри." Text="*" CssClass="error" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Адрес:
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="txtAdress" placeholder="Адрес на местоживеене на ученика" Width="200px" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Трябва да въведете адрес на местоживеене." ControlToValidate="txtAdress" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Снимка:
            </td>
            <td>
                <asp:FileUpload ID="fileUploadPhoto" runat="server" placeholder="Снимка на учител" accept="image/jpg, image/png, image/jpeg" />
                <asp:Button ID="btnClear" runat="server" Text="Изчисти" OnClick="btnClear_Click"/>
            </td>
            <td class="hideBorder">
                <asp:RegularExpressionValidator runat="server"
                    ControlToValidate="fileUploadPhoto"
                    Text="*" CssClass="error"
                    ErrorMessage="Само файлове с .jpg,.png,.jpeg са позволени или празна снимка."
                    ValidationGroup="Register"
                    ValidationExpression="((.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$)|(^ $)" />
            </td>
        </tr>
        <tr>
            <td>Доктор:</td>
            <td>
                <asp:DropDownList ID="ddlDoctor" runat="server" DataSourceID="getDoctor" AppendDataBoundItems="true" DataTextField="FullDoctorName" DataValueField="Id">
                    <asp:ListItem Text="Изберете доктор" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getDoctor" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Doctor.CRUD"></asp:ObjectDataSource>
                </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" CssClass="error" Text="*"  InitialValue="0"
                    ErrorMessage="Трябва да изберете името на доктора." ControlToValidate="ddlDoctor" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Пълно име на родител:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtParentName" placeholder="Име, презиме, фамилия." runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" ControlToValidate="txtParentName" CssClass="error" Text="*" ErrorMessage="Трябва да въведете името на родителя." Display="Dynamic" runat="server" />
                           <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Името на родителя не трябва да притежава цифри или знаци" ValidationExpression="^[А-Яа-я- ]+$" ControlToValidate="txtParentName" runat="server" Display="Dynamic" />
                 </td>
        </tr>
        <tr>
            <td>Тел.номер на родител:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtParentNumber" placeholder="Номер на родителя" runat="server" /> 
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" Display="Dynamic" ErrorMessage="Трябва да въведете телефонният номер на родителя." runat="server" ControlToValidate="txtParentNumber" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" Display="Dynamic" ErrorMessage="Телефонният номер на родителя трябва да съдържа само 10 цифри" ControlToValidate="txtParentNumber" ValidationExpression="^[0-9]{10}$" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Местоживеене на родител:</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtParentAdress" placeholder="Адрес на родител." runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" Display="Dynamic" ErrorMessage="Трябва да въведете адреса на местоживеене на родителя." runat="server" ControlToValidate="txtParentAdress" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
              <asp:Button ID="btnRegister" runat="server" Text="Записване"  CssClass="bigButton BigText" ValidationGroup="Register" OnClick="btnRegister_Click" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
        <a href="../DoctorPages/RegisterDoctor.aspx">Не сте записали доктор ?</a>
</asp:Content>
