<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TeacherPages.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на учителският състав</h2>
    <asp:GridView ID="getTeacher" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getTeacherView" ForeColor="#333333" GridLines="None" OnRowDataBound="getTeacher_RowDataBound" AllowSorting="True" OnLoad="getTeacher_Load" PageSize="5">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Снимка">
                <ItemTemplate>
                    <asp:Image ID="Photo" runat="server" CssClass="resizeImageSmall" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FullName" HeaderText="Пълно име" SortExpression="FullName" />
            <asp:BoundField DataField="SubjectName" HeaderText="Предмет" SortExpression="SubjectName" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Телефонен номер" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Adress" HeaderText="Местоживеене" SortExpression="Adress" />
            <asp:BoundField DataField="Position" HeaderText="Длъжност" SortExpression="Position" />
            <asp:BoundField DataField="Class" HeaderText="Класен на" SortExpression="Class" NullDisplayText="Няма клас" />
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
    <asp:ObjectDataSource ID="getTeacherView" runat="server" SelectMethod="Read" TypeName="BusinessLayer.Teacher.CRUDInfo">
    </asp:ObjectDataSource>
</asp:Content>
