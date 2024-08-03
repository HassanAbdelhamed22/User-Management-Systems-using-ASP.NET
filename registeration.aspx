<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registeration.aspx.cs" Inherits="Task.registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container shadow mt-5 rounded w-50">
            <h2 class="text-primary text-center pt-3">Registration Form</h2>
            <div class="form-group">
                <label for="txt_name">Username:</label>
                <asp:TextBox ID="txt_name" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="txt_password">Password:</label>
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_password" Display="Dynamic" ErrorMessage="Invalid Password (password must be at least 8 characters and start with a capital letter)" ForeColor="Red" ValidationExpression="^[A-Z][A-Za-z0-9]{7,}$" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_password" Display="Dynamic" ErrorMessage="Password is required" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="txt_confirm">Confirm Password:</label>
                <asp:TextBox ID="txt_confirm" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_password" ControlToValidate="txt_confirm" Display="Dynamic" ErrorMessage="Passwords do not match" ForeColor="Red" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_confirm" Display="Dynamic" ErrorMessage="Confirm Password is required" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="txt_email">Email:</label>
                <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="txt_age">Age:</label>
                <asp:TextBox ID="txt_age" runat="server" CssClass="form-control" />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_age" Display="Dynamic" ErrorMessage="Age must be between 20 and 60" ForeColor="Red" MaximumValue="60" MinimumValue="20" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_age" Display="Dynamic" ErrorMessage="Age is required" ForeColor="Red" />
            </div>
            <div class="form-group">
                <label for="txt_phone">Phone:</label>
                <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="Invalid Phone Number" ForeColor="Red" ValidationExpression="^01[0-2|5][0-9]{8}$" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="Phone is required" ForeColor="Red" />
            </div>
            <div class="form-group d-flex justify-content-between pb-3">
                <asp:Button ID="btn_save" runat="server" OnClick="btn_save_Click" Text="Register" CssClass="btn btn-primary" />
                <asp:Button ID="btn_login" runat="server" OnClick="btn_login_Click" Text="Login" CssClass="btn btn-secondary" ValidationGroup="sd" />
            </div>
            <div class="form-group d-flex justify-content-center">
                <asp:Label ID="lbl_msg" runat="server" CssClass="pb-3 mb-3" Visible="false" />
            </div>
        </div>
    </form>
</body>
</html>
