<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.LessonPages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Записване на урок</h2>
    <table class="BigText">
        <tr>
            <td>Клас : </td>
            <td>
                <asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" AutoPostBack="True">
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
            <td>Час : </td>
            <td>
                <asp:DropDownList ID="ddlHour" runat="server" DataSourceID="getHour" DataTextField="LessonHour" DataValueField="Id"/>
                <asp:ObjectDataSource ID="getHour" runat="server" SelectMethod="ReadWithIdByClass" TypeName="BusinessLayer.TimeTable.CRUD">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlHour" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да изберете клас." InitialValue="0" Text="*" ValidationGroup="Register" />
            </td>
        </tr>
        <tr>
            <td>Име на урок : </td>
            <td>
                <asp:TextBox ID="txtLesson" Width="90%" placeholder="Името на урока" runat="server" />
            </td>
            <td class="hideBorder">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtLesson" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да напишете урока." Text="*" ValidationGroup="Register" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtLesson" CssClass="error" Display="Dynamic"
                    ErrorMessage="Трябва да напишете урока." Text="*" ValidationExpression="^[а-яА-Я0-9 -\.]+$" ValidationGroup="Register" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gridViewStudentInClass" DataKeyNames="StudentInClassId" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getStudentInClass" ForeColor="#333333" GridLines="None" AllowSorting="True" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="FullName" HeaderText="Име" ReadOnly="True" SortExpression="FullName" />
                        <asp:TemplateField HeaderText="Присъствие">
                            <ItemTemplate>
                                <asp:RadioButtonList ID="studentPresence" runat="server" RepeatDirection="Horizontal" CellSpacing="20">
                                    <asp:ListItem Selected="True" Text="Присъства" Value="present" />
                                    <asp:ListItem Text="Отсъства" Value="absent" />
                                    <asp:ListItem Text="Закъснял" Value="late" />
                                </asp:RadioButtonList>
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
                <asp:ObjectDataSource ID="getStudentInClass" runat="server" SelectMethod="ReadStudentWithIdByClass" TypeName="BusinessLayer.Class.CRUDClassStudent" >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
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
