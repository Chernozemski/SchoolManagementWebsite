<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TimeTablePages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на часовете</h2>
    <asp:Label ID="lblTimeTableCount" runat="server" />
    <asp:GridView ID="gridViewTimeTable" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" 
        DataSourceID="getTimeTable" AllowSorting="True" ForeColor="#333333" GridLines="None" AllowPaging="True" OnDataBound="gridViewTimeTable_DataBound" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) час(ове).
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="LessonHour" HeaderText="Учебен час" SortExpression="LessonHour" />
            <asp:BoundField DataField="LessonTime" HeaderText="Астрономически час" SortExpression="LessonTime" />
            <asp:BoundField DataField="ShiftName" HeaderText="Смяна" SortExpression="ShiftName" />
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
    <asp:ObjectDataSource ID="getTimeTable" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.TimeTable.CRUD" />
</asp:Content>
