<%@ Page Title="ABC Courier Services - Approve Packages" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApprovePackageX.aspx.cs" Inherits="WebApp.ApprovePackageX" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="UpdateStatus"  style="margin-top:5% !important;">

        <asp:GridView runat="server" ID="gdvApprovalData" class="table table-responsive-lg" AutoGenerateColumns="false" 
            OnRowCommand="gdvApprovalData_RowCommand" OnRowDataBound="gdvApprovalData_RowDataBound">

            <Columns>
                <asp:TemplateField HeaderText="Consignment ID">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblcnsngId" Text='<%#Eval("pk_consignment_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Weight">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblpkWeight" Text='<%#Eval("pk_Package_weight") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Sender City">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSendAddress" Text='<%#Eval("pk_Sender_address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Receiver City">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblReceiverAddress" Text='<%#Eval("pk_Receiver_address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Type">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblPkType" Text='<%#Eval("pk_package_type")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Cost">
                    <ItemTemplate>
                        <asp:TextBox runat="server" TextMode="Number" CssClass="form-control" ID="txtPkCost" Text='<%#Eval("pk_cost")%>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Current location">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblLocation" Text='<%#Eval("pk_Current_location")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Update Current location">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control" >
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" SelectedValue='<%# Eval("pk_Package_Status") %>' >
                            <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                            <asp:ListItem Value="Rejected" Text="Rejected"></asp:ListItem>
                            <asp:ListItem Value="Booked" Text="Booked"></asp:ListItem>
                            <asp:ListItem Value="In Transit" Text="In Transit"></asp:ListItem>
                            <asp:ListItem Value="Delivered" Text="Delivered"></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                                
                <asp:ButtonField HeaderText="Approve" ButtonType="Image" ImageUrl="Images/ok.png" CommandName="approve"/>
                <asp:ButtonField HeaderText="Reject" ButtonType="Image" ImageUrl="Images/delete.png" CommandName="reject"/>

            </Columns>
        </asp:GridView>


    </div>
</asp:Content>
