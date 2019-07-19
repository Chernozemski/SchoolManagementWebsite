<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Remove.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TeacherPages.Remove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Отписване на учител</h2>
    <asp:GridView ID="gridViewTeacher" runat="server" CellPadding="4" ForeColor="#333333" DataKeyNames="Id" GridLines="None" AllowPaging="True" AllowSorting="True" DataSourceID="deleteTeacher" AutoGenerateColumns="False" OnRowDataBound="gridViewTeacher_RowDataBound" PageSize="5">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете този запис?')" Text="Премахване" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Снимка">
                <ItemTemplate>
                    <asp:Image ID="Photo" runat="server" CssClass="resizeImageSmall" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FullName" HeaderText="Пълно име" SortExpression="FullName" />
            <asp:BoundField DataField="SubjectName" HeaderText="Предмет" SortExpression="SubjectName" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Телефонен номер" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Adress" HeaderText="Местоживеене" SortExpression="Adress" />
            <asp:BoundField DataField="Position" HeaderText="Длъжност" SortExpression="Position" />
            <asp:BoundField DataField="Class" HeaderText="Клас" SortExpression="Class" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
            Няма записан(и) учител(и).
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
    <asp:ObjectDataSource ID="deleteTeacher" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Teacher.CRUDInfo" OnDeleted="deleteTeacher_Deleted" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText"></asp:Label>
</asp:Content>
