<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABC Courier Services - Login</title>
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
                    <li class="nav-item" style="display: none;">
                        <a class="nav-link" href="Login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Registration">Register</a>
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
                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">Username</label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="txtUsername" class="form-control" placeholder="User ID"
                                            autofocus="autofocus"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                    <div class="col-md-6">
                                        <asp:TextBox runat="server" ID="txtPassowrd" class="form-control" placeholder="Password"
                                            TextMode="Password"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-md-6 offset-md-4">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="remember">
                                                Remember Me
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 offset-md-4">
                                    <asp:Button runat="server" ID="btnLogin" Text="Login" class="btn btn-primary" OnClick="btnLogin_Click" />
                                    <a href="Registration" class="btn btn-link">New User? Click here to Signup
                                    </a>
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
