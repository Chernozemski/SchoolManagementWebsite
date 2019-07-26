<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassStudentPages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на ученик в клас</h2>
    <asp:Label ID="lblClassId" runat="server" Text="За клас :"></asp:Label>
    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True" AppendDataBoundItems="true" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" OnDataBinding="ddlClass_DataBinding">
        <asp:ListItem Text="Всеки клас" Value="0" />
    </asp:DropDownList>
    <asp:GridView ID="gridViewClassStudent" AllowSorting="True" DataKeyNames="Id" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CellPadding="4" DataSourceID="getAndUpdateStudent" ForeColor="#333333" GridLines="None" OnRowDataBound="gridViewClassStudent_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) учени(к/ци) в класовете.
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
            <asp:TemplateField HeaderText="Номер" SortExpression="StudentInClassId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlStudentInClassId" runat="server" OnSelectedIndexChanged="ddlStudentInClassId_SelectedIndexChanged" />
                    <asp:Label ID="lblStudentInClassId" runat="server" Text='<%# Bind("StudentInClassId") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("StudentInClassId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Клас" SortExpression="ClassName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlClass" runat="server" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" SelectedValue='<%# Bind("ClassId") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ученик" SortExpression="StudentName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlStudent" runat="server" DataSourceID="getStudent" DataTextField="FullName" DataValueField="Id" SelectedValue='<%# Bind("StudentID") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("StudentName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Отсъствал" SortExpression="TimesAbsent">
                <EditItemTemplate>
                    <asp:TextBox ID="txtTimesAbsent" runat="server" Text='<%# Bind("TimesAbsent") %>' />
                                        <asp:RegularExpressionValidator ValidationGroup="Update" Display="Dynamic" Text="*" ControlToValidate="txtTimesAbsent" ValidationExpression="^(0|[1-9]+)$"
                        ErrorMessage="Трябва отсъствия да са съставени от цифри." runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="Update" Display="Dynamic" Text="*" ControlToValidate="txtTimesAbsent"
                        ErrorMessage="Трябва да въведете брой на отсъствия с цифри." runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TimesAbsent") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Извинени отсъствия" SortExpression="TimesExcused">
                <EditItemTemplate>
                    <asp:TextBox ID="txtTimesExcused" runat="server" Text='<%# Bind("TimesExcused") %>' />
                    <asp:RegularExpressionValidator ValidationGroup="Update" Display="Dynamic" Text="*" ControlToValidate="txtTimesExcused" ValidationExpression="^(0|[1-9]+)$"
                        ErrorMessage="Трябва извинените отсъствия да са съставени от цифри." runat="server" />
                    <asp:RequiredFieldValidator ValidationGroup="Update" Display="Dynamic" Text="*" ControlToValidate="txtTimesExcused"
                        ErrorMessage="Трябва да въведете брой на извинените отсъствия с цифри." runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TimesExcused") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Закъснения" SortExpression="TimesLate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtTimesLate" runat="server" Text='<%# Bind("TimesLate") %>' />
                    <asp:RequiredFieldValidator ValidationGroup="Register" Text="*" CssClass="error"
                        ErrorMessage="Трябва да въведете число за закъснения." ControlToValidate="txtTimesLate" runat="server" Display="Dynamic" />
                    <asp:RegularExpressionValidator ValidationGroup="Register" Text="*" CssClass="error"
                        ErrorMessage="Трябва да въведете число за закъснения в този формат (0.00)." ValidationExpression="^[0-9]{1,2}\.[0-9]{1,2}$" ControlToValidate="txtTimesLate" runat="server" Display="Dynamic" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("TimesLate") %>'></asp:Label>
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
    <asp:ObjectDataSource ID="getAndUpdateStudent" runat="server" SelectMethod="ReadFullByClass" TypeName="BusinessLayer.Class.CRUDClassStudent" OnUpdated="getAndUpdateStudent_Updated" UpdateMethod="Update" OnUpdating="getAndUpdateStudent_Updating">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" DefaultValue="" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="StudentInClassId" Type="Int32" />
            <asp:Parameter Name="ClassId" Type="Int32" />
            <asp:Parameter Name="StudentId" Type="Int32" />
            <asp:Parameter Name="TimesAbsent" Type="Int32" />
            <asp:Parameter Name="TimesExcused" Type="Int32" />
            <asp:Parameter Name="TimesLate" Type="Single" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getStudent" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Student.CRUDInfo"></asp:ObjectDataSource>
    <asp:ValidationSummary ID="ErrorSummary" ValidationGroup="Update" HeaderText="Проблеми при Обноняването" CssClass="error" DisplayMode="List" runat="server" ShowValidationErrors="true" ShowSummary="true" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
