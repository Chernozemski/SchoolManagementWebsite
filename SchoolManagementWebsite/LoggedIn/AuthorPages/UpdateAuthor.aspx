<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="UpdateAuthor.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.AuthorPages.UpdateAuthor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Редактиране на добавените издатели</h2>
    <asp:GridView ID="authors" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getAndUpdateAuthors" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Button" HeaderText="Name" ShowEditButton="true" CancelText="Отмяна" EditText="Променяне" UpdateText="Обнови" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="false" SortExpression="Id" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="Publisher" HeaderText="Издателство" SortExpression="Publisher" />
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
    <asp:SqlDataSource ID="getAndUpdateAuthors" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>"
         SelectCommand="SELECT [Publisher], [Id], [BookCount] FROM [vwPublisherInfo_tblAuthor]"
        UpdateCommand="Update tblAuthor Set Publisher = @Publisher Where Id = @Id">
        <UpdateParameters>
            <asp:Parameter Name="Publisher" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
