<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.GradePages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на оценка</h2>
    <asp:Label ID="lblClassId" runat="server" Text="За клас :"></asp:Label>
    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True"
        AppendDataBoundItems="true" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
        <asp:ListItem Text="Изберете клас" Value="0" />
    </asp:DropDownList>
    <asp:GridView ID="gridViewGrade" runat="server"
        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4"
        DataSourceID="getAndUpdateGrade" ForeColor="#333333" GridLines="None" DataKeyNames="Id" OnRowDataBound="gridViewGrade_RowDataBound" Visible="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) оценк(а/и).
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
            <asp:TemplateField HeaderText="Клас" SortExpression="ClassName">
                <EditItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Оценка" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGrade" runat="server" SelectedValue='<%# Bind("Grade") %>'>
                        <asp:ListItem Text="Слаб 2" Value="2" />
                        <asp:ListItem Text="Среден 3" Value="3" />
                        <asp:ListItem Text="Добър 4" Value="4" />
                        <asp:ListItem Text="Мн. добър 5" Value="5" />
                        <asp:ListItem Text="Отличен 6" Value="6" />
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Урок" SortExpression="LessonName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlLesson" runat="server" DataSourceID="getLesson" DataTextField="LessonName" DataValueField="Id" SelectedValue='<%# Bind("LessonId") %>' OnSelectedIndexChanged="ddlLesson_SelectedIndexChanged" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LessonName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OnDate" HeaderText="Дата" InsertVisible="False" ReadOnly="True" SortExpression="OnDate" />
            <asp:TemplateField HeaderText="Номер на ученик" SortExpression="StudentInClassId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlStudentInClass" runat="server" DataTextField="FullName"
                         DataValueField="StudentInClassId" DataSourceID="getStudent" OnSelectedIndexChanged="ddlStudentInClass_SelectedIndexChanged"  />
                    <asp:Label ID="lblStudentInClassId" runat="server" Text='<%# Bind("StudentInClassId") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("StudentInClassId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="StudentName" HeaderText="Име на ученик" SortExpression="StudentName" InsertVisible="False" ReadOnly="True" />
            <asp:TemplateField HeaderText="Оценен от" SortExpression="FullTeacherName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTeacher" runat="server" DataSourceID="getTeacher" DataTextField="FullTeacherName" DataValueField="EGN" SelectedValue='<%# Bind("TeacherEGN") %>'  Enabled="false"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("FullTeacherName") %>'></asp:Label>
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
    <asp:ObjectDataSource ID="getAndUpdateGrade" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Grade.CRUD" OnUpdated="getAndUpdateGrade_Updated" OnUpdating="getAndUpdateGrade_Updating" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Grade" Type="Int32" />
            <asp:Parameter Name="ClassId" Type="Int32" />
            <asp:Parameter Name="LessonId" Type="Int32" />
            <asp:Parameter Name="StudentInClassId" Type="Int32" />
            <asp:Parameter Name="TeacherEGN" Type="String" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getLesson" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Lesson.CRUD">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getStudent" runat="server" SelectMethod="ReadStudentWithClassId" TypeName="BusinessLayer.Class.CRUDClassStudent">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getTeacher" runat="server" SelectMethod="ReadWithFullNameAndEGN" TypeName="BusinessLayer.Teacher.CRUDInfo"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
