<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetPages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Преглед на приходите/разходите</h2>
    <asp:GridView ID="gridViewBudget" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getBudget" ForeColor="#333333" GridLines="None" OnRowDataBound="gridViewBudget_RowDataBound" OnDataBound="gridViewBudget_DataBound" ShowFooter="True" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) операци(и/я).
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="Item" HeaderText="Операция" SortExpression="Item" />
            <asp:BoundField DataField="DescriptionForItem" HeaderText="Описание" SortExpression="DescriptionForItem" />
            <asp:BoundField DataField="Operation" HeaderText="Тип операция" SortExpression="Operation" />
            <asp:BoundField DataField="Payment" HeaderText="Тип плащане" SortExpression="Payment" />
            <asp:BoundField DataField="Amount" HeaderText="Стойност" SortExpression="Amount" />
            <asp:BoundField DataField="OnDate" HeaderText="На дата" SortExpression="OnDate" />
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
    <asp:ObjectDataSource ID="getBudget" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Budget.CRUDBudget" />
</asp:Content>
