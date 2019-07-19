<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.DoctorPages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на доктор</h2>
    <asp:GridView ID="gridViewDoctor" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CellPadding="4" DataSourceID="getAndUpdateDoctor"
         ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) доктор(и).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="Команда">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidationGroup="Update" CommandName="Update" OnClientClick="return confirm('Сигурни ли сте че искате да промените този запис ?')" Text="Обновяване" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмяна" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Промяна" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Собствено име" SortExpression="FirstName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("FirstName") %>' />
                    <asp:RegularExpressionValidator ValidationGroup="Update" Text="*" CssClass="error"
                        ErrorMessage="Трябва да въведете собственото име на доктора на кирилица." ControlToValidate="txtFirstName"
                        ValidationExpression="^[а-яА-Я]{1,20}$" Display="Dynamic" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Фамилно име" SortExpression="FamilyName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFamilyName" runat="server" Text='<%# Bind("FamilyName") %>' />
                    <asp:RegularExpressionValidator ValidationGroup="Update" Text="*" CssClass="error"
                        ErrorMessage="Трябва да въведете фамилното име на доктора на кирилица." ControlToValidate="txtFamilyName"
                        ValidationExpression="^[а-яА-Я]{1,20}$" Display="Dynamic" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("FamilyName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Тел. номер" SortExpression="PhoneNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' OnDataBinding="txtPhoneNumber_DataBinding" />
                    <asp:RegularExpressionValidator ValidationGroup="Update" Text="*" CssClass="error"
                        ErrorMessage="Трябва да въведете телефонният номер, който е съставен само от 10 цифри." ControlToValidate="txtPhoneNumber"
                        ValidationExpression="^[0-9]{10}$" Display="Dynamic" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:ObjectDataSource ID="getAndUpdateDoctor" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Doctor.CRUD" UpdateMethod="Update" OnUpdated="getAndUpdateDoctor_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="FamilyName" Type="String" />
            <asp:Parameter Name="Phonenumber" Type="String" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ValidationSummary ID="ErrorSummary" runat="server" CssClass="error" DisplayMode="List" HeaderText="Проблеми при Обноняването" ShowSummary="true" ShowValidationErrors="true" ValidationGroup="Update" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
