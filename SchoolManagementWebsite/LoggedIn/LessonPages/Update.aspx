<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.LessonPages.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на урок</h2>
    <asp:Label ID="lblWarning" runat="server" CssClass="error" Text="ВНИМАНИЕ ! Не е препоръчително да променяте информацията, поради причината, че базата данни използва тази информация за да прецени дали да позволи добавянето на уроци към базата данни. Напълно безопасно е обаче: да се променя името на урока и учителя който е водил този урок."/>
    <br />
    <asp:Label ID="lblClassId" runat="server" Text="За клас :"></asp:Label>
    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="True"
         AppendDataBoundItems="true" DataSourceID="getClass" DataTextField="FullClassName" DataValueField="Id">
        <asp:ListItem Text="Всеки клас" Value="0" />
    </asp:DropDownList>
    <asp:GridView ID="gridViewLesson" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
         DataSourceID="getAndUpdateLesson" AllowSorting="True" AllowPaging="True" OnRowDataBound="gridViewLesson_RowDataBound" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
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
            <asp:TemplateField HeaderText="Урок" SortExpression="LessonName">
                <EditItemTemplate>
                    <asp:TextBox ID="txtLesson" runat="server" Text='<%# Bind("LessonName") %>' TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Update" Text="*" ControlToValidate="txtLesson" ErrorMessage="Трябва да въведете името на урока."
                        CssClass="error" Display="Dynamic" runat="server"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("LessonName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Дата" SortExpression="OnDate">
                <EditItemTemplate>
                    <asp:Calendar ID="calendarOnDate" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px" OnSelectionChanged="calendarOnDate_SelectionChanged">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                    <asp:Label ID="lblOnDate" runat="server" Text='<%# Bind("OnDate") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("OnDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Отсъстващи" SortExpression="MissingStudentId">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMissingStudentId" runat="server" Text='<%# Bind("MissingStudentId") %>'></asp:TextBox>
                    <asp:Label ID="warning1" CssClass="error" Text="ВНИМАНИЕ ! Промяната на това поле НЕ гарантира автоматичното пресмятане на отсъствията,тоест те трябва да се коригират ръчно след настройка." runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MissingStudentId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Закъснели" SortExpression="LateStudentId">
                <EditItemTemplate>
                    <asp:TextBox ID="txtLateStudentId" runat="server" Text='<%# Bind("LateStudentId") %>'></asp:TextBox>
                    <asp:Label ID="warning2" CssClass="error" Text="ВНИМАНИЕ ! Промяната на това поле НЕ гарантира автоматичното пресмятане на закъсненията,тоест те трябва да се коригират ръчно след настройка." runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("LateStudentId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Програма" SortExpression="ProgrammeId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlProgrammeId" runat="server" DataSourceID="getProgramme" DataTextField="Programme" DataValueField="Id" SelectedValue='<%# Bind("ProgrammeId") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ProgrammeId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ClassName" HeaderText="Клас" SortExpression="ClassName" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NameDay" HeaderText="Ден" SortExpression="NameDay" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="LessonHour" HeaderText="Час" SortExpression="LessonHour" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="SubjectName" HeaderText="Предмет" SortExpression="SubjectName" InsertVisible="False" ReadOnly="True" />
            <asp:TemplateField HeaderText="Учител" SortExpression="TeacherFullName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTeacher" runat="server" DataSourceID="getTeacher" DataTextField="FullTeacherName" DataValueField="EGN" SelectedValue='<%# Bind("TeacherEGN") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("TeacherFullName") %>'></asp:Label>
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
    <asp:ObjectDataSource ID="getAndUpdateLesson" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Lesson.CRUD" UpdateMethod="Update" OnUpdated="getAndUpdateLesson_Updated" OnUpdating="getAndUpdateLesson_Updating">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlClass" Name="ClassId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="ProgrammeId" Type="Int32" />
            <asp:Parameter Name="LessonName" Type="String" />
            <asp:Parameter Name="OnDate" Type="DateTime" />
            <asp:Parameter Name="TeacherEGN" Type="String" />
            <asp:Parameter Name="MissingStudentId" Type="String" />
            <asp:Parameter Name="LateStudentId" Type="String" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getProgramme" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Programme.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getTeacher" runat="server" SelectMethod="ReadWithFullNameAndEGN" TypeName="BusinessLayer.Teacher.CRUDInfo"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getClass" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Class.CRUD"></asp:ObjectDataSource>
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />

</asp:Content>
