<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TimeTablePages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 310px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на час</h2>
    <table class="BigText">
        <tr>
            <td class="auto-style1">Учебен час :
            </td>
            <td>
                <asp:DropDownList ID="ddlLessonHour" AppendDataBoundItems="true" runat="server" OnLoad="ddlLessonHour_Load" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlLessonHour"
                    InitialValue="0" ErrorMessage="Трябва да изберете час от 1 до 10." Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Астрономически час :</td>
            <td>
                <asp:DropDownList ID="ddlHour" AppendDataBoundItems="true" runat="server" OnLoad="ddlHour_Load" />
                :
                <asp:DropDownList ID="ddlMinutes" AppendDataBoundItems="true" runat="server" OnLoad="ddlMinutes_Load" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlHour"
                    InitialValue="-1" ErrorMessage="Трябва да изберете астрономически час от 0 до 23." Display="Dynamic" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlMinutes"
                    InitialValue="-1" ErrorMessage="Трябва да изберете астрономически час (минути) от 0 до 59." Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Смяна :</td>
            <td>
                <asp:DropDownList ID="ddlShift" runat="server" DataSourceID="getShift" DataTextField="ShiftName" DataValueField="ShiftType" OnLoad="ddlShift_Load" />
                <asp:ObjectDataSource ID="getShift" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.TimeTable.CRUDShift" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlShift"
                    InitialValue="0" ErrorMessage="Трябва да изберете астрономически час от 0 до 23." Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" runat="server" Text="Записване" OnClick="btnRegister_Click" CssClass="bigButton" CausesValidation="true" ValidationGroup="Register" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
