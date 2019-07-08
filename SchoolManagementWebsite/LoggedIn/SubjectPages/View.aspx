<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.SubjectPages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на предметите</h2>
    <table>
        <tr>
            <td class="hideBorder">
    <asp:GridView ID="viewSubject" runat="server" AllowPaging="True" DataKeyNames="Id" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getSubject" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="viewSubject_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField ShowHeader="False" HeaderText="Команда">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Преглед на учителите" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SubjectName" HeaderText="Предмет" SortExpression="SubjectName" />
            <asp:BoundField DataField="NumberOfTeachers" HeaderText="Брой учители" SortExpression="NumberOfTeachers" />
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
                </td>
            <td class="hideBorder">
                <asp:GridView runat="server" Width="200px" AllowPaging="True" DataSourceID="getTeacherList" AutoGenerateColumns="False" ID="teacherList" CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="teacherList_DataBound" ShowHeaderWhenEmpty="True" Visible="False">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="FullName" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        Няма записан(и) учител(и) по този предмет.
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
            </td>
            </tr>
            </table>
    <asp:ObjectDataSource ID="getSubject" runat="server" SelectMethod="ReadWithTeacherNumber" TypeName="BusinessLayer.Subject.CRUD" />
    <asp:ObjectDataSource ID="getTeacherList" runat="server" SelectMethod="ReadWithSelectedId" TypeName="BusinessLayer.Teacher.CRUDInfo">
        <SelectParameters>
            <asp:ControlParameter ControlID="viewSubject" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
