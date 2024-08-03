<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Task.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <!-- jQuery and Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .main-color {
            background-color: #5D7B9D;
            color: white;
        }

        .btn-gap {
            margin-right: 10px;
        }

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
        <div class="container mt-4 mb-4">
            <div class="d-flex align-items-center justify-content-between">
                <div class="d-flex align-items-center justify-content-center gap-2">
                    <h3 class="text-center mb-4">Welcome,
                    <asp:Label ID="lbl_name" runat="server" CssClass="font-weight-bold"></asp:Label>
                    </h3>
                </div>
                <div class="text-center my-4 d-flex align-items-center justify-content-center gap-2">
                    <a href="updateProfile.aspx" class="nav-link">Profile</a>
                    <asp:LinkButton ID="lbtn_logout" runat="server" OnClick="lbtn_logout_Click" CssClass="btn btn-danger">Logout</asp:LinkButton>
                </div>
            </div>
            <div class="d-flex align-items-center justify-content-center gap-4 mb-3">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-light border" />
                <asp:Button ID="UploadButton" Text="Upload" OnClick="UploadButton_Click" runat="server" CssClass="btn main-color btn-gap" />
                <asp:Button ID="btn_deleteAll" runat="server" OnClick="btn_deleteAll_Click" Text="Delete All" OnClientClick="return confirm('Are you sure to delete all data?');" CssClass="btn btn-danger" />
            </div>
            <asp:GridView ID="gv_admin" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CRN" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="gv_admin_RowCancelingEdit" OnRowDeleting="gv_admin_RowDeleting" OnRowEditing="gv_admin_RowEditing" OnRowUpdating="gv_admin_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-bordered mt-5">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="CRN">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_crn" runat="server" Text='<%# Bind("CRN") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CRN") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Agent Name">
                        <EditItemTemplate>
                            <asp:Label ID="lbl_name" runat="server" Text='<%# Eval("Agent_Name") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Agent_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reason">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_reason" runat="server" OnTextChanged="TextBox1_TextChanged" Text='<%# Bind("Reason") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Reason") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_type" runat="server" Text='<%# Bind("Branch_type") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Branch_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <div class="d-flex align-items-center justify-content-between gap-2">
                                <asp:LinkButton ID="LinkButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary"></asp:LinkButton>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-primary"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure to delete?');" Text="Delete" CssClass="btn btn-danger"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
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
        </div>
    </form>
</body>
</html>
