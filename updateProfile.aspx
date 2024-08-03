<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateProfile.aspx.cs" Inherits="Task.updateProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .container-custom {
            max-width: 500px;
        }

        .btn-custom {
            width: 100%;
        }

        .msg-custom {
            margin-top: 1rem;
            text-align: center;
        }

        .gap-10 {
            gap: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4 mb-4">
            <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center justify-content-center gap-2">
                    <h3 class="text-center mb-4">Welcome,
        <asp:Label ID="lbl_name" runat="server" CssClass="font-weight-bold"></asp:Label>
                    </h3>
                </div>
                <div class="text-center my-4 d-flex align-items-center justify-content-center gap-2">
                    <asp:LinkButton ID="lbtn_logout" runat="server" OnClick="lbtn_logout_Click" CssClass="btn btn-danger">Logout</asp:LinkButton>
                </div>
            </div>
        </div>
        <div class="container container-custom shadow mt-5 rounded">
            <h2 class="text-primary text-center pt-3">Update Profile</h2>
            <div class="form-group">
                <label for="txt_email">Email:</label>
                <asp:TextBox ID="txt_email" runat="server" CssClass="form-control" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="updateProfile" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_email" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" ValidationGroup="updateProfile" />
            </div>
            <div class="form-group">
                <label for="txt_name">Name:</label>
                <asp:TextBox ID="txt_name" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" Display="Dynamic" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="updateProfile" />
            </div>
            <div class="form-group">
                <label for="txt_age">Age:</label>
                <asp:TextBox ID="txt_age" runat="server" CssClass="form-control" />
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txt_age" Display="Dynamic" ErrorMessage="Age must be between 20 and 60" ForeColor="Red" MaximumValue="60" MinimumValue="20" ValidationGroup="updateProfile" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_age" Display="Dynamic" ErrorMessage="Age is required" ForeColor="Red" ValidationGroup="updateProfile" />
            </div>
            <div class="form-group">
                <label for="txt_phone">Phone:</label>
                <asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="Invalid Phone Number" ForeColor="Red" ValidationExpression="^01[0-2|5][0-9]{8}$" ValidationGroup="updateProfile" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_phone" Display="Dynamic" ErrorMessage="Phone is required" ForeColor="Red" ValidationGroup="updateProfile" />
            </div>
            <div class="form-group d-flex justify-content-between pb-3">
                <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-custom" OnClick="btn_submit_Click" ValidationGroup="updateProfile" />
            </div>
            <asp:Label ID="lbl_msg" runat="server" CssClass="msg-custom" Visible="false"></asp:Label>

            <div class="mb-4">
                <div class="form-group">
                    <label for="txt_oldPass">Old Password:</label>
                    <asp:TextBox ID="txt_oldPass" runat="server" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_oldPass" Display="Dynamic" ErrorMessage="Old Password is required" ForeColor="Red" ValidationGroup="changePassword" />
                </div>
                <div class="d-flex align-items-center justify-content-center gap-10">
                    <div class="form-group w-50">
                        <label for="txt_newPass">New Password:</label>
                        <asp:TextBox ID="txt_newPass" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txt_newPass" Display="Dynamic" ErrorMessage="Invalid Password (passowrd must be at least 8 characters and start with captal letter)" ForeColor="Red" ValidationExpression="^[A-Z][A-Za-z0-9]{7,}$" ValidationGroup="changePassword" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_newPass" Display="Dynamic" ErrorMessage="New Password is required" ForeColor="Red" ValidationGroup="changePassword" />
                    </div>
                    <div class="form-group w-50">
                        <label for="txt_confirmPass">Confirm Password:</label>
                        <asp:TextBox ID="txt_confirmPass" runat="server" TextMode="Password" CssClass="form-control" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_newPass" ControlToValidate="txt_confirmPass" Display="Dynamic" ErrorMessage="Passwords do not match" ForeColor="Red" ValidationGroup="changePassword" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_confirmPass" Display="Dynamic" ErrorMessage="Confirm Password is required" ForeColor="Red" ValidationGroup="changePassword" />
                    </div>
                </div>
                <div class="form-group d-flex justify-content-between pb-3">
                    <asp:Button ID="btn_password" runat="server" Text="Change Password" CssClass="btn btn-primary btn-custom" OnClick="btn_password_Click" ValidationGroup="changePassword" />
                </div>
                <asp:Label ID="lbl_passMsg" runat="server" CssClass="msg-custom" Visible="False"></asp:Label>

            </div>
        </div>
    </form>
</body>
</html>
