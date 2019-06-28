<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="RemoveClass.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassPages.RemoveClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Премахване на клас</h2>
    <asp:GridView ID="gridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getClasses" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете този клас ?');"  Text="Премахване"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Grade" HeaderText="Клас" SortExpression="Grade" />
            <asp:BoundField DataField="Letter" HeaderText="Група" SortExpression="Letter" />
            <asp:BoundField DataField="FullName" HeaderText="Класен ръководител" SortExpression="FullName" />
            <asp:BoundField DataField="SpecializationName" HeaderText="Паралелка" SortExpression="SpecializationName" />
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
    <asp:SqlDataSource ID="getClasses" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>" DeleteCommand="DELETE FROM [tblClass] WHERE [Id] = @Id"
         SelectCommand="SELECT [tblClass].[Id], [Grade], [Letter], [tblTeacherInfo].[FirstName] + ' ' + [tblTeacherInfo].[FamilyName] As [FullName], [tblSpecialization].[Specialization] As [SpecializationName] FROM [tblClass]
        Inner Join [tblTeacherInfo] On [tblTeacherInfo].[Id] = [tblClass].[Id]
        Inner Join [tblSpecialization] On [tblSpecialization].[Id] = [tblClass].[SpecializationId]">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
