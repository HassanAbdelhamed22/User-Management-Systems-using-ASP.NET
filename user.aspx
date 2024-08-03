<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="Task.user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .nav-link {
            color: #5D7B9D;
            font-weight: bold;
            text-decoration: none;
            transition: color 0.3s ease-in-out, transform 0.3s ease-in-out;
        }

        .nav-link:hover {
                color: #41566e;
                transform: scale(1.1);
                text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <div class="d-flex align-items-center justify-content-between">
                <h3 class="text-center mb-4">Welcome,
                <asp:Label ID="lbl_name" runat="server" CssClass="font-weight-bold"></asp:Label></h3>
                <div class="text-center my-4 d-flex align-items-center justify-content-center gap-2">
                    <a href="updateProfile.aspx" class="nav-link">Profile</a>
                    <asp:LinkButton ID="btn_logout" runat="server" OnClick="LinkButton1_Click" CssClass="btn btn-danger">Logout</asp:LinkButton>
                </div>
            </div>

            <div class="row custom-search">
                <div class="col-md-6 offset-md-3">
                    <div class="input-group">
                        <asp:TextBox ID="txt_search" runat="server" CssClass="form-control" Placeholder="Search by CRN" required=""></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="btn_search" runat="server" OnClick="btn_search_Click" CssClass="btn btn-primary" Text="Search" />
                        </div>
                    </div>
                </div>
            </div>



            <asp:GridView ID="gv_admin" runat="server" AutoGenerateColumns="False" CssClass="table  table-bordered mt-5">
                <Columns>
                    <asp:BoundField DataField="CRN" HeaderText="CRN" SortExpression="CRN" />
                    <asp:BoundField DataField="Agent_Name" HeaderText="Agent Name" SortExpression="Agent_Name" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                    <asp:BoundField DataField="Branch_type" HeaderText="Type" SortExpression="Branch_type" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

            <asp:Label ID="lbl_error" runat="server" CssClass="text-danger mt-3"></asp:Label>
        </div>
    </form>
</body>
</html>
