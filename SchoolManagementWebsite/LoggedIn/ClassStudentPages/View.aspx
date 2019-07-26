<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassStudentPages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглеждане на ученик в клас</h2>
    <asp:Label ID="lblClassId" runat="server" Text="За клас :"></asp:Label>
    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" AppendDataBoundItems="true" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id">
        <asp:ListItem Text="Всеки клас" Value="0" />
    </asp:DropDownList>
    <asp:Label ID="lblStudentCount" runat="server" />
    <asp:GridView ID="gridViewClassStudent" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getClassStudent" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnDataBound="gridViewClassStudent_DataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EmptyDataTemplate>
            Няма записан(и) учени(к/ци) в класовете.
        </EmptyDataTemplate>
        <Columns>
            <asp:BoundField DataField="ClassName" HeaderText="Клас" ReadOnly="True" SortExpression="ClassName" />
            <asp:BoundField DataField="StudentInClassId" HeaderText="Номер" SortExpression="StudentInClassId" />
            <asp:BoundField DataField="StudentName" HeaderText="Ученик" ReadOnly="True" SortExpression="StudentName" />
            <asp:BoundField DataField="TimesAbsent" HeaderText="Отсъствал" SortExpression="TimesAbsent" />
            <asp:BoundField DataField="TimesExcused" HeaderText="Извинени отсъствия" SortExpression="TimesExcused" />
            <asp:BoundField DataField="TimesLate" HeaderText="Закъснения" SortExpression="TimesLate" />
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
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="SELECT * FROM [vwStudentInfoWithClassId_tblStudentInfoInClass]"></asp:SqlDataSource>
    <asp:ObjectDataSource ID="getClassStudent" runat="server" SelectMethod="ReadFullByClass" TypeName="BusinessLayer.Class.CRUDClassStudent">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    </asp:Content>
