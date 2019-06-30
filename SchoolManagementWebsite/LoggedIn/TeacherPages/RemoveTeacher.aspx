<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RemoveTeacher.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TeacherPages.RemoveTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Премахване на учител</h2>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnDataBound="GridView1_DataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ButtonType="Button" DeleteText="Изтриване" ShowDeleteButton="True" />
            <asp:BoundField DataField="FullName" HeaderText="Име" ReadOnly="True" SortExpression="FullName" />
            <asp:BoundField DataField="SubjectName" HeaderText="Предмет" SortExpression="SubjectName" />
            <asp:BoundField DataField="PhoneNum" HeaderText="Телефонен номер" ReadOnly="True" SortExpression="PhoneNum" />
            <asp:BoundField DataField="Adress" HeaderText="Местоживеене" SortExpression="Adress" />
            <asp:BoundField DataField="Position" HeaderText="Длъжност" SortExpression="Position" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
            Няма записи в базата данни.
        </EmptyDataTemplate>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" DeleteCommand="Delete From tblTeacherInfo Where Id = @Id Delete from tblTeacherAccount Where Id = @Id" SelectCommand="SELECT * FROM [vw_tblTeacherInfo]">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
