﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FreePages.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolManagementWebsite.Pages.Home" %>

<asp:Content ID="content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Начална примерна страница
    </h2>
    <p>
        Това е уебсайт, създаден за работа с бази данни без нуждата от сваляне на програми.
    </p>
    <p>
        Тези сайтове имат предимство над настолните програми, поради причината, че те не трябва да се свалят или инсталират на машината за работа.
    </p>
    <br />
    <p>
        За да може учителят да си направи профил, първо трябва да е въведен в базата данни, което става от страна на директора.
        Директор се записана ръчно в базата данни.
        Само 1 директор може да бъде регистриран и той може да управлява и да вижда всичко (без пароли).
        Профила на учителя е базиран на ЕГН то му и това не позволява създаването на профил със същото ЕГН и/или потребителско име.
    </p>
    <p>
        Различните потребители имат различни функции, директор не може да пише отценки или отсъствия на ученици, а учител не може да добавя/премахва други учители или ученици.
    </p>
    <p>
        Име и пароли за вход :
    </p>
    <p>
        Име : teacher Парола : 123
    </p>
    <p>
        Име : director Парола : 123
    </p>
    <p>
        ЕГН за регистрация : 

    </p>
    <p>
        2345678901
    </p>
    <p>
        3456789012
    </p>
    <p>
        0046789012
    </p>
    <style>
        p{
            font-size:18px;
        }
    </style>
</asp:Content>
