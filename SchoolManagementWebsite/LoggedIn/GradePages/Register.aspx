<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.GradePages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на урок</h2>
    <table class="BigText">
        <tr>
            <td>Клас : </td>
            <td>
                <asp:DropDownList ID="ddlClass" runat="server" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" AutoPostBack="True">
                    <asp:ListItem Text="Изберете клас" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlClass" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да изберете клас." InitialValue="0" Text="*" ValidationGroup="Register" />
            </td>
        </tr>
                <tr>
            <td>Урок : </td>
            <td>
                <asp:DropDownList ID="ddlLesson" runat="server" DataSourceID="getLesson" DataTextField="LessonName" DataValueField="Id" AutoPostBack="True">
                    <asp:ListItem Text="Изберете урок" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getLesson" runat="server" SelectMethod="ReadTodayLesson" TypeName="BusinessLayer.Lesson.CRUD">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlLesson" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да изберете урок." InitialValue="0" Text="*" ValidationGroup="Register" />
            </td>
        </tr>
          <tr>
            <td>Ученик : </td>
            <td>
                <asp:DropDownList ID="ddlStudent" runat="server" DataSourceID="getStudent" DataTextField="FullName" DataValueField="StudentInClassId" AutoPostBack="True">
                    <asp:ListItem Text="Изберете ученик" Value="0" />
                </asp:DropDownList>
                <asp:ObjectDataSource ID="getStudent" runat="server" SelectMethod="ReadStudentWithClassId" TypeName="BusinessLayer.Class.CRUDClassStudent">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlStudent" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да изберете ученик." InitialValue="0" Text="*" ValidationGroup="Register" />
            </td>
        </tr>
        <tr>
            <td>Оценка : </td>
            <td>
                <asp:DropDownList ID="ddlGrade" runat="server">
                    <asp:ListItem Text="Моля изберете оценка" Selected="True" Value="0"/>
                    <asp:ListItem Text="Слаб 2" Value="2"/>
                    <asp:ListItem Text="Среден 3" Value="3"/>
                    <asp:ListItem Text="Добър 4" Value="4"/>
                    <asp:ListItem Text="Мн. добър 5" Value="5"/>
                    <asp:ListItem Text="Отличен 6" Value="6"/>
                </asp:DropDownList>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlGrade" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да изберете оценка." InitialValue="0" Text="*" ValidationGroup="Register" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnregister" ValidationGroup="Register" CssClass="bigButton" Text="Записване" OnClick="btnregister_Click" runat="server" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Register" HeaderText="Проблеми при регистрация" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label runat="server" ID="lblMessage" Font-Size="30px" />
</asp:Content>
