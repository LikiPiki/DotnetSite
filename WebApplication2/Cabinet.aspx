<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cabinet.aspx.cs" Inherits="WebApplication2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .auto-style12.
        .auto-style13,
        .auto-style14 {
            width: 33%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="container">
        <h2>Личный кабинет пользователя</h2>
        <%
            if(Convert.ToInt64(Session["IDP"]) != 0) {
        %>
            <div class="content">
                Привет 
                <asp:Label ID="cabinetUsernameLabel" runat="server" Text="Label"></asp:Label>
                <h2>Ваши отслеживаемые почтовые отправления</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="номер_почтового_отправления" HeaderText="Номер" ReadOnly="True" SortExpression="номер_почтового_отправления" />
                        <asp:BoundField DataField="кому" HeaderText="Кому" ReadOnly="True" SortExpression="кому" />
                        <asp:BoundField DataField="от_кого" HeaderText="От кого" ReadOnly="True" SortExpression="от_кого" />
                        <asp:BoundField DataField="откуда" HeaderText="Откуда" ReadOnly="True" SortExpression="откуда" />
                        <asp:BoundField DataField="куда" HeaderText="Куда" ReadOnly="True" SortExpression="куда" />
                        <asp:BoundField DataField="дата_отправки" HeaderText="Дата отправки" ReadOnly="True" SortExpression="дата_отправки" />
                        <asp:CheckBoxField DataField="выдана" HeaderText="Выдана" ReadOnly="True" SortExpression="выдана" />
                        <asp:BoundField DataField="тип_отправления" HeaderText="Тип" ReadOnly="True" SortExpression="тип_отправления" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EntityTypeName="" Select="new (номер_почтового_отправления, кому, от_кого, откуда, куда, дата_отправки, выдана, тип_отправления)" TableName="Почтовые_отправления">
                </asp:LinqDataSource>
                <br />
                <h2>Добавить новое отправление в отслеживание:</h2>
                <table>
                    <tr>
                        <td class="auto-style14">Трек номер отправления:</td>
                        <td class="auto-style13">

                            <asp:TextBox ID="CabinetAddTrackBox" runat="server"></asp:TextBox>

                        </td>
                        <td class="auto-style12">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="В трек номере должны быть только цифры" ForeColor="Red" ValidationExpression="[0-9]" ControlToValidate="CabinetAddTrackBox" EnableClientScript="False"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="CabinetAddTrackBtn" runat="server" Text="Добавить в отслиживаемые" OnClick="CabinetAddTrackBtn_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">

                            <asp:Label ID="CabinetAddTrackInfo" runat="server" ForeColor="#003399" Text="Label"></asp:Label>

                        </td>
                    </tr>
                </table>
            </div>
        <% } 
            else 
            {
        %>
            <div class="content">
                <h2>Вы не авторизировались. Войдите в систему или <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Зарегистрируйтесь</asp:LinkButton></h2>
            </div>
        <% } %>
    </div>
</asp:Content>
