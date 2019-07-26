<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.LessonPages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на уроците</h2>
    <asp:Label ID="lblClassId" runat="server" Text="За клас :"></asp:Label>

    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True"
         AppendDataBoundItems="true" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" OnDataBinding="ddlClass_DataBinding">
        <asp:ListItem Text="Всеки клас" Value="0" />
    </asp:DropDownList>
    <asp:Label ID="lblLessonCount" runat="server" />
    <asp:GridView ID="gridViewLesson" runat="server" OnDataBound="gridViewLesson_DataBound" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getLesson" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) уро(к/ци).
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="LessonName" HeaderText="Урок" SortExpression="LessonName" />
            <asp:BoundField DataField="OnDate" HeaderText="На дата" SortExpression="OnDate" />
            <asp:BoundField DataField="MissingStudentId" HeaderText="Отсъстващи" SortExpression="MissingStudentId" />
            <asp:BoundField DataField="LateStudentId" HeaderText="Закъснели" SortExpression="LateStudentId" />
            <asp:BoundField DataField="ClassName" HeaderText="Клас" ReadOnly="True" SortExpression="ClassName" />
            <asp:BoundField DataField="NameDay" HeaderText="Ден" SortExpression="NameDay" />
            <asp:BoundField DataField="LessonHour" HeaderText="Час" SortExpression="LessonHour" />
            <asp:BoundField DataField="SubjectName" HeaderText="Предмет" SortExpression="SubjectName" />
            <asp:BoundField DataField="TeacherFullName" HeaderText="Учител" ReadOnly="True" SortExpression="TeacherFullName" />
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
    <asp:ObjectDataSource ID="getLesson" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Lesson.CRUD">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
