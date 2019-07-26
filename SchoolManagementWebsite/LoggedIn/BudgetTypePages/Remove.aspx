<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Remove.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetTypePages.Remove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Отписване на операция</h2>
    <asp:GridView ID="gridViewBudgetType"  runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getAndDeleteBudgetType" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и/а) операци(и/я).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="Команда">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Изтриване" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете тази операция ?')" />
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:ObjectDataSource ID="getAndDeleteBudgetType" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Budget.CRUDBudgetType" DeleteMethod="Delete" OnDeleted="getAndDeleteBudgetType_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
