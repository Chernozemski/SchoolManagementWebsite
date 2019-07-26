<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Remove.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TimeTablePages.Remove" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Отписване на час</h2>
    <asp:GridView ID="gridViewTimeTable" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id"
        DataSourceID="getAndRemoveTimeTable" AllowSorting="True" ForeColor="#333333" GridLines="None" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) час(ове).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете този запис?')" Text="Премахване" />
                </ItemTemplate>
            </asp:TemplateField>
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
    <asp:ObjectDataSource ID="getAndRemoveTimeTable" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.TimeTable.CRUD" DeleteMethod="Delete" OnDeleted="getAndRemoveTimeTable_Deleted">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText"></asp:Label>
</asp:Content>
