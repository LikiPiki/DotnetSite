<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .auto-style13 {
            width: 614px;
        }
        .auto-style14 {
            margin-top: 0;
        }
        .auto-style15 {
            width: 155px;
        }
        .auto-style16 {
            width: 176px;
        }
        .auto-style17 {
            width: 176px;
            height: 25px;
        }
        .auto-style18 {
            width: 155px;
            height: 25px;
        }
        .auto-style19 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="container">
        <h2>Регистрация</h2>
        <table class="auto-style13">
            <tr>
                <td colspan="2">
                    <asp:Label ID="RegInfo" runat="server" CssClass="warning" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">E-mail</td>
                <td class="auto-style15">
                    <asp:TextBox ID="RegEmailBox" runat="server" CssClass="auto-style14" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Заполните поле E-mail" ControlToValidate="RegEmailBox" CssClass="validate-error" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="RegEmailBox" EnableClientScript="False" ErrorMessage="RegularExpressionValidator" ForeColor="#FF0066" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Логин</td>
                <td class="auto-style15">
                    <asp:TextBox ID="RegLoginBox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Заполните поле Логин" ControlToValidate="RegLoginBox" CssClass="validate-error" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="RegLoginBox" EnableClientScript="False" ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" ValidationExpression="[A-Za-z0-9]{4,20}">Логин должен состоять из цифр или букв, длина больше 3 символов</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">Пароль</td>
                <td class="auto-style15">
                    <asp:TextBox ID="RegPassBox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Заполните поле Пароль" ControlToValidate="RegPassBox" CssClass="validate-error" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="RegPassBox" EnableClientScript="False" ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" ValidationExpression="[A-Za-z0-9]{6,20}">Пароль должен состоять из цифр и букв, длина больше 5 символов</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">Потвердите пароль</td>
                <td class="auto-style18">
                    <asp:TextBox ID="RegRepeatPassBox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Заполните поле повтор пароля" ControlToValidate="RegRepeatPassBox" CssClass="validate-error" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="RegRepeatPassBox" EnableClientScript="False" ErrorMessage="RegularExpressionValidator" ForeColor="#FF3300" ValidationExpression="[A-Za-z0-9]{6,20}">Пароль должен состоять из цифр и букв, длина больше 5 символов</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="registerFormBtn" runat="server" Text="Зарегистрироваться" OnClick="register_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
