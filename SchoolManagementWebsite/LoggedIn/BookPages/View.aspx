<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BookPages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Преглед на учебниците</h2>
    <asp:Label ID="lblBookCount" runat="server" />
<asp:GridView ID="gridViewBook" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getBook" ForeColor="#333333" GridLines="None" PageSize="5" OnDataBound="gridViewBook_DataBound" >
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EmptyDataTemplate>
            Няма записан(а/и) книг(а/и).
        </EmptyDataTemplate>
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Заглавие" SortExpression="Name" />
        <asp:BoundField DataField="Publisher" HeaderText="Издател" SortExpression="Publisher" />
        <asp:BoundField DataField="Grade" HeaderText="За клас" SortExpression="Grade" />
        <asp:BoundField DataField="SubjectName" HeaderText="По предмет" SortExpression="SubjectName" />
        <asp:BoundField DataField="PublishedYear" HeaderText="Година на издаване" SortExpression="PublishedYear" />
        <asp:BoundField DataField="Quantity" HeaderText="В наличност" SortExpression="Quantity" />
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
    <asp:ObjectDataSource ID="getBook" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Book.CRUD" />
</asp:Content>
