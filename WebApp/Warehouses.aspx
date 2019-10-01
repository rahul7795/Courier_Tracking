<%@ Page Title="ABC Courier Services - Warehouses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Warehouses.aspx.cs" Inherits="WebApp.Warehouses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 5% !important; text-align: center">

        <asp:GridView ID="gdvWarehouse" runat="server" AutoGenerateColumns="false">
            <Columns>

                <asp:TemplateField HeaderText="Warehouse location">
                    <ItemTemplate>
                        <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("bm_branchName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
        <a href="#" onclick="return warehouseAdd()">Add</a>        
        <br />
        <br />
        <asp:Button ID="btnAddRow" runat="server" OnClick="btnAddRow_Click" Text="Add Row" OnClientClick="return warehouse()"/>
        <br />

        <div id="warehouseAdd" style="display:none;">
            <div class="form-group row">
                <asp:Label runat="server" ID="lblUserFirstName" CssClass="col-md-4 col-form-label text-md-right">Warehouse Name</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox ID="txtWname" runat="server" CssClass="form-control" placeholder="Warehouse Name *"
                     ClientIDMode="Static"></asp:TextBox>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
