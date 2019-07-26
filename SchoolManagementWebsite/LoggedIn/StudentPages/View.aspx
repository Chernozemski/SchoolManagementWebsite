<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.StudentPages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на ученическият състав
    </h2>
    <asp:Label ID="lblStudentCount" runat="server" />
    <asp:GridView ID="viewStudent" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="getStudent" ForeColor="#333333" GridLines="None" OnRowDataBound="viewStudent_RowDataBound" PageSize="5" OnDataBound="viewStudent_DataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Снимка" SortExpression="Photo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Photo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="img" runat="server" CssClass="resizeImageSmall" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FullName" HeaderText="Ученик" ReadOnly="True" SortExpression="FullName" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="Тел. номер" ReadOnly="True" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Adress" HeaderText="Местоживеене" SortExpression="Adress" />
            <asp:BoundField DataField="Grade" HeaderText="Клас" ReadOnly="True" SortExpression="Grade"  NullDisplayText="Няма клас"/>
            <asp:BoundField DataField="DoctorFullName" HeaderText="Доктор" ReadOnly="True" SortExpression="DoctorFullName" />
            <asp:BoundField DataField="ParentFullName" HeaderText="Родител" SortExpression="ParentFullName" />
            <asp:BoundField DataField="ParentPhoneNumber" HeaderText="Тел. номер на родител" SortExpression="ParentPhoneNumber" />
            <asp:BoundField DataField="ParentAdress" HeaderText="Местоживеене на родител" SortExpression="ParentAdress" />
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
    <asp:ObjectDataSource ID="getStudent" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Student.CRUDInfo"></asp:ObjectDataSource>
</asp:Content>

