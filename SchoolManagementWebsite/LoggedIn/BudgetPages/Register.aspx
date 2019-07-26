<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на приход/разход</h2>
    <table class="BigText">
        <tr>
            <td>Име на приход/разход:</td>
            <td>
                <asp:DropDownList ID="ddlItem" runat="server" DataSourceID="getBudgetType" AppendDataBoundItems="True" DataTextField="Item" DataValueField="Id">
                    <asp:ListItem Text="Трябва да изберете приход/разход" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getBudgetType" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDBudgetType"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator Text="*" ValidationGroup="Register" ControlToValidate="ddlItem" InitialValue="0" Display="Dynamic" CssClass="error"
                    ErrorMessage="Трябва да изберете приход/разход." runat="server" />
            </td>
        </tr>
        <tr>
            <td>Описание :
            </td>
            <td>
                <asp:TextBox ID="txtDescriptionForItem" placeholder="Описане за добавеният приход/разход" runat="server" Height="125px" TextMode="MultiLine" Width="220px" />
            </td>
        </tr>
        <tr>
            <td>На стойност :</td>
            <td>
                <asp:TextBox ID="txtAmount" placeholder="Стойност" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator Text="*" ValidationGroup="Register" ControlToValidate="txtAmount" Display="Dynamic" CssClass="error"
                    ErrorMessage="Трябва да въведете стойността на тази операция." runat="server" />
                <asp:RegularExpressionValidator Text="*" ValidationGroup="Register" ControlToValidate="txtAmount" InitialValue="0"
                    Display="Dynamic" CssClass="error" ErrorMessage="Трябва да въведете заплата само с числа и точка (1000 или 1000.00)."
                    ValidationExpression="(^[0-9]{1,9}$|^[0-9]{1,7}[.]{1}[0-9]{2}$)" runat="server" />
            </td>
        </tr>
        <tr>
            <td>На дата :</td>
            <td>
                <asp:Calendar ID="calendarOnDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnLoad="calendarOnDate_Load" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" Text="Записване" CssClass="bigButton" OnClick="btnRegister_Click" ValidationGroup="Register" CausesValidation="true" runat="server" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error"
         DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
