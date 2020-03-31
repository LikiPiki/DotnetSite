<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="WebApplication2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="content">
        <h2 class="heading">
            Информация о почтовых отправлениях
        </h2>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="номер_почтового_отправления" DataSourceID="LinqDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" ShowHeader="True" HeaderText="Функции" >
                <ControlStyle CssClass="control-button" />
                <HeaderStyle Wrap="False" />
                <ItemStyle Wrap="False" Height="10px"/>
                </asp:CommandField>
                <asp:BoundField DataField="номер_почтового_отправления" HeaderText="Номер" ReadOnly="True" SortExpression="номер_почтового_отправления" />
                <asp:BoundField DataField="кому" HeaderText="Кому" SortExpression="кому" />
                <asp:BoundField DataField="от_кого" HeaderText="От кого" SortExpression="от_кого" />
                <asp:BoundField DataField="откуда" HeaderText="Откуда" SortExpression="откуда" />
                <asp:BoundField DataField="куда" HeaderText="Куда" SortExpression="куда" />
                <asp:BoundField DataField="дата_отправки" HeaderText="Дата отправки" SortExpression="дата_отправки" />
                <asp:CheckBoxField DataField="выдана" HeaderText="Выдана" SortExpression="выдана" />
                <asp:BoundField DataField="индификатор_склада" HeaderText="Склад" SortExpression="индификатор_склада" />
                <asp:BoundField DataField="тип_отправления" HeaderText="Тип" SortExpression="тип_отправления" />
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
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Почтовые_отправления">
        </asp:LinqDataSource>
        <asp:Button ID="PackagesAddNewBtn" runat="server" Text="Добавить почтовое отправление" Width="307px" />

        <asp:Panel ID="AddNewPackagePanel" runat="server">
            <table>
                <tr>
                    <td>Тип отправления</td>
                    <td>
                        <asp:DropDownList ID="NewPackageType" runat="server" DataSourceID="LinqDataSource2"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Кому
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        От кого
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Откуда
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Куда
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Склад
                    </td>
                    <td>

                        <asp:DropDownList ID="NewWarehouseNumber" runat="server" DataTextField="label" DataValueField="индификатор_склада">
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="NewPackageBtn" runat="server" Text="Добавить" />
                    </td>
                    <td>
                         <asp:Button ID="NewPackageCancel" runat="server" Text="Отменить" ForeColor="Red" />
                    </td>
                </tr>

            </table>
        </asp:Panel>

        <br />
    </div>
    <style>
        .control-button {
            display: inline-block;
            border: 1px solid gray;
            border-radius: 2px;
            padding: 2px;
            padding-left: 3px;
            padding-right: 3px;
            text-decoration: none;
        }
    </style>
</asp:Content>
