<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.GradePages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на оценките</h2>

    <asp:Label ID="lblClassId" runat="server" Text="За клас :"></asp:Label>

    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True"
         AppendDataBoundItems="true" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" OnDataBinding="ddlClass_DataBinding">
        <asp:ListItem Text="Всеки клас" Value="0" />
    </asp:DropDownList>
    <asp:Label ID="lblGradeCount" runat="server" />
    <asp:GridView ID="gridViewGrade" runat="server" OnDataBound="gridViewGrade_DataBound" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getGrade" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) оценк(а/и).
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="StudentInClassId" HeaderText="Номер на ученик" SortExpression="StudentInClassId" />
            <asp:BoundField DataField="StudentName" HeaderText="Име на ученик" SortExpression="StudentName" ReadOnly="True" />
            <asp:BoundField DataField="Grade" HeaderText="Оценка" SortExpression="Grade" ReadOnly="True" />
            <asp:BoundField DataField="LessonName" HeaderText="Урок" SortExpression="LessonName" />
            <asp:BoundField DataField="OnDate" HeaderText="Дата" SortExpression="OnDate" />
            <asp:BoundField DataField="FullTeacherName" HeaderText="Оценен от" ReadOnly="True" SortExpression="FullTeacherName" />
            <asp:BoundField DataField="ClassName" HeaderText="Клас" SortExpression="ClassName" ReadOnly="True" />
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
    <asp:ObjectDataSource ID="getGrade" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Grade.CRUD">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />

</asp:Content>
