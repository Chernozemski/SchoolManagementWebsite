<%@ Page Title="" Language="C#" MasterPageFile="~/AuthorizedPages.Master" AutoEventWireup="true" CodeBehind="Absence.aspx.cs" Inherits="SchoolManagementWebsite.LoggedIn.TeacherPages.Absence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Учителски отсъствия
   </h2>
     <asp:GridView ID="GridView2" runat="server" DataKeyNames="Id" CellPadding="4"  ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ShowFooter="True" PageIndex="1" ShowHeaderWhenEmpty="True" OnDataBound="GridView2_DataBound" OnRowDataBound="GridView2_RowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField ShowHeader="False" HeaderText="Команда">
                <FooterTemplate>
                    <asp:Button ID="btnInsert" runat="server" OnClick="btnInsert_Click" Text="Вписване" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Изтриване" OnClientClick="return confirm('Сигурни ли сте че искате да изтриете този запис ?')"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Id" HeaderText="Id" Visible="false"/>
            <asp:TemplateField HeaderText="FullName" SortExpression="FullName">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    Отсъстващ
                    <asp:TextBox ID="txtAbsentTeacherName"  placeholder="име,презиме,фамилия"  runat="server"></asp:TextBox>
                </FooterTemplate>
                <HeaderTemplate>
                    Отсъстващ учител<br />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="OnDate" HeaderText="Дата" SortExpression="OnDate" />
            <asp:TemplateField HeaderText="LessonsAbsent" SortExpression="LessonsAbsent">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LessonsAbsent") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:CheckBoxList ID="checkboxListLessonsAbsent" CssClass="resizeImageVerySmall" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                    </asp:CheckBoxList>
                </FooterTemplate>
                <HeaderTemplate>
                    Отсъствал на часове
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LessonsAbsent") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SubstituteTeacherFullName" SortExpression="SubstituteTeacherFullName">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("SubstituteTeacherFullName") %>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    Заместник
                    <asp:TextBox ID="txtSubstituteTeacherName"  placeholder="име,презиме,фамилия"  runat="server"></asp:TextBox>
                </FooterTemplate>
                <HeaderTemplate>
                    Заместник учител<br />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubstituteTeacherFullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             </Columns>
        <EditRowStyle BackColor="#999999" />
         <EmptyDataTemplate>
             Няма записи
         </EmptyDataTemplate>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
         <PagerSettings Mode="NumericFirstLast" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolManagementDBConnectionString %>"
        SelectCommand="SELECT * FROM [vwAbsentTeacherInfo_tblTeacherAbsence]" DeleteCommand="Delete From tblTeacherAbsence Where Id = @Id" InsertCommand="spAddAbsentTeacher_tblTeacherAbsence" InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SenderEGN" Type="String" />
            <asp:Parameter Name="SenderRank" Type="Int32" />
            <asp:Parameter Name="AbsentTeacherEGN" Type="String" />
            <asp:Parameter Name="LessonsAbsent" Type="String" />
            <asp:Parameter DbType="Date" Name="OnDate" />
            <asp:Parameter Name="SubstituteTeacherEGN" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:Label CssClass="BigText" ID="lblMessage" runat="server" />
</asp:Content>
