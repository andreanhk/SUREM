<%@ Page Language="C#" AutoEventWireup="true" codefile="~/Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Registrasi - Domestic Gas Region V</title>

    <link href="assets/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css" />

    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
    <form id="form1" runat="server">
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
					<div class="navbar-form navbar-right">
                        <div class="form-group">
                            <a href="Login.aspx" class="btn btn-info">Login</a>
					    </div>
                    </div>
				</div>
			</div>
		</nav>   
		
		<div class="container">
            <h1 class="near">Halaman Registrasi</h1>
            <h1><small>Domestic Gas Region V</small></h1>
	    </div>
            <hr />
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
                        <div class="form-group">
                            <label for="TextBox_User">Nama Pengguna</label>
                            <asp:TextBox ID="TextBox_User" runat="server" CssClass="form-control" placeholder="Masukkan Nama Pengguna"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="TextBox_Pass">Kata Sandi</label>
                            <asp:TextBox ID="TextBox_Pass" runat="server" CssClass="form-control" placeholder="Masukkan Kata Sandi" Type="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="TextBox_RePass">Ulangi Kata Sandi</label>
                            <asp:TextBox ID="TextBox_RePass" runat="server" CssClass="form-control" placeholder="Ulangi Kata Sandi" Type="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="Register_Btn" runat="server" Text="Daftar" CssClass="btn btn-success btn-sm center-block" OnClick="Register_Click" />
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
