<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RemoveClass.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassPages.RemoveClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Отписване на клас</h2>
    <asp:GridView ID="gridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getClasses" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Команда">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Изтриване" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете този клас от базата данни ?')" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="FullClassName" HeaderText="Клас" SortExpression="FullClassName" ReadOnly="True" />
            <asp:BoundField DataField="Specialization" HeaderText="Паралелка" SortExpression="Specialization" />
            <asp:BoundField DataField="FullTeacherName" HeaderText="Класен ръководител" SortExpression="FullTeacherName" ReadOnly="True" />
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
    <asp:SqlDataSource ID="getClasses" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>"
         SelectCommand="SELECT * FROM [vwClass_tblClass]"
        DeleteCommand="Delete From tblClass Where Id = @Id">
    </asp:SqlDataSource>
</asp:Content>
