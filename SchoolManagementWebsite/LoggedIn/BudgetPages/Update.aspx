<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetPages.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <h2>Промяна на приход/разход</h2>
    <asp:GridView ID="gridViewBudget" runat="server" AllowPaging="True" DataKeyNames="Id" AllowSorting="True"
         AutoGenerateColumns="False" CellPadding="4" DataSourceID="getAndUpdateBudget" ForeColor="#333333" GridLines="None" OnRowDataBound="gridViewBudget_RowDataBound" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) операци(и/я).
        </EmptyDataTemplate>
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
            <asp:TemplateField HeaderText="Операция" SortExpression="Item">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="getBudgetType" DataTextField="Item" DataValueField="Id" OnSelectedIndexChanged="ddlItem_SelectedIndexChanged" />
                   <asp:Label ID="lblItemId" runat="server" Text='<%# Bind("ItemId") %>' Visible="false" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Item") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Описание" SortExpression="DescriptionForItem">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DescriptionForItem") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DescriptionForItem") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Operation" HeaderText="Тип операция" SortExpression="Operation" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Payment" HeaderText="Тип плащане" SortExpression="Payment" InsertVisible="False" ReadOnly="True" />
            <asp:TemplateField HeaderText="Стойност" SortExpression="Amount">
                <EditItemTemplate>
                    <asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator Text="*" ValidationGroup="Register" ControlToValidate="txtAmount"
                    Display="Dynamic" CssClass="error" ErrorMessage="Трябва да въведете заплата само с числа и точка (1000 или 1000.00)."
                    ValidationExpression="(^[0-9]{1,9}$|^[1-9]{1,7}[.]{1}[0-9]{2}$)" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Amount","{0} лв.") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="На дата" SortExpression="OnDate">
                <EditItemTemplate>
                    <asp:Calendar ID="calendarOnDate" runat="server" BackColor="White" BorderColor="White"
                         BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="calendarOnDate_SelectionChanged" >
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />
                    </asp:Calendar>
                    <asp:Label ID="lblOnDate" runat="server" Text='<%# Bind("OnDate") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("OnDate") %>'></asp:Label>
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
   <table>
        <tr>
            <td>
                Операция :
            </td>
            <td>
                <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="getItemId" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="Item" DataValueField="Id">
               <asp:ListItem Text="Изберете операция" Value="0" />
                     </asp:DropDownList>
                <asp:ObjectDataSource ID="getItemId" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDBudgetType"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>Година :</td>
            <td>
                <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="true" AppendDataBoundItems="True" DataSourceID="getYear">
                    <asp:ListItem Text="Изберете година" Value ="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getYear" runat="server" SelectMethod="ReadYears" TypeName="BusinessLayer.Budget.CRUDBudget"></asp:ObjectDataSource>
            </td>
        </tr>
    </table>
        <asp:ObjectDataSource ID="getAndUpdateBudget" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Budget.CRUDBudget" OnUpdating="getAndUpdateBudget_Updating" UpdateMethod="Update" OnUpdated="getAndUpdateBudget_Updated" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlItem" DefaultValue="0" Name="ItemId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlYear" DefaultValue="0" Name="Year" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="ItemId" Type="Int32" />
            <asp:Parameter Name="DescriptionForItem" Type="String" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="onDate" Type="DateTime" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="getBudgetType" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDBudgetType"></asp:ObjectDataSource>
        
     <asp:ValidationSummary ID="ErrorSummary" runat="server" CssClass="error" DisplayMode="List" HeaderText="Проблеми при Обноняването" 
        ShowSummary="true" ShowValidationErrors="true" ValidationGroup="Update" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
