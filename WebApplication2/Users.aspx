<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebApplication2.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .auto-style12 {
            width: 768px;
        }
        .auto-style13 {
            width: 234px;
        }
        .auto-style14 {
            width: 117px;
        }
        .auto-style15 {
            width: 68px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
     <div class="content">
        <h2 class="heading">
            Пользователи сервиса
        </h2>
         <br />
         <table class="auto-style12">
             <tr>
                 <td class="auto-style13">Поиск по логину пользователя:</td>
                 <td class="auto-style14">
                     <asp:TextBox ID="UsersFindUsersBox" runat="server"></asp:TextBox>
                 </td>
                 <td class="auto-style15">
                     <asp:Button ID="UsersFindUsersBtn" runat="server" Text="Поиск" OnClick="UsersFindUsersBtn_Click" />
                 </td>
                 <td>
                     <asp:Label ID="UsersFindInfoLabel" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                 </td>
             </tr>
         </table>
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="True" OnDataBound="Users_DataBound">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:BoundField DataField="id" HeaderText="Индификатор" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                 <asp:BoundField DataField="username" HeaderText="Пользователь" SortExpression="username" />
                 <asp:TemplateField HeaderText="Тип пользователя" SortExpression="isAdmin">
                     <EditItemTemplate>
                         <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("isAdmin", "{0}") %>'>
                             <asp:ListItem Text="Пользователь" Value="0"></asp:ListItem>
                             <asp:ListItem Text="Администратор" Value="1"></asp:ListItem>
                             <asp:ListItem Text="Сотрудник" Value="3"></asp:ListItem>
                         </asp:DropDownList>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("isAdmin", "{0}") %>' Enabled="false">
                             <asp:ListItem Text="Пользователь" Value="0"></asp:ListItem>
                             <asp:ListItem Text="Администратор" Value="1"></asp:ListItem>
                             <asp:ListItem Text="Сотрудник" Value="3"></asp:ListItem>
                         </asp:DropDownList>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                 <asp:CommandField ShowEditButton="True" ShowSelectButton="True" >
                 <ControlStyle CssClass="control-button" />
                 </asp:CommandField>
             </Columns>
             <EditRowStyle BackColor="#2461BF" />
             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#EFF3FB" />
             <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#F5F7FB" />
             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
             <SortedDescendingCellStyle BackColor="#E9EBEF" />
             <SortedDescendingHeaderStyle BackColor="#4870BE" />
         </asp:GridView>
         <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EntityTypeName="" TableName="users" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
         </asp:LinqDataSource>
    </div>
</asp:Content>