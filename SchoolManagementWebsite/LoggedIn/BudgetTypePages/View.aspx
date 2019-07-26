<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetTypePages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на операциите</h2>
    <asp:Label ID ="lblBudgetTypeCount" runat="server" />
    <asp:GridView ID="gridViewBudgetType" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getBudgetType" ForeColor="#333333" GridLines="None" OnDataBound="gridViewBudgetType_DataBound" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EmptyDataTemplate>
            Няма записан(и/а) операци(и/я).
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="Item" HeaderText="Операция" SortExpression="Item" />
            <asp:BoundField DataField="OperationType" HeaderText="Тип операция" SortExpression="OperationType" />
            <asp:BoundField DataField="OperationLength" HeaderText="Тип плащане" SortExpression="OperationLength" />
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
    <asp:ObjectDataSource ID="getBudgetType" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Budget.CRUDBudgetType"></asp:ObjectDataSource>
</asp:Content>
