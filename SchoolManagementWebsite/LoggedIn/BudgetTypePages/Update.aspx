<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetTypePages.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на операция</h2>
    <asp:GridView ID="gridViewBudgetType" DataKeyNames="Id" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getAndRemoveBudgetType" ForeColor="#333333" GridLines="None" OnRowDataBound="gridViewBudgetType_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и/а) операци(и/я).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField HeaderText="Команда">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidationGroup="Update" CommandName="Update" OnClientClick="return confirm('Сигурни ли сте че искате да промените този запис ?')" Text="Обновяване" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмяна" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Edit" Text="Промяна" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Операция" SortExpression="Item">
                <EditItemTemplate>
                    <asp:TextBox ID="txtItem" runat="server" Text='<%# Bind("Item") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="Update" Text="*" ErrorMessage="Трябва да въведете името на операцията." CssClass="error"
                        ControlToValidate="txtItem"  Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Update" Text="*" ErrorMessage="Трябва операцията да е в рамките на от 1 до 50 знака и да съдържа букви на кирилица,цифри,интервали и тире."
                    CssClass="error" ControlToValidate="txtItem" ValidationExpression="^[а-яА-Я -0,9]{1,50}$" runat="server" Display="Dynamic" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Item") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Тип операция" SortExpression="OperationType">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlOperationType" runat="server" DataSourceID="getOperationType" DataTextField="Operation" DataValueField="Id" OnSelectedIndexChanged="ddlOperationType_SelectedIndexChanged" />
                    <asp:Label ID="lblOperationTypeId" runat="server" Text='<%# Bind("OperationTypeId") %>' Visible="false" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("OperationType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Тип плащане" SortExpression="OperationLength">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlOperationLength" runat="server" DataSourceID="getOperationLength" DataTextField="Payment" DataValueField="Id" OnSelectedIndexChanged="ddlOperationLength_SelectedIndexChanged" />
                    <asp:Label ID="lblOperationLengthId" runat="server" Text='<%# Bind("OperationLengthId") %>' Visible="false" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("OperationLength") %>'></asp:Label>
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
    <asp:ObjectDataSource ID="getAndRemoveBudgetType" runat="server" OnUpdated="getAndRemoveBudgetType_Updated" SelectMethod="ReadFull" TypeName="BusinessLayer.Budget.CRUDBudgetType" UpdateMethod="Update" OnUpdating="getAndRemoveBudgetType_Updating" >
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Item" Type="String" />
            <asp:Parameter Name="OperationLengthId" Type="Int32" />
            <asp:Parameter Name="OperationTypeId" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getOperationType" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDOPerationType" />
    <asp:ObjectDataSource ID="getOperationLength" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDOperationLength" />
      <asp:ValidationSummary ID="ErrorSummary" runat="server" CssClass="error" DisplayMode="List" HeaderText="Проблеми при Обноняването" ShowSummary="true" ShowValidationErrors="true" ValidationGroup="Update" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
