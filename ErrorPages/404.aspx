<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="ErrorPages_404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="~/assets/images/favicon.ico" />

	<title>404 - Domestic Gas Region V</title>

    <link href="~/assets/css/main.css" rel="stylesheet" />
	<link rel="stylesheet" href="~/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="~/assets/css/bootstrap-theme.min.css" />

    <script src="~/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="~/assets/js/bootstrap.min.js" type="text/javascript"></script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="banner">
            <div class="container">
                <div class="row">
                    <img class="pull-left" id="imgbanner" src="../assets/images/logo_small.png" />
                    <img class="pull-right" id="imgbannerlpg" src="../assets/images/elpiji.png" />
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
						    <asp:Label ID="LabelUser" runat="server"></asp:Label>
                            <asp:Button ID="ButtonLogout" runat="server" OnClick="Logout_Click" Text="Logout" CssClass="btn btn-warning" />
					    </div>
                    </div>
				</div>
			</div>
		</nav>   

			<div class="container">
          
                <img src="../assets/images/404.png" class="img-responsive center-block" height="350px" width="350px" />
				<h1 class="near">Mohon Maaf..</h1>
				<h1><small>Halaman yang anda cari tidak dapat ditemukan.</small></h1>
                <p class="text-center"><a href="../Default.aspx">Kembali ke Halaman Utama</a></p>
       
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

