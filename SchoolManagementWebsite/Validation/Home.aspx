﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FreePages.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolManagementWebsite.Pages.Home" %>
<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
   <h2>
       Начална примерна страница :
   </h2>
    <p>
        Това е уебсайт, създаден за работа с бази данни без нуждата за сваляне на програми.
    </p>
    <p>
        Тези сайтове имат предимство над настолните програми, поради причината, че те (сайтовете) не трябва да се свалят/инсталират на машината за работа.
    </p>
    <br />
    <p>
        За да може учителят да си направи профил първо трябва да е въведен в базата данни, което става от страна на директора.
        Директор се създава като ръчно се въведат неговите данни в базата данни.
        Само 1 директор може да бъде регистриран и той може да управлява и да вижда всичко (без пароли).
        Профила на учителя е базиран на ЕГН то му и това не позволява създаването на профил със същото ЕГН и/или потребителско име.
    </p>
    <p>
        За сега всеки регистриран профил може да добавя учители.
    </p>
    <p>
        1234567890 Примерно ЕГН на директор.
    </p>
</asp:Content>
