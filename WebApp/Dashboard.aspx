<%@ Page Title="ABC Courier Services - Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApp.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .wrimagecard {
            margin-top: 0;
            margin-bottom: 1.5rem;
            text-align: left;
            position: relative;
            background: #fff;
            box-shadow: 12px 15px 20px 0px rgba(46,61,73,0.15);
            border-radius: 4px;
            transition: all 0.3s ease;
        }

            .wrimagecard .fa {
                position: relative;
                font-size: 70px;
            }

        .wrimagecard-topimage_header {
            padding: 20px;
        }

        a.wrimagecard:hover, .wrimagecard-topimage:hover {
            box-shadow: 2px 4px 8px 0px rgba(46,61,73,0.2);
        }

        .wrimagecard-topimage a {
            width: 100%;
            height: 100%;
            display: block;
        }

        .wrimagecard-topimage_title {
            padding: 20px 24px;
            height: 80px;
            padding-bottom: 0.75rem;
            position: relative;
        }

        .wrimagecard-topimage a {
            border-bottom: none;
            text-decoration: none;
            color: #525c65;
            transition: color 0.3s ease;
        }

        #divDashboard {
            margin-top: 5% !important;
        }

        .badge {
            color: black;
            background-color: yellow;
        }
    </style>

    <div id="divDashboard" class="container">

        <div class="container-fluid">
            <div class="row">
                <%if (Session["RoleID"].ToString() != "1") { %>
                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="ApprovePackages" id="total" runat="server" onserverclick="total_ServerClick">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(187, 120, 36, 0.1)">
                                <center><i class="fa fa-envelope-o" style="color:blueviolet"></i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Total Shipments
            <div class="pull-right badge">
                <asp:Label runat="server" ID="lblTotal" Text="0"></asp:Label>
            </div>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                
                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="ApprovePackages" id="accepted" runat="server" onserverclick="accepted_ServerClick">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(22, 160, 133, 0.1)">
                                <center><i class = "fa fa-check-circle" style="color:#16A085"></i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Accepted Shipments
            <div class="pull-right badge" id="WrControls">
                <asp:Label runat="server" ID="lblAccepted" Text="0"></asp:Label>
            </div>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="ApprovePackages" id="rejected" runat="server" onserverclick="rejected_ServerClick">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(213, 15, 37, 0.1)">
                                <center><i class="fa fa-trash-o" style="color:#d50f25"> </i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Rejected Shipments
            <div class="pull-right badge" id="WrForms">
                <asp:Label runat="server" ID="lblRejected" Text="0"></asp:Label>
            </div>
                                </h4>
                            </div>

                        </a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="ApprovePackages" id="pending" runat="server" onserverclick="pending_ServerClick">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(51, 105, 232, 0.1)">
                                <center><i class="fa fa-spinner" style="color:#3369e8"> </i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Pending Shipments
            <div class="pull-right badge" id="WrGridSystem">
                <asp:Label runat="server" ID="lblPending" Text="0"></asp:Label>
            </div>
                                </h4>
                            </div>

                        </a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="Policies">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(250, 188, 9, 0.1)">
                                <center><i class="fa fa-list-ol" style="color:gold"> </i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Policies
            <div class="pull-right badge" id="WrInformation"></div>
                                </h4>
                            </div>

                        </a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="PackageTypes">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(121, 90, 71, 0.1)">
                                <center><i class="fa fa-file-o" style="color:forestgreen"> </i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Shipment Types
            <div class="pull-right badge" id="WrNavigation"></div>
                                </h4>
                            </div>

                        </a>
                    </div>
                </div>
                <%} 
                    %>

                <%if (Session["RoleID"].ToString() != "4")
                    {
                        if (Session["RoleID"].ToString() != "1")
                        {%>

                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="Warehouses">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(130, 93, 9, 0.1)">
                                <center><i class="fa fa-building-o" style="color:#825d09"></i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Warehouse Management
            <div class="pull-right badge" id="WrThemesIcons"></div>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>
                <%} 
                    %>
                <div class="col-md-3 col-sm-4">
                    <div class="wrimagecard wrimagecard-topimage">
                        <a href="ApproveUsers">
                            <div class="wrimagecard-topimage_header" style="background-color: rgba(144, 238, 144, 0.1)">
                                <center><i class="fa fa-user" style="color:deepskyblue"></i></center>
                            </div>
                            <div class="wrimagecard-topimage_title">
                                <h4>Approve Users
            <div class="pull-right badge" id="WrThemesIcons"></div>
                                </h4>
                            </div>
                        </a>
                    </div>
                </div>                
                
                <%} 
                    %>

            </div>
        </div>

    </div>
</asp:Content>
