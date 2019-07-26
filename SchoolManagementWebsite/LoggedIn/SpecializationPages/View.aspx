<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Specialization.View" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Преглед на класовете</h2>
    <asp:Label ID="lblSpecializationCount" runat="server" />
    <table>
        <tr>
            <td class="hideBorder">
                <asp:GridView ID="gridViewSpecialization" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getSpecializations" ForeColor="#333333" GridLines="None" PageSize="5" OnSelectedIndexChanged="gridViewSpecialization_SelectedIndexChanged" OnDataBound="gridViewSpecialization_DataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Команда" ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Select" Text="Преглед на специалностите" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Specialization" HeaderText="Специалност" SortExpression="Specialization" />
                        <asp:BoundField DataField="NumberOfClasses" HeaderText="Брой класове" SortExpression="NumberOfClasses" />
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
                <asp:GridView ID="classList" runat="server" AllowSorting="true" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getClassesList" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" Visible="False" Width="200px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Grade" HeaderText="Клас" SortExpression="Grade" />
                        <asp:BoundField DataField="Letter" HeaderText="Паралелка" SortExpression="Letter" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        Няма записан(и) клас(ове) с тази специалност.
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
    <asp:ObjectDataSource ID="getSpecializations" runat="server" SelectMethod="ReadWithNumberOfClasses" TypeName="BusinessLayer.Specialization.CRUD" />
    <asp:ObjectDataSource ID="getClassesList" runat="server" SelectMethod="ReadWithSelectedId" TypeName="BusinessLayer.Class.CRUD">
        <SelectParameters>
            <asp:ControlParameter ControlID="gridViewSpecialization" Name="Id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
