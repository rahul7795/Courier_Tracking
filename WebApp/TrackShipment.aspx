<%@ Page Title="ABC Courier Services - Track Shipment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrackShipment.aspx.cs" Inherits="WebApp.TrackShipment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Shipment.css" rel="stylesheet" />
    <div class="container">
        <br>
        <p class="text-center">Track Shipment</p>
    </div>
    <div id="UpdateStatus" style="height: 300px; overflow-y: scroll">
        <asp:GridView runat="server" ID="gdvData" class="table table-responsive-lg" AutoGenerateColumns="false"
            OnRowCommand="gdvData_RowCommand">
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
                        <asp:Label runat="server" TextMode="Number" ID="txtPkCost" Text='<%#Eval("pk_cost")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="status" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="txtstatus" Text='<%#Eval("pk_Package_Status")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:ButtonField HeaderText="" ButtonType="Button" ControlStyle-CssClass="btn btn-secondary" Text='Track' CommandName="track" />
            </Columns>
        </asp:GridView>
    </div>

    <%
        try
        {
            if (Session["TrackStatus"].ToString() != null)
            {
                if (Session["TrackStatus"].ToString() == "Booked")
                {%>
    <div class="card">
        <div class="title">
            Your Shipment Status
        </div>
        <div class="line"></div>
        <div class="steps">
            <div class="step">
                <div class="step_success">
                    Initiated
                </div>

            </div>
            <div class="step">
                <div class="step_processing">
                    Accepted
                </div>
            </div>
            <div class="step">
                <div class="step_processing">
                    Delivered
                </div>
            </div>
        </div>
    </div>
    <%}
        if (Session["TrackStatus"].ToString() == "Delivered")
        {%>
    <div class="card">
        <div class="title">
            Your Shipment Status
        </div>
        <div class="line"></div>
        <div class="steps">
            <div class="step">
                <div class="step_success">
                    Initiated
                </div>

            </div>
            <div class="step">
                <div class="step_success">
                    Accepted
                </div>
            </div>
            <div class="step">
                <div class="step_success">
                    Delivered
                </div>
            </div>
        </div>
    </div>
    <% }
        if (Session["TrackStatus"].ToString() == "In Transit")
        {%>
    <div class="card">
        <div class="title">
            Your Shipment Status
        </div>
        <div class="line"></div>
        <div class="steps">
            <div class="step">
                <div class="step_success">
                    Initiated
                </div>

            </div>
            <div class="step">
                <div class="step_success">
                    In Transit
                </div>
            </div>
            <div class="step">
                <div class="step_processing">
                    Delivered
                </div>
            </div>
        </div>
    </div>
    <%}
        if (Session["TrackStatus"].ToString() == "Rejected")
        {%>
    <div class="card">
        <div class="title">
            Your Shipment Status
        </div>
        <div class="line"></div>
        <div class="steps">
            <div class="step">
                <div class="step_success">
                    Initiated
                </div>

            </div>
            <div class="step">
                <div class="step_reject">
                    Rejected
                </div>
            </div>
            <div class="step">
                <div class="step_reject">
                    Can't be Delivered
                </div>
            </div>
        </div>
    </div>
    <%}
            }
        }
        catch (Exception ex)
        {

        }


     %>
</asp:Content>
