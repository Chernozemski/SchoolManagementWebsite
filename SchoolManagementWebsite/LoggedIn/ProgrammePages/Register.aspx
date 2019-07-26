<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Programme.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на програма</h2>
    <table class="BigText">
        <tr>
            <td>Клас :
            </td>
            <td>
                <asp:DropDownList ID="ddlClass" AppendDataBoundItems="True" runat="server" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id">
                    <asp:ListItem Text="Изберете клас" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlClass"
                    ErrorMessage="Трябва да изберете клас." InitialValue="0" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Ден :
            </td>
            <td>
                <asp:DropDownList ID="ddlDay" AppendDataBoundItems="True" runat="server" DataSourceID="getDay" DataTextField="NameDay" DataValueField="Id">
                    <asp:ListItem Text="Изберете ден" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getDay" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.TimeTable.CRUDDay"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlDay"
                    ErrorMessage="Трябва да изберете ден." InitialValue="0" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Час :
            </td>
            <td>
                <asp:DropDownList ID="ddlHour" AppendDataBoundItems="True" runat="server" DataSourceID="getHour" DataTextField="LessonHour" DataValueField="Id">
                    <asp:ListItem Text="Изберете час" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getHour" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.TimeTable.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlHour"
                    ErrorMessage="Трябва да изберете час." InitialValue="0" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>По предмет :
            </td>
            <td>
                <asp:DropDownList ID="ddlSubject" AppendDataBoundItems="True" runat="server" DataSourceID="getSubject" DataTextField="SubjectName" DataValueField="Id" AutoPostBack="True">
                    <asp:ListItem Text="Изберете предмет" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getSubject" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Subject.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlSubject"
                    ErrorMessage="Трябва да изберете предмет." InitialValue="0" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td>В стая :
            </td>
            <td>
                <asp:DropDownList ID="ddlRoom" AppendDataBoundItems="True" runat="server" OnLoad="ddlRoom_Load">
                    <asp:ListItem Text="Изберете стая" Value="0" />
                </asp:DropDownList>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlRoom"
                    ErrorMessage="Трябва да изберете стая." InitialValue="0" Display="Dynamic" runat="server" />
            </td>
        </tr>
                <tr>
            <td>С учител :
            </td>
            <td>
                <asp:DropDownList ID="ddlTeacher" AppendDataBoundItems="True" runat="server" DataSourceID="getTeacher" DataTextField="FullName" DataValueField="EGN">
                    <asp:ListItem Text="Изберете учител" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getTeacher" runat="server" SelectMethod="ReadWithSelectSubjectId" TypeName="BusinessLayer.Teacher.CRUDInfo">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlSubject" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error" ControlToValidate="ddlTeacher"
                    ErrorMessage="Трябва да изберете учител." InitialValue="0" Display="Dynamic" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnRegister" Text="Записване" CssClass="bigButton" OnClick="btnRegister_Click" ValidationGroup="Register" CausesValidation="true" runat="server" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
