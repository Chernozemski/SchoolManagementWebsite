<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.BookPages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на клас</h2>
    <asp:GridView ID="gridViewBook" runat="server" DataKeyNames="Id" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="getAndUpdateBook" ForeColor="#333333" GridLines="None" PageSize="5" OnRowDataBound="gridViewBook_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(а/и) книг(а/и).
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
            <asp:TemplateField HeaderText="Заглавие" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Издател" SortExpression="Publisher">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPublisher" runat="server" DataSourceID="getPublisher" DataTextField="Publisher" DataValueField="Id" OnSelectedIndexChanged="ddlPublisher_SelectedIndexChanged" />
                   <asp:RequiredFieldValidator ValidationGroup="Update" ControlToValidate="ddlPublisher" Text="*" CssClass="error"
                    ErrorMessage="Трябва да изберете името на издателя." InitialValue="0" runat="server" Display="Dynamic" />
                     <asp:Label ID="lblPublisherId" runat="server" Text='<%# Bind("PublisherId") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPublisher" runat="server" Text='<%# Bind("Publisher") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="За клас" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGrade" runat="server" OnSelectedIndexChanged="ddlGrade_SelectedIndexChanged" />
                    <asp:RequiredFieldValidator ValidationGroup="Update" ControlToValidate="ddlPublisher" Text="*" CssClass="error"
                        ErrorMessage="Трябва да въведете името на издателя." InitialValue="0" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="По предмет" SortExpression="SubjectName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlSubject" runat="server" DataSourceID="getSubject" DataTextField="SubjectName" DataValueField="Id" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged" />
                    <asp:RequiredFieldValidator ValidationGroup="Update" ControlToValidate="ddlSubject" Text="*" CssClass="error"
                    ErrorMessage="Трябва да изберете предмет." InitialValue="0" runat="server" Display="Dynamic" />
                    <asp:Label ID="lblSubjectId" runat="server" Text='<%# Bind("SubjectId") %>' Visible="false"></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSubjectName" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Година на издаване" SortExpression="PublishedYear">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPublishedYear" runat="server" Text='<%# Bind("PublishedYear") %>' />
                    <asp:RangeValidator ID="publishedYearValidator" ValidationGroup="Update" ControlToValidate="txtPublishedYear" MinimumValue="1949" MaximumValue="" Text="*" CssClass="error"
                    ErrorMessage="Годината се пише с цифри и трябва да е в рамките от 1950 до сега." runat="server" Display="Dynamic" OnLoad="publishedYearValidator_Load"/>           
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPublishedYear" runat="server" Text='<%# Bind("PublishedYear") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="В наличност" SortExpression="Quantity">
                <EditItemTemplate>
                    <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("Quantity") %>' />
                    <asp:RegularExpressionValidator ValidationGroup="Update" ControlToValidate="txtQuantity" ValidationExpression="^([1-9][0-9]+|[0-9]{1})$" Text="*" CssClass="error"
                    ErrorMessage="Количеството трябва да е съставено само от цифри." runat="server" Display="Dynamic" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("Quantity") %>' />
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
    <asp:ObjectDataSource ID="getAndUpdateBook" runat="server" SelectMethod="ReadFull" TypeName="BusinessLayer.Book.CRUD" OnUpdated="getAndUpdateBook_Updated1" UpdateMethod="Update" OnUpdating="getAndUpdateBook_Updating">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="PublisherId" Type="Int32" />
            <asp:Parameter Name="Grade" Type="Int32" />
            <asp:Parameter Name="SubjectId" Type="Int32" />
            <asp:Parameter Name="PublishedYear" Type="Int32" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getPublisher" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Author.CRUD"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getSubject" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Subject.CRUD"></asp:ObjectDataSource>
    <asp:ValidationSummary ID="ErrorSummary" runat="server" CssClass="error" DisplayMode="List" HeaderText="Проблеми при Обноняването"
        ShowSummary="true" ShowValidationErrors="true" ValidationGroup="Update" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText" />
</asp:Content>
