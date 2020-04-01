<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Employees.aspx.cs" Inherits="WebApplication2.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="content">
        <h2>Сотрудники почты</h2>

        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" ShowFooter="true" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="номер_сотрудника" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  OnDataBound="GridView1_DataBound">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="номер_сотрудника" HeaderText="Номер" ReadOnly="True" SortExpression="номер_сотрудника" />
                <asp:TemplateField HeaderText="Склад" SortExpression="индификатор_склада">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("индификатор_склада") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="WarehousesDropList" runat="server" DataSourceID="LinqDataSource2" DataTextField="Адрес" DataValueField="индификатор_склада" SelectedValue='<%# Bind("индификатор_склада", "{0}") %>' Enabled="False">
                        </asp:DropDownList>
                        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EntityTypeName="" TableName="Склады">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EntityTypeName="" TableName="Склады">
                        </asp:LinqDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ФИО" HeaderText="ФИО" SortExpression="ФИО" />
                <asp:BoundField DataField="Должность" HeaderText="Должность" SortExpression="Должность" />
                <asp:BoundField DataField="Оклад" HeaderText="Оклад" SortExpression="Оклад" />
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
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Сотрудники">
            </asp:LinqDataSource>
    </div>
</asp:Content>
