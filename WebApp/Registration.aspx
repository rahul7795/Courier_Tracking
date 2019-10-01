<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApp.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABC Courier Services - Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
    <style>
        .container a {
            color: mediumvioletred !important;
        }

        .btn-primary {
            background-color: mediumvioletred !important;
            border-color: #fff !important;
        }

            .btn-primary:hover {
                background-color: #fff !important;
                border-color: #fff !important;
                color: mediumvioletred !important;
            }

        .navbar-laravel {
            border-bottom: 1px solid mediumvioletred;
            border-bottom-color: mediumvioletred !important;
        }
    </style>

    <script type="text/javascript" src="Scripts/Script.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        function ErrFunction(message) {
            swal({
                title: message,
                text: "",
                icon: "error",
                button: "Ok",
                html: true
            });

        }
        function SuccessFunction(message) {
            swal({
                title: message,
                text: "",
                icon: "success",
                button: "Ok",
                html: true
            });
        }
    </script>

    <script type="text/javascript">
        function toggle() {
            var x = document.getElementById("Employee");
            if (x.style.display === 'none') {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    </script>


</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
        <div class="container">
            <a class="navbar-brand" href="#">ABC Courier</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <main class="login-form" style="margin-top: 5% !important;">
        <div class="cotainer">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header" style="background-color: mediumvioletred !important; color: white;">Users Login</div>
                        <div class="card-body">
                            <form runat="server" id="form1">
                                <div><a class="small" href="#" onclick="return toggle()">Not User? Click Here</a></div>

                                <div class="form-group row">
                                    <label for="txtUserFirstName" class="col-md-4 col-form-label text-md-right">First Name</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtUserFirstName" runat="server" CssClass="form-control" placeholder="First Name *"
                                            ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="txtUserLastName" class="col-md-4 col-form-label text-md-right">Last Name</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtUserLastName" runat="server" CssClass="form-control"
                                            placeholder="Last Name *" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="txtUserEmail" class="col-md-4 col-form-label text-md-right">Email Id</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtUserEmail" runat="server" CssClass="form-control" placeholder="Email Id *"
                                            ClientIDMode="Static" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="ddlGender" class="col-md-4 col-form-label text-md-right">Gender</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0" Text="--Select Gender--"></asp:ListItem>
                                            <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                            <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="txtUserContactNumber" class="col-md-4 col-form-label text-md-right">Contact Number</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtUserContactNumber" runat="server" CssClass="form-control" TextMode="Phone"
                                            placeholder="Contact Number *" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="txtUserId" class="col-md-4 col-form-label text-md-right">User Id</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control"
                                            placeholder="User Id *" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="txtUserPassword" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtUserPassword" runat="server" CssClass="form-control" placeholder="Password *"
                                            TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="txtUserCPassword" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtUserCPassword" runat="server" CssClass="form-control" TextMode="Password"
                                            placeholder="Confirm Password *" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="ddlRole" class="col-md-4 col-form-label text-md-right">Role</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0" Text="--Select Role--"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="User"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Staff"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Admin"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>


                                <div id="Employee" style="display: none;">
                                    <div class="form-group row">
                                        <label for="txtDesigation" class="col-md-4 col-form-label text-md-right">Designation</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtDesigation" runat="server" CssClass="form-control" placeholder="Designation *"
                                                ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="txtPerAddress" class="col-md-4 col-form-label text-md-right">Permanent Address</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtPerAddress" runat="server" CssClass="form-control" placeholder="Permanent Address "
                                                ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="txtCorAddress" class="col-md-4 col-form-label text-md-right">Correspondence Address</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtCorAddress" runat="server" CssClass="form-control" placeholder="Correspondence Address *"
                                                ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                    <asp:Button runat="server" ID="btnLogin" Text="Register" ClientIDMode="Static"
                                        class="btn btn-primary" OnClick="btnLogin_Click" OnClientClick="return validate()" />                                    
                                    <div>
                                        <a class="small" href="Login.aspx">Already have an account? Login!</a>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </main>
</body>
</html>
