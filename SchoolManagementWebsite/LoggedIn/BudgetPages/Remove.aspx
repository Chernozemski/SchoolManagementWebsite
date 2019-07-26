<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Remove.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetPages.Remove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Отписване на приход/разход</h2>
    <asp:GridView ID="gridViewBudget" runat="server" DataKeyNames="Id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
         CellPadding="4" DataSourceID="getBudget" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) операци(и/я).
        </EmptyDataTemplate>
        <Columns>
                        <asp:TemplateField HeaderText="Команда">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Изтриване" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете тази операция ?')" />
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:ObjectDataSource ID="getBudget" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Budget.CRUDBudget" DeleteMethod="Delete" OnDeleted="getBudget_Deleted" >
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlItem" DefaultValue="0" Name="ItemId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlYear" DefaultValue="0" Name="Year" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Label ID="lblMessage" runat="server" CssClass="BigText"></asp:Label>
</asp:Content>
