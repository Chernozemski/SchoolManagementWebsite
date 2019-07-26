<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TimeTablePages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на часовете</h2>
    <asp:GridView ID="gridViewTimeTable" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id"
        DataSourceID="getAndDeleteTimeTable" AllowSorting="True" ForeColor="#333333" GridLines="None" OnRowDataBound="gridViewTimeTable_RowDataBound" AllowPaging="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) час(ове).
        </EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="True" ValidationGroup="Update" CommandName="Update" OnClientClick="return confirm('Сигурни ли сте че искате да промените този запис ?')" Text="Обновяване" />
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмяна" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Промяна" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Учебен час" SortExpression="LessonHour">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlLessonHour" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlLessonHour_SelectedIndexChanged" e />
                    <asp:Label ID="lblLessonHour" runat="server" Text='<%# Bind("LessonHour") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("LessonHour") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Астрономически час" SortExpression="LessonTime">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlHour" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlHour_SelectedIndexChanged"/>
                    <asp:DropDownList ID="ddlMinutes" AppendDataBoundItems="true" runat="server" OnSelectedIndexChanged="ddlMinutes_SelectedIndexChanged"/>
                    <asp:Label ID="lblLessonTime" runat="server" Text='<%# Bind("LessonTime") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LessonTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Смяна" SortExpression="ShiftName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlShift" runat="server" DataSourceID="getShift" DataTextField="ShiftName" DataValueField="ShiftType" SelectedValue='<%# Bind("ShiftType") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ShiftName") %>'></asp:Label>
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
    <asp:ObjectDataSource ID="getAndDeleteTimeTable" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.TimeTable.CRUD" UpdateMethod="Update" OnUpdated="getAndDeleteTimeTable_Updated" OnUpdating="getAndDeleteTimeTable_Updating">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="LessonHour" Type="Int32" />
            <asp:Parameter Name="LessonTime" Type="DateTime" />
            <asp:Parameter Name="ShiftType" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getShift" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.TimeTable.CRUDShift"></asp:ObjectDataSource>
    <asp:ValidationSummary ID="ErrorSummary" runat="server" CssClass="error" DisplayMode="List" HeaderText="Проблеми при Обноняването" ShowSummary="true" ShowValidationErrors="true" ValidationGroup="Update" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
