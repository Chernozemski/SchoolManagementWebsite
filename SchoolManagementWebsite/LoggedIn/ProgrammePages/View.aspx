<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Programme.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на програмите</h2>
    <asp:Label ID="lblForClass" runat="server" Text="За клас :" CssClass="bigText" />
    <asp:DropDownList ID="ddlClass" runat="server" DataSourceID="getClass" AppendDataBoundItems="true" DataTextField="FullClassName" DataValueField="Id" AutoPostBack="True">
        <asp:ListItem Text="Всеки клас" Value ="0" />
    </asp:DropDownList>
    <asp:Label ID="lblProgrammeCount" runat="server" />
    <asp:GridView ID ="gridViewProgramme" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getProgramme" ForeColor="#333333" GridLines="None" AllowPaging="True" OnDataBound="gridViewProgramme_DataBound" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) програм(а/и).
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="ClassName" HeaderText="Клас" ReadOnly="True" SortExpression="ClassName" />
            <asp:BoundField DataField="NameDay" HeaderText="Ден" SortExpression="NameDay" />
            <asp:BoundField DataField="LessonHour" HeaderText="Час" SortExpression="LessonHour" />
            <asp:BoundField DataField="SubjectName" HeaderText="Предмет" SortExpression="SubjectName" />
            <asp:BoundField DataField="TeacherFullName" HeaderText="С учител" ReadOnly="True" SortExpression="TeacherFullName" />
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
    <asp:ObjectDataSource ID="getProgramme" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Programme.CRUD">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
</asp:Content>
