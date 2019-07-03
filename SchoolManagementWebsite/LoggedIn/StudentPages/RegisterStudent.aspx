<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RegisterStudent.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.StudentPages.RegisterStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 310px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Вписване на ученик</h2>
    <table class="BigText">
        <tr>
            <td>Собствено име :
            </td>
            <td class="auto-style1">
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
            <td>Клас:</td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlGrade" runat="server" AppendDataBoundItems="True" DataSourceID="getGrade" DataTextField="Grade" DataValueField="Id" AutoPostBack="True">
                <asp:ListItem Selected="True" Text="Изберете клас" Value="0" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="getGrade" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="SELECT [Grade], [Id] FROM [tblClass]" />
                <asp:DropDownList ID="ddlLetter" runat="server" AppendDataBoundItems="True" DataSourceID="getLetter" DataTextField="Specialization" DataValueField="Id" Height="16px" Width="80px">
                    <asp:ListItem Selected="True" Text="Изберете паралелка" Value="0" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="getLetter" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="SELECT Id, [FullClassName] + ' ' + [Specialization] as Specialization FROM [vwClass_tblClass] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlGrade" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" InitialValue="0" Text="*" CssClass="error"
                     ErrorMessage="Трябва да въведете клас." ControlToValidate="ddlGrade" runat="server" Display="Dynamic" />
                <asp:RequiredFieldValidator ValidationGroup="Register" InitialValue="0" Text="*" CssClass="error" 
                    ErrorMessage="Трябва да въведете паралелка." ControlToValidate="ddlLetter" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Снимка:
            </td>
            <td class="auto-style1">
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
            <td class="auto-style1">
                <asp:TextBox ID="txtDoctor" placeholder="Име и фамиля" runat="server" />
                <asp:Button ID="btncheckDoctorId" Text="Провери име" runat="server" OnClick="btncheckDoctorId_Click"/>
                <asp:Image ID="hasDoctorImage" Visible="false" runat="server" CssClass="resizeImageVerySmall" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" CssClass="error" Text="*" 
                    ErrorMessage="Трябва да въведете името на доктора." ControlToValidate="txtDoctor" Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error" ErrorMessage="Името на доктора не трябва да притежава цифри или знаци" ValidationExpression="^[А-Яа-я- ]+$" ControlToValidate="txtDoctor" runat="server" Display="Dynamic" />
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
              <asp:Button ID="btnRegister" runat="server" Text="Вписване" CssClass="bigButton" ValidationGroup="Register" OnClick="btnRegister_Click" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
