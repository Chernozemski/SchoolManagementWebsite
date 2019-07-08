<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RemoveAuthor.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.AuthorPages.RemoveAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Отписване на издатели</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getAndDeleteAuthors" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="Команда">
                <ItemTemplate>
                 <asp:Button ID="delete" runat="server" CausesValidation="False" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете този издател от базата данни ?')" CommandName="Delete" Text="Изтриване" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Publisher" HeaderText="Издател" SortExpression="Publisher" />
            <asp:BoundField DataField="BookCount" HeaderText="Брой на притежавани книги от издателя" SortExpression="BookCount" />
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
    <asp:SqlDataSource ID="getAndDeleteAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>"
         SelectCommand="SELECT [Id], [Publisher], [BookCount] FROM [vwPublisherInfo_tblAuthor]"></asp:SqlDataSource>
</asp:Content>
