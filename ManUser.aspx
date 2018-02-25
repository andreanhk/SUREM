<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManUser.aspx.cs" Inherits="ManUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Pengaturan User - Domestic Gas Region V</title>

    <link href="assets/css/main.css" rel="stylesheet" />
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css" />

    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
	
    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip({ html: true });
        });
    </script>
</head>

<body>
    <form id="form2" runat="server">
        <div class="banner">
            <div class="container">
                <div class="row">
                    <img class="pull-left" id="imgbanner" src="assets/images/logo_small.png" />
                    <img class="pull-right" id="imgbannerlpg" src="assets/images/elpiji.png" />
                </div>
            </div>
        </div>
        
        <nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
				
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="Spbe.aspx"><i class="glyphicon glyphicon-home"></i> SP(P)BE</a></li>
						<li><a href="Agen.aspx"><i class="glyphicon glyphicon-user"></i> Agen</a></li>
						<li><a href="Bengkel.aspx"><i class="glyphicon glyphicon-wrench"></i> Bengkel Tabung</a></li>
                        <li><a href="Default.aspx" data-toggle="tooltip" data-placement="bottom" data-html="true" title='Dokumen Dalam Masa Tenggang: <asp:Label ID="Label_TipRmdr" runat="server"></asp:Label><br />Dokumen Habis Masa Berlaku: <asp:Label ID="Label_TipExp" runat="server" CssClass="red"></asp:Label>'><i class="glyphicon glyphicon-time"></i> Monitoring Dokumen <span class="badge"><asp:Label ID="Label_NotifRmdr" runat="server"></asp:Label></span> <span class="badge red"><asp:Label ID="Label_NotifExp" runat="server" CssClass="red"></asp:Label></span></a></li>
                        <li class="active" id="ManageUserTab" runat="server"><a href="ManUser.aspx"><i class="glyphicon glyphicon-th-large"></i> Manajemen Akun</a></li>
					</ul>
					<div class="navbar-form navbar-right">
                        <div class="form-group">
						    <asp:Label ID="LabelUser" runat="server"></asp:Label>
                            <asp:Button ID="ButtonLogout" runat="server" OnClick="Logout_Click" Text="Logout" CssClass="btn btn-warning" />
					    </div>
                    </div>
				</div>
			</div>
		</nav>        

			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
                        <div class ="table-responsive">
						    <asp:GridView ID="GridView_User" CssClass="table table-hover table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="id_user" HeaderText="id_user" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="id_user" />
                                    <asp:TemplateField HeaderText="Nama Pengguna" SortExpression="nama_user">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_User" runat="server" Text='<%# Bind("nama_user") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Kata Sandi" SortExpression="pass_user">
                                        <ItemTemplate>
                                            <asp:Label ID="Label_Password" runat="server" Text='<%# Bind("pass_user") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="status_user">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList_Status" runat="server" SelectedValue='<%# Bind("status_user") %>'>
                                                <asp:ListItem Value="Aktif"></asp:ListItem>
                                                <asp:ListItem Value="Nonaktif"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label_Status" runat="server" Text='<%# Bind("status_user") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="UpdateBtn" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm" ></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="CancelBtn" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm" ></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="EditBtn" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah Status" CssClass="btn btn-info btn-sm" ></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="DeleteBtn" runat="server" CausesValidation="False" CommandName="Delete" Text="X" CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Apakah anda yakin akan menghapus akun ini?');" ></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" DeleteCommand="DELETE FROM [user_list] WHERE [id_user] = @original_id_user AND (([nama_user] = @original_nama_user) OR ([nama_user] IS NULL AND @original_nama_user IS NULL)) AND (([pass_user] = @original_pass_user) OR ([pass_user] IS NULL AND @original_pass_user IS NULL)) AND (([status_user] = @original_status_user) OR ([status_user] IS NULL AND @original_status_user IS NULL))" InsertCommand="INSERT INTO [user_list] ([nama_user], [pass_user], [status_user]) VALUES (@nama_user, @pass_user, @status_user)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [user_list]"
                                UpdateCommand="UPDATE [user_list] SET [status_user] = @status_user WHERE [id_user] = @original_id_user AND (([status_user] = @original_status_user) OR ([status_user] IS NULL AND @original_status_user IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_id_user" Type="Int32" />
                                    <asp:Parameter Name="original_nama_user" Type="String" />
                                    <asp:Parameter Name="original_pass_user" Type="String" />
                                    <asp:Parameter Name="original_status_user" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="nama_user" Type="String" />
                                    <asp:Parameter Name="pass_user" Type="String" />
                                    <asp:Parameter Name="status_user" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="status_user" Type="String" />
                                    <asp:Parameter Name="original_id_user" Type="Int32" />
                                    <asp:Parameter Name="original_status_user" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
					</div>	
				</div>
			</div>
		</div>

		<hr />

		<div class="container">
			<footer class="copyright">
				Hak Cipta &copy; Pertamina 2015
			</footer>
		</div>
    </form>
</body>
</html>