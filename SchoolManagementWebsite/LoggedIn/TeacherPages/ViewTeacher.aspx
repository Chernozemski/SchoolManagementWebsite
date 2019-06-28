<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="ViewTeacher.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TeacherPages.ViewTeacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на учителският състав</h2>
        <asp:GridView ID="gridViewTeacherInfo" runat="server" AllowPaging="True" AllowSorting="True" OnDataBinding="GridView1_DataBinding" AutoGenerateColumns="False" DataSourceID="getTeachers" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField HeaderText="Име" DataField="FullName" SortExpression="FullName"/>
                <asp:BoundField HeaderText="Предмет" DataField="SubjectName" SortExpression="SubjectName"/>
                <asp:BoundField HeaderText="Тел. номер" DataField="PhoneNum" SortExpression="PhoneNum" />
                <asp:BoundField DataField="Adress" HeaderText="Адрес" SortExpression="Adress" Visible="false"/>
                <asp:BoundField DataField="Position" HeaderText="Длъжност" SortExpression="Position" Visible="false"/>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="getTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="SELECT [FullName], [SubjectName], [PhoneNum], [Adress], [Position] FROM [vw_tblTeacherInfo]" />
</asp:Content>
