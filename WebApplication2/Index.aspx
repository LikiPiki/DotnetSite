<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="container">
        <h2>Главная страница</h2>
        <p>
            <asp:Image ID="Image1" runat="server" ImageUrl="images/Index.jpg" />
            <asp:Image ID="Image2" runat="server" ImageUrl="images/postOffice.jpg" Width="720px" />
        </p>
    </div>
</asp:Content>
