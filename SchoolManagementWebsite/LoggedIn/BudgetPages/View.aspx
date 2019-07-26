<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetPages.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на приходите/разходите</h2>
    <asp:Label ID="lblBudgetItemsCount" runat="server" />
    <asp:GridView ID="gridViewBudget" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getBudget" ForeColor="#333333" GridLines="None" OnRowDataBound="gridViewBudget_RowDataBound" OnDataBound="gridViewBudget_DataBound" ShowFooter="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) операци(и/я).
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="Item" HeaderText="Операция" SortExpression="Item" />
            <asp:BoundField DataField="DescriptionForItem" HeaderText="Описание" SortExpression="DescriptionForItem" />
            <asp:BoundField DataField="Operation" HeaderText="Тип операция" SortExpression="Operation" />
            <asp:BoundField DataField="Payment" HeaderText="Тип плащане" SortExpression="Payment" />
            <asp:TemplateField HeaderText="Стойност" SortExpression="Amount">
                <ItemTemplate>
                    <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("Amount","{0} лв.") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
    <table>
        <tr>
            <td>
                Операция :
            </td>
            <td>
                <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="getItemId" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="Item" DataValueField="Id">
               <asp:ListItem Text="Изберете операция" Value="0" />
                     </asp:DropDownList>
                <asp:ObjectDataSource ID="getItemId" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDBudgetType"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>Година :</td>
            <td>
                <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" AppendDataBoundItems="True" DataSourceID="getYear">
                    <asp:ListItem Text="Изберете година" Value ="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getYear" runat="server" SelectMethod="ReadYears" TypeName="BusinessLayer.Budget.CRUDBudget"></asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="getBudget" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Budget.CRUDBudget" >
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlItem" DefaultValue="0" Name="ItemId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlYear" DefaultValue="0" Name="Year" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
