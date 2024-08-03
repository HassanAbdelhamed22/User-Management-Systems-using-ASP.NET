<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Task.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-body">
                        <h2 class="text-center mb-4 text-primary">Login</h2>
                        <div class="form-group">
                            <label for="txt_usename">Username:</label>
                            <asp:TextBox ID="txt_usename" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txt_password">Password:</label>
                            <asp:TextBox ID="txt_password" runat="server" TextMode="Password" CssClass="form-control" />
                        </div>
                        <div class="form-check">
                            <asp:CheckBox ID="ckb_remeber" runat="server" CssClass="form-check-input" />
                            <label class="form-check-label" for="ckb_remeber">Remember me</label>
                        </div>
                        <div class="form-group mt-4">
                            <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Login" CssClass="btn btn-primary btn-block" />
                        </div>
                        <div class="text-center">
                            <asp:LinkButton ID="btn_haveAcc" runat="server" OnClick="btn_haveAcc_Click" CssClass="btn btn-link">Already have an account?</asp:LinkButton>
                        </div>
                        <div class="text-danger mt-3">
                            <asp:Label ID="lbl_error" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
