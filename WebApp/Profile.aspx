<%@ Page Title="ABC Courier Services - Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApp.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
         
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto" style="float:right;">
            <li class="nav-item">
                <a class="nav-link" href="Dashboard">Go Back</a>
            </li>
        </ul>
    </div>

    <div class="container" style="margin-top: 5% !important;">
        <div class="form-group row">
            <asp:Label runat="server" ID="lblUserFirstName" CssClass="col-md-4 col-form-label text-md-right">First Name</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="txtFname" runat="server" CssClass="form-control" placeholder="First Name *"
                    ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <asp:Label runat="server" ID="lblUserLastName" class="col-md-4 col-form-label text-md-right">Last Name</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="txtLname" runat="server" CssClass="form-control"
                    placeholder="Last Name *" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <asp:Label runat="server" ID="lblUserEmail" class="col-md-4 col-form-label text-md-right">Email Id</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Id *"
                    ClientIDMode="Static" TextMode="Email"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <asp:Label runat="server" ID="lblUserContactNumber" class="col-md-4 col-form-label text-md-right">Contact Number</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" TextMode="Phone"
                    placeholder="Contact Number *" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <asp:Label runat="server" ID="lblPerAddress" class="col-md-4 col-form-label text-md-right">Permanent Address</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="txtPerAddress" runat="server" CssClass="form-control" placeholder="Permanent Address "
                    ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>

        <div class="form-group row">
            <asp:Label runat="server" ID="lblCorAddress" class="col-md-4 col-form-label text-md-right">Correspondence Address</asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="txtCorAddress" runat="server" CssClass="form-control" placeholder="Correspondence Address *"
                    ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>

        <div class="col-md-6 offset-md-4">
            <asp:Button runat="server" ID="btnUpdate" Text="Update" ClientIDMode="Static" class="btn btn-primary" OnClick="btnUpdate_Click" OnClientClick="return profile()"/>
        </div>

    </div>

        
</asp:Content>
