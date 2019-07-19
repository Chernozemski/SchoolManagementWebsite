<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassPages.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на класовете</h2>
    <asp:GridView ID="gridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getClass" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) клас(ове).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="Клас" SortExpression="Grade">
                <ItemTemplate>
                    <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>' />
                    <asp:Label ID="lblLetter" runat="server" Text='<%# Bind("Letter") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FullTeacherName" HeaderText="Класен ръководител" ReadOnly="True" SortExpression="FullTeacherName" />
            <asp:BoundField DataField="Specialization" HeaderText="Паралелка" SortExpression="Specialization" />
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
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
</asp:Content>
