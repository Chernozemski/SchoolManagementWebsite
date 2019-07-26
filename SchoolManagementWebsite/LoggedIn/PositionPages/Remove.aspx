<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Remove.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.PositionPages.Remove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Отписване на длъжност</h2>
    <asp:GridView ID="gridViewPosition" runat="server" DataKeyNames="Id" AllowSorting="True" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="getAndRemovePosition" CellPadding="4" ForeColor="#333333" GridLines="None">
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
            Няма записан(а/и) длъжност(и).
        </EmptyDataTemplate>
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Команда">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Изтриване" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете тази позиция ?')" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Position" HeaderText="Длъжност" SortExpression="Position" />
            <asp:BoundField DataField="Salary" HeaderText="Заплащане" SortExpression="Salary" />
        </Columns>
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
    <asp:ObjectDataSource ID="getAndRemovePosition" runat="server" DeleteMethod="Delete" OnDeleted="getAndRemovePosition_Deleted" SelectMethod="Read" TypeName="BusinessLayer.Position.CRUD" >
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText"></asp:Label>
</asp:Content>
