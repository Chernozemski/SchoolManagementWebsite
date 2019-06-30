<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="ViewTeacher.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TeacherPages.ViewTeacher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на учителският състав</h2>
        <asp:GridView ID="gridViewTeacherInfo" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="getTeachers" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id" OnRowDataBound="gridViewTeacherInfo_RowDataBound" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Снимка" SortExpression="Photo">
                    <ItemTemplate>
                        <asp:Image CssClass="resizeImageSmall" ID="img" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="FullName" HeaderText="Име" ReadOnly="True" SortExpression="FullName" />
                <asp:BoundField HeaderText="Предмет" DataField="SubjectName" SortExpression="SubjectName"/>
                <asp:BoundField HeaderText="Тел. номер" DataField="PhoneNum" SortExpression="PhoneNum" ReadOnly="True"/>
                <asp:BoundField HeaderText="Местоживеене" DataField="Adress" SortExpression="Adress" />
                <asp:BoundField DataField="Position" HeaderText="Позиция" SortExpression="Position"/>

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
        <asp:SqlDataSource ID="getTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" SelectCommand="SELECT * FROM [vw_tblTeacherInfo]" />
</asp:Content>
