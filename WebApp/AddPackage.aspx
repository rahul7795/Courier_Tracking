<%@ Page Title="ABC Courier Services - Add Package" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPackage.aspx.cs" Inherits="WebApp.AddPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="border-bottom-info" style="margin-bottom: 4%; padding-bottom: 2%; margin-top: 5% !important">
        Add Package 
        <span style="float: right;">
            <a href="Dashboard.aspx" class="btn btn-primary btn-icon-split">
                <span class="icon text-white-50">
                    <i class="fas fa-arrow-left"></i>
                </span>
                <span class="text">Go Back</span>
            </a>
        </span>
    </div>
    <asp:HiddenField runat="server" ID="hidId" />
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="txtPackageWeight">Package Weight</label>
            <asp:TextBox runat="server" ID="txtPackageWeight" class="form-control" placeholder="Package Weight" TextMode="Number"
                ClientIDMode="Static"></asp:TextBox>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="ddlPackageType">Package Type</label>
                <asp:DropDownList runat="server" ID="ddlPackageType" class="form-control" ClientIDMode="Static"
                    OnSelectedIndexChanged="ddlPackageType_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                    <asp:ListItem Value="1" Text="Standard courier services"></asp:ListItem>
                    <asp:ListItem Value="2" Text="Overnight service"></asp:ListItem>
                    <asp:ListItem Value="3" Text="Same day express courier"></asp:ListItem>
                    <asp:ListItem Value="4" Text="International courier service"></asp:ListItem>
                    <asp:ListItem Value="5" Text="Pallet courier services"></asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblDetail" runat="server"></asp:Label>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="txtSenderAddress">Sender Address</label>
            <asp:TextBox runat="server" ID="txtSenderAddress" class="form-control" placeholder="Sender Address" TextMode="MultiLine"
                ClientIDMode="Static">
            </asp:TextBox>
        </div>

        <div class="form-group col-md-6">
            <label for="txtReceiverAddress">Receiver Address</label>
            <asp:TextBox runat="server" ID="txtReceiverAddress" class="form-control" placeholder="Receiver Address" TextMode="MultiLine"
                ClientIDMode="Static">
            </asp:TextBox>
        </div>

        <div class="form-group col-md-6">
            <label for="ddlSendCity">City</label>
            <asp:DropDownList ID="ddlSendCity" runat="server" CssClass="form-control" ClientIDMode="Static">
                <asp:ListItem Text="--Select city--" Value="0"></asp:ListItem>
                <asp:ListItem Text="Chennai" Value="Chennai"></asp:ListItem>
                <asp:ListItem Text="Bangalore" Value="Bangalore"></asp:ListItem>
                <asp:ListItem Text="Coimbatore" Value="Coimbatore"></asp:ListItem>
                <asp:ListItem Text="Cochin" Value="Cochin"></asp:ListItem>
                <asp:ListItem Text="Tiruvananthapuram" Value="Tiruvananthapuram"></asp:ListItem>
                <asp:ListItem Text="Hyderabad" Value="Hyderabad"></asp:ListItem>
                <asp:ListItem Text="Kolkata" Value="Kolkata"></asp:ListItem>
                <asp:ListItem Text="Mumbai" Value="Mumbai"></asp:ListItem>
                <asp:ListItem Text="Pune" Value="Pune"></asp:ListItem>
                <asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group col-md-6">
            <label for="ddlReceiveCity">City</label>
            <asp:DropDownList ID="ddlReceiveCity" runat="server" CssClass="form-control" ClientIDMode="Static">
                <asp:ListItem Text="--Select city--" Value="0"></asp:ListItem>
                <asp:ListItem Text="Chennai" Value="Chennai"></asp:ListItem>
                <asp:ListItem Text="Bangalore" Value="Bangalore"></asp:ListItem>
                <asp:ListItem Text="Coimbatore" Value="Coimbatore"></asp:ListItem>
                <asp:ListItem Text="Cochin" Value="Cochin"></asp:ListItem>
                <asp:ListItem Text="Tiruvananthapuram" Value="Tiruvananthapuram"></asp:ListItem>
                <asp:ListItem Text="Hyderabad" Value="Hyderabad"></asp:ListItem>
                <asp:ListItem Text="Kolkata" Value="Kolkata"></asp:ListItem>
                <asp:ListItem Text="Mumbai" Value="Mumbai"></asp:ListItem>
                <asp:ListItem Text="Pune" Value="Pune"></asp:ListItem>
                <asp:ListItem Text="Delhi" Value="Delhi"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <asp:Button runat="server" ID="btnSubmit" Text="Submit" class="btn btn-primary" ClientIDMode="Static" OnClientClick="return packageValidate();" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
