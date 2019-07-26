<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BudgetTypePages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на операция</h2>
    <table class="BigText">
        <tr>
            <td>Име на операцията :</td>
            <td>
                <asp:TextBox ID="txtOperation" placeholder="Име на операцията" runat="server" />
            </td>
            <td class="hideBorder">
               <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ErrorMessage="Трябва да въведете името на операцията." 
                    CssClass="error" ControlToValidate="txtOperation" Display="Dynamic" runat="server" />
                <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" ErrorMessage="Трябва операцията да е в рамките на от 1 до 50 знака и да съдържа букви на кирилица,цифри,интервали и тире."
                    CssClass="error" ControlToValidate="txtOperation" ValidationExpression="^[а-яА-Я -0,9]{1,50}$" runat="server" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>Тип :
            </td>
            <td>
                <asp:DropDownList ID="ddlOperationType" runat="server" DataSourceID="getOperationType" AppendDataBoundItems="True" DataTextField="Operation" DataValueField="Id">
                    <asp:ListItem Text="Изберете тип на операцията" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getOperationType" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDOPerationType"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ErrorMessage="Трябва да изберете продължителност на операцията." 
                    CssClass="error" ControlToValidate="ddlOperationType" InitialValue="0" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Продължителност :</td>
            <td>
                <asp:DropDownList ID="ddlOperationLength" runat="server" AppendDataBoundItems="true" DataSourceID="getOperationLength" DataTextField="Payment" DataValueField="Id">
               <asp:ListItem Text="Изберете продължителност на операцията" Value="0"/>
                     </asp:DropDownList>
                <asp:ObjectDataSource ID="getOperationLength" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Budget.CRUDOperationLength" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" ErrorMessage="Трябва да изберете продължителност на операцията." 
                    CssClass="error" ControlToValidate="ddlOperationLength" InitialValue="0" Display="Dynamic" runat="server" />
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
