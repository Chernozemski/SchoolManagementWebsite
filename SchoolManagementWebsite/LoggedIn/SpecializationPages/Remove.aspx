<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Remove.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Specialization.Remove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Отписване на специалност</h2>
    <asp:GridView ID="specialization" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" DataKeyNames="Id" DataSourceID="getAndDeleteSpecialization" PageSize="5">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Команда">
                <ItemTemplate>
                    <asp:Button ID="deleteSpecialization" CommandName="Delete" Text="Изтриване" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете тази специалност ?')" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Specialization" HeaderText="Специалност" ReadOnly="True" SortExpression="Specialization" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <EmptyDataTemplate>
            Няма записан(а/и) специалност(и).
        </EmptyDataTemplate>
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
     <asp:ObjectDataSource ID="getAndDeleteSpecialization" runat="server" DeleteMethod="Delete" OnDeleted="getAndDeleteSpecialization_Deleted" SelectMethod="ReadWithId" TypeName="BusinessLayer.Specialization.CRUD">
         <DeleteParameters>
             <asp:Parameter Name="Id" Type="Int32" />
             <asp:Parameter Direction="Output" Name="Message" Type="String" />
             <asp:Parameter Direction="Output" Name="Color" Type="Object" />
         </DeleteParameters>
     </asp:ObjectDataSource>
     <asp:Label ID="lblMessage" runat="server" CssClass="BigText"></asp:Label>
</asp:Content>
