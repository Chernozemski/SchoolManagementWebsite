<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.Programme.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на прогрмата</h2>
        <asp:Label ID="lblForClass" runat="server" Text="За клас :" CssClass="bigText" />
    <asp:DropDownList ID="ddlClass" runat="server" DataSourceID="getClass" AppendDataBoundItems="True" DataTextField="FullClassName" DataValueField="Id" AutoPostBack="True">
        <asp:ListItem Text="Всеки клас" Value ="0" />
    </asp:DropDownList>
    <asp:GridView ID="gridViewProgramme" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="getAndUpdateProgramme" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnRowDataBound="gridViewProgramme_RowDataBound" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
            <asp:TemplateField HeaderText="Клас" SortExpression="ClassName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlClass" runat="server" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" SelectedValue='<%# Bind("ClassId") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ден" SortExpression="NameDay">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlDay" runat="server" DataSourceID="getDay" DataTextField="NameDay" DataValueField="Id" SelectedValue='<%# Bind("DayId") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("NameDay") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Час" SortExpression="LessonHour">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlLessonHour" runat="server" DataSourceID="getHour" DataTextField="LessonHour" DataValueField="Id" SelectedValue='<%# Bind("HourId") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("LessonHour") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Предмет" SortExpression="SubjectName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlSubject" runat="server" SelectedValue='<%# Bind("SubjectId") %>' DataSourceID="getSubject" DataTextField="SubjectName" DataValueField="Id" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Стая" SortExpression="RoomId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlRoom" runat="server" OnSelectedIndexChanged="ddlRoom_SelectedIndexChanged"/>
                    <asp:Label ID="lblRoomId" runat="server" Text='<%# Bind("RoomId") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("RoomId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="С учител" SortExpression="TeacherFullName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTeacher" runat="server" DataSourceID="getTeacher" DataTextField="FullTeacherName" DataValueField="EGN" SelectedValue='<%# Bind("TeacherEGN") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("TeacherFullName") %>'></asp:Label>
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
    <asp:ObjectDataSource ID="getAndUpdateProgramme" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Programme.CRUD" UpdateMethod="Update" OnUpdated="getAndUpdateProgramme_Updated" OnUpdating="getAndUpdateProgramme_Updating" >
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="ClassId" Type="Int32" />
            <asp:Parameter Name="DayId" Type="Int32" />
            <asp:Parameter Name="HourId" Type="Int32" />
            <asp:Parameter Name="SubjectId" Type="Int32" />
            <asp:Parameter Name="RoomId" Type="Int32" />
            <asp:Parameter Name="TeacherEGN" Type="String" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getDay" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.TimeTable.CRUDDay"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getHour" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.TimeTable.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getSubject" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Subject.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getTeacher" runat="server" SelectMethod="ReadWithFullNameAndEGN" TypeName="BusinessLayer.Teacher.CRUDInfo"></asp:ObjectDataSource>
       <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
