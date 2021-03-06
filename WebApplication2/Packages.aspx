﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="WebApplication2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .auto-style12 {
            width: 116px;
        }
        .auto-style13 {
            width: 217px;
        }
        .auto-style15 {
            width: 216px;
        }
        .auto-style16 {
            width: 266px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="content">
        <h2 class="heading">
            Информация о почтовых отправлениях
        </h2>
        <p class="heading">
            <table>
                <tr>
                    <td>
                        Поиск по трек номеру:
                    </td>
                    <td>
                        <asp:TextBox ID="PackagesFindByTrackBox" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="PackagesFindByTrack" runat="server" Text="Искать" OnClick="PackagesFindByTrack_Click" />
                    </td>
                    <td>
                        <asp:Label ID="PackageFindInfo" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </p>
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
                <asp:TemplateField HeaderText="Склад" SortExpression="индификатор_склада">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("индификатор_склада") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        Склад
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource2" DataTextField="Адрес" DataValueField="индификатор_склада" Enabled="False" SelectedValue='<%# Bind("индификатор_склада", "{0}") %>'>
                        </asp:DropDownList>
                        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EntityTypeName="" TableName="Склады">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EntityTypeName="" TableName="Склады">
                        </asp:LinqDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <%
            // Information about packages are avaliable only for admin and employee
            if (Convert.ToInt32(Session["ROLE"]) > 0)
            {
        %>
            <table>
                <tr>
                    <td>
                         <asp:Button ID="SubmitPackage" runat="server" Text="Выдать выбранную посылку" OnClick="SubmitPackage_Click" Width="229px" />
                    </td>
                    <td>
                        <asp:Button ID="PackageCreatePackage" runat="server" Text="Создать отправление" Width="159px" OnClick="PackageCreatePackage_Click" />
                        <asp:Label ID="PackagesSubmitlabel" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Показать геолокации посылки" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>       
        <%
            }
        %>
        <br />
        <asp:Panel ID="AddNewPackagePanel" runat="server" Visible="false">
            <h2>Добавление нового отправления:</h2>
            <table>
                <tr>
                    <td>Тип отправления</td>
                    <td>
                        <asp:DropDownList ID="NewPackageType" runat="server" DataSourceID="LinqDataSource2"></asp:DropDownList>
                    </td>
                    <td>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewPackageType" ErrorMessage="Поле не может быть пустым" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        Кому
                    </td>
                    <td>

                        <asp:TextBox ID="PackagesToBox" runat="server"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PackagesToBox" ErrorMessage="Поле не может быть пустым" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        От кого
                    </td>
                    <td>
                        <asp:TextBox ID="PackagesFromBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PackagesFromBox" ErrorMessage="Поле не может быть пустым" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        Откуда
                    </td>
                    <td>

                        <asp:TextBox ID="PackagesFromHere" runat="server"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PackagesFromHere" ErrorMessage="Поле не может быть пустым" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        Куда
                    </td>
                    <td>

                        <asp:TextBox ID="PackagesToHere" runat="server"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PackagesToHere" ErrorMessage="Поле не может быть пустым" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>

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
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="NewWarehouseNumber" ErrorMessage="Поле не может быть пустым" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="NewPackageBtn" runat="server" Text="Добавить" OnClick="NewPackageBtn_Click" Width="277px" />
                    </td>
                    <td>
                        <asp:Label ID="NewPackageInfoLabel" runat="server" Text="Label" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="PackagesGeolocationPanel" runat="server">
            <h2>Геолокация выбранного отправления:</h2>
            <table>
                <tr>
                    <td colspan="3">
                        <asp:GridView ID="PackageMoreGeolocations" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="LinqDataSource2">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="текущее_местоположение" HeaderText="текущее_местоположение" ReadOnly="True" SortExpression="текущее_местоположение"/>
                                    <asp:BoundField DataField="время_прибытия" HeaderText="время_прибытия" ReadOnly="True" SortExpression="время_прибытия"/>
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="WebApplication2.DataClasses1DataContext" EntityTypeName="" Select="new (текущее_местоположение, время_прибытия)" TableName="Геолокации">
                            </asp:LinqDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        Добавить новую геолокацию</td>
                    <td class="auto-style16">
                        <asp:TextBox ID="PackagesAddGeolocationBox" runat="server" Width="187px"></asp:TextBox>
                        <asp:Button ID="PackagesAddGeolocationNewBtn" runat="server" OnClick="Button2_Click" Text="Добавить" Width="64px" />
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="PackagesAddGeolocationLabel" runat="server" ForeColor="Red" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
    </div>
</asp:Content>
