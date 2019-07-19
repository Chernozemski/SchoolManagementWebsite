<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.PositionPages.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на длъжност</h2>
    <asp:GridView ID="gridViewPosition" runat="server" DataKeyNames="Id" AllowPaging="True" DataSourceID="getAndUpdatePosition" AutoGenerateColumns="False"
         CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
             <asp:TemplateField HeaderText="Команда">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidationGroup="Update" CommandName="Update" OnClientClick="return confirm('Сигурни ли сте че искате да промените този запис ?')" Text="Обновяване" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмяна" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Промяна" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Длъжност" SortExpression="Position">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtPosition" runat="server" Text='<%# Bind("Position") %>' />
                      <asp:RegularExpressionValidator ValidationGroup="Update" Text="*" CssClass="error" ControlToValidate="txtPosition" Display="Dynamic"
                         Error="Трябва да въведете длъжност на български от А до Я." ValidationExpression="^[А-Яа-я ]+$" runat="server" />
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="lblPosition" runat="server" Text='<%# Bind("Position") %>' />
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:TemplateField HeaderText="Заплащане" SortExpression="Salary">
                 <EditItemTemplate>
                     <asp:TextBox ID="txtSalary" placeholder="Сумата на заплащането" runat="server" Text='<%# Bind("Salary") %>' />
                     <asp:RegularExpressionValidator ValidationGroup="Update" Text="*" CssClass="error" ControlToValidate="txtSalary" Display="Dynamic"
                         Error="Трябва да въведете заплата само с числа и точка (1000 или 1000.00)." ValidationExpression="(^[0-9]{1,9}$|^[0-9]{1,7}[.]{1}[0-9]{2}$)" runat="server" />
                 </EditItemTemplate>
                 <ItemTemplate>
                     <asp:Label ID="lblSalary" runat="server" Text='<%# Eval("Salary", "{0} лв.")%>'/>
                 </ItemTemplate>
             </asp:TemplateField>
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
    <asp:ObjectDataSource ID="getAndUpdatePosition" runat="server" SelectMethod="Read" TypeName="BusinessLayer.Position.CRUD" UpdateMethod="Update" OnUpdated="getAndUpdatePosition_Updated" >
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Position" Type="String" />
            <asp:Parameter Name="Salary" Type="Decimal" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ValidationSummary ID="ErrorSummary" runat="server" CssClass="error" DisplayMode="List" HeaderText="Проблеми при Обноняването" 
        ShowSummary="true" ShowValidationErrors="true" ValidationGroup="Update" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
