<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.ClassPages.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Промяна на клас</h2>
    <asp:GridView ID="gridViewClass" runat="server" AllowPaging="True" DataKeyNames="Id" AllowSorting="True" DataSourceID="getAndUpdateClass" AutoGenerateColumns="False" OnRowDataBound="gridViewClass_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <EmptyDataTemplate>
            Няма записан(и) клас(ове).
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
            <asp:TemplateField HeaderText="Клас" SortExpression="Grade">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGrade" runat="server" OnSelectedIndexChanged="ddlGrade_SelectedIndexChanged" />
                    <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>' Visible="false" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Буква" SortExpression="Letter">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlLetter" runat="server" OnSelectedIndexChanged="ddlLetter_SelectedIndexChanged" />
                    <asp:Label ID="lblLetter" runat="server" Text='<%# Bind("Letter") %>' Visible="false" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblLetter" runat="server" Text='<%# Bind("Letter") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Специалност" SortExpression="Specialization">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlSpecialization" runat="server" DataSourceID="getSpecialization"
                        DataTextField="Specialization" DataValueField="Id" SelectedValue='<%# Bind("SpecializationId") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSpecialization" runat="server" Text='<%# Bind("Specialization") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Учител" SortExpression="FullTeacherName">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTeacher" runat="server" DataSourceID="getTeacher" DataTextField="FullTeacherName"
                        DataValueField="EGN" SelectedValue='<%# Bind("ClassTeacherEGN") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblFullTeacherName" runat="server" Text='<%# Bind("FullTeacherName") %>' />
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
    <asp:ObjectDataSource ID="getAndUpdateClass" runat="server" OnUpdated="getAndUpdateClass_Updated" SelectMethod="ReadFull" TypeName="BusinessLayer.Class.CRUD" UpdateMethod="Update" OnUpdating="getAndUpdateClass_Updating">
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Grade" Type="Int32" />
            <asp:Parameter Name="Letter" Type="Char" />
            <asp:Parameter Name="SpecializationId" Type="Int32" />
            <asp:Parameter Name="ClassTeacherEGN" Type="String" />
            <asp:Parameter Direction="Output" Name="Message" Type="String" />
            <asp:Parameter Direction="Output" Name="Color" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="getTeacher" runat="server" SelectMethod="ReadWithFullNameAndEGN" TypeName="BusinessLayer.Teacher.CRUDInfo" />
    <asp:ObjectDataSource ID="getSpecialization" runat="server" SelectMethod="ReadWithId" TypeName="BusinessLayer.Specialization.CRUD" />
    <asp:Label ID="lblMessage" runat="server" CssClass="BigText"></asp:Label>
</asp:Content>
