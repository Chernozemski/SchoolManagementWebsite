<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.StudentPages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на ученик</h2>
    <asp:GridView ID="gridViewStudent" runat="server" AllowPaging="True" DataKeyNames="ID" AllowSorting="True" CellPadding="4" DataSourceID="getAndUpdateStudent" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowDataBound="gridViewStudent_RowDataBound" OnRowUpdating="gridViewStudent_RowUpdating" PageSize="5">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) учени(к/ци).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ShowHeader="False" HeaderText="Команди">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidationGroup="Update" CommandName="Update" OnClientClick="return confirm('Сигурни ли сте че искате да промените този запис ?')" Text="Обновяване" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмяна" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Промяна" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Снимка">
                <EditItemTemplate>
                    <asp:FileUpload ID="fileUploadPhoto" runat="server" placeholder="Снимка на учител" accept="image/jpg, image/png, image/jpeg" />
                    <asp:RegularExpressionValidator runat="server"
                        ControlToValidate="fileUploadPhoto"
                        Text="*" CssClass="error"
                        ErrorMessage="Само файлове с .jpg,.png,.jpeg са позволени или празна снимка."
                        ValidationGroup="Register"
                        ValidationExpression="((.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$)|(^ $)" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Photo" runat="server" CssClass="resizeImageSmall" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Собствено име" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="FirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="FirstName"
                        CssClass="error" Text="*" ValidationExpression="^[А-Яа-я-]+$" ValidationGroup="Update"
                        ErrorMessage="Собственото име не трябва да съдържа цифри или символи и трябва да е на кирилица." />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Бащино име" SortExpression="MiddleName">
                <EditItemTemplate>
                    <asp:TextBox ID="MiddleName" runat="server" Text='<%# Bind("MiddleName") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="MiddleName"
                        CssClass="error" Text="*" ValidationExpression="^[А-Яа-я-]+$" ValidationGroup="Update"
                        ErrorMessage="Бащиното име не трябва да съдържа цифри или символи и трябва да е на кирилица." />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MiddleName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Фамилно име" SortExpression="FamilyName">
                <EditItemTemplate>
                    <asp:TextBox ID="FamilyName" runat="server" Text='<%# Bind("FamilyName") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="FamilyName"
                        CssClass="error" Text="*" ValidationExpression="^[А-Яа-я-]+$" ValidationGroup="Update"
                        ErrorMessage="Фамилното име не трябва да съдържа цифри или символи и трябва да е на кирилица." />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("FamilyName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Телефонен номер" SortExpression="PhoneNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="PhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="PhoneNumber"
                        CssClass="error" Text="*" ValidationExpression="^[0-9]{10}$" ValidationGroup="Update"
                        ErrorMessage="Телефонният номер не трябва да съдържа букви или символи." />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Adress" HeaderText="Местоживеене" SortExpression="Adress" />
            <asp:TemplateField HeaderText="ЕГН" SortExpression="EGN">
                <EditItemTemplate>
                    <asp:TextBox ID="EGN" runat="server" Text='<%# Bind("EGN") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="EGN"
                        CssClass="error" Text="*" ValidationExpression="^[0-9]{10}$" ValidationGroup="Update"
                        ErrorMessage="ЕГН-то не трябва да съдържа букви или символи." />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("EGN") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Клас" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:DropDownList ID="Grade" runat="server" SelectedValue='<%# Bind("ClassId") %>'
                        DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Visible="False" Text='<%# Bind("ClassId") %>'></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Доктор" SortExpression="DoctorFullName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("DoctorId") %>'
                        DataSourceID="getDoctor" DataTextField="FullDoctorName" DataValueField="Id">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Visible="false" Text='<%# Bind("DoctorId") %>'></asp:Label>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("DoctorFullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Родител" SortExpression="ParentFullName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtParentFullName" runat="server" Text='<%# Bind("ParentFullName") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtParentFullName"
                        CssClass="error" Text="*" ValidationExpression="^[А-Яа-я- ]+$" ValidationGroup="Update"
                        ErrorMessage="Името на родителя не трябва да съдържа цифри или символи и трябва да е на кирилица." />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("ParentFullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Телефонен номер на родител" SortExpression="ParentPhoneNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="parentPhoneNumber" runat="server" Text='<%# Bind("ParentPhoneNumber") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="PhoneNumber"
                        CssClass="error" Text="*" ValidationExpression="^[0-9]{10}$" ValidationGroup="Update"
                        ErrorMessage="Телефонният номер не трябва да съдържа букви или символи." />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("ParentPhoneNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ParentAdress" HeaderText="Адрес на родител" SortExpression="ParentAdress" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:ObjectDataSource ID="getAndUpdateStudent" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Student.CRUDInfo" UpdateMethod="Update" OnUpdated="getAndUpdateStudent_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="middleName" Type="String" />
            <asp:Parameter Name="familyName" Type="String" />
            <asp:Parameter Name="EGN" Type="String" />
            <asp:Parameter Name="phoneNumber" Type="String" />
            <asp:Parameter Name="adress" Type="String" />
            <asp:Parameter Name="Photo" Type="String" />
            <asp:Parameter Name="ClassId" Type="Int32" />
            <asp:Parameter Name="DoctorId" Type="Int32" />
            <asp:Parameter Name="ParentFullName" Type="String" />
            <asp:Parameter Name="ParentPhoneNumber" Type="String" />
            <asp:Parameter Name="ParentAdress" Type="String" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getDoctor" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Doctor.CRUD"></asp:ObjectDataSource>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Update" HeaderText="Проблеми при Обноняването" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" CssClass="BigText" />
</asp:Content>
