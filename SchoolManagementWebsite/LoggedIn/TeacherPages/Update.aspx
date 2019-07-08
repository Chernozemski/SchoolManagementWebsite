<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TeacherPages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на учителският състав</h2>
    <asp:GridView ID="gridViewUpdateTeacher" runat="server" AllowPaging="True" DataKeyNames="Id" AllowSorting="True" CellPadding="4" DataSourceID="getAndUpdateTeacher" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" OnRowUpdating="gridViewUpdateTeacher_RowUpdating" OnRowDataBound="gridViewUpdateTeacher_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EmptyDataTemplate>
            Няма записи в базата данни.
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ShowHeader="False">
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
            <asp:TemplateField HeaderText="Предмет" SortExpression="SubjectId">
                <EditItemTemplate>
                    <asp:DropDownList ID="SubjectId" runat="server" SelectedValue='<%# Bind("SubjectId") %>'
                        DataSourceID="getSubject" DataTextField="SubjectName" DataValueField="Id" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("SubjectId") %>'></asp:Label>
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
            <asp:TemplateField HeaderText="Длъжност" SortExpression="PositionId">
                <EditItemTemplate>
                    <asp:DropDownList ID="PositionId" runat="server" SelectedValue='<%# Bind("PositionId") %>'
                        DataSourceID="getPosition" DataTextField="Position" DataValueField="Id" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("PositionId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999"/>
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
    <asp:ObjectDataSource ID="getAndUpdateTeacher" runat="server" SelectMethod="ReadFull"
        TypeName="BusinessLayer.Teacher.CRUDInfo" UpdateMethod="Update" EnableCaching="True" CacheDuration="120" OnUpdated="getAndUpdateTeacher_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="FamilyName" Type="String" />
            <asp:Parameter Name="EGN" Type="String" />
            <asp:Parameter Name="SubjectId" Type="Int32" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Adress" Type="String" />
            <asp:Parameter Name="PositionId" Type="Int32" />
            <asp:Parameter Name="Photo" Type="string" />
            <asp:Parameter Name="Message" Type="String" Direction="Output" />
            <asp:Parameter Name="Color" Type="Object" Direction="Output" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getSubject" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Subject.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getPosition" runat="server" SelectMethod="Read" TypeName="BusinessLayer.Position.CRUD"></asp:ObjectDataSource>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Update" HeaderText="Проблеми при Обноняването" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" CssClass="BigText" />
</asp:Content>
