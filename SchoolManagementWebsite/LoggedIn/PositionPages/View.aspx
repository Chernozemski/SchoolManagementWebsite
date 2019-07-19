<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.PositionPages.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на длъжностите</h2>
    <table>
        <tr>
            <td class="hideBorder">
    <asp:GridView ID="gridViewPosition" runat="server" AllowSorting="True" DataKeyNames="Id" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getPosition" ForeColor="#333333" GridLines="None" PageSize="5" OnSelectedIndexChanged="gridViewPosition_SelectedIndexChanged" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) длъжност(и).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="Команда">
                <ItemTemplate>
                    <asp:Button ID="btnViewStaff" Text="Преглед на персонала" runat="server" CommandName="Select"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Position" HeaderText="Длъжност" SortExpression="Position" />
            <asp:TemplateField HeaderText="Заплата" SortExpression="Salary">
                <ItemTemplate>
                    <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("Salary","{0} лв.") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="StaffCount" HeaderText="Брой персонал" SortExpression="StaffCount" />
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
                <asp:GridView ID="gridViewTeacher" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="200px" CellPadding="4" DataSourceID="getTeacher" ForeColor="#333333" GridLines="None" OnDataBound="gridViewTeacher_DataBound" Visible="False" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EmptyDataTemplate>
                        Няма записан(и) служител(и).
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField DataField="Fullname" HeaderText="Пълно име" SortExpression="Fullname" />
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
            </tr>
        </table>
    <asp:ObjectDataSource ID="getPosition" runat="server" SelectMethod="ReadWithStaffCount" TypeName="BusinessLayer.Position.CRUD" />
    <asp:ObjectDataSource ID="getTeacher" runat="server" SelectMethod="ReadWithSelectedPositionId" TypeName="BusinessLayer.Teacher.CRUDInfo">
        <SelectParameters>
            <asp:ControlParameter ControlID="gridViewPosition" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
