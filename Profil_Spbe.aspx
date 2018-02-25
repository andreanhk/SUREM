<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profil_Spbe.aspx.cs" Inherits="Try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Profil SP(P)BE - Domestic Gas Region V</title>

    <link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css"/>
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css" />

    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap-datepicker.min.js"></script>

    <script type="text/javascript">
        function LoadDiv(url) {
            var img = new Image();
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
            };
            img.src = url;
            return false;
        }
    </script>

    <script type="text/javascript">
        function LoadDiv1(url) {
            var img = new Image();
            img.onload = function () {
                imgFull1.src = img.src;
                imgFull1.style.display = "block";
            };
            img.src = url;
            return false;
        }
    </script>

    <script type="text/javascript">
        function LoadGal(url) {
            var img = new Image();
            img.onload = function () {
                imgGal.src = img.src;
                imgGal.style.display = "block";
            };
            img.src = url;
            return false;
        }
    </script>

    <script type="text/javascript">
        $(function () {
            $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
                //save the latest tab; use cookies if you like 'em better:
                localStorage.setItem('lastTab', $(this).attr('href'));
            });

            //go to the latest tab, if it exists:
            var lastTab = localStorage.getItem('lastTab');
            if (lastTab) {
                $('a[href=' + lastTab + ']').tab('show');
            }
            else {
                // Set the first tab if cookie do not exist
                $('a[data-toggle="tab"]:first').tab('show');
            }
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip({ html: true });
        });
    </script>
    
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
					<ul class="nav navbar-nav">
						<li class="active"><a href="Spbe.aspx"><i class="glyphicon glyphicon-home"></i> SP(P)BE</a></li>
						<li><a href="Agen.aspx"><i class="glyphicon glyphicon-user"></i> Agen</a></li>
						<li><a href="Bengkel.aspx"><i class="glyphicon glyphicon-wrench"></i> Bengkel Tabung</a></li>
                        <li><a href="Default.aspx" data-toggle="tooltip" data-placement="bottom" data-html="true" title='Dokumen Dalam Masa Tenggang: <asp:Label ID="Label_TipRmdr" runat="server"></asp:Label><br />Dokumen Habis Masa Berlaku: <asp:Label ID="Label_TipExp" runat="server" CssClass="red"></asp:Label>'><i class="glyphicon glyphicon-time"></i> Monitoring Dokumen <span class="badge"><asp:Label ID="Label_NotifRmdr" runat="server"></asp:Label></span> <span class="badge red"><asp:Label ID="Label_NotifExp" runat="server" CssClass="red"></asp:Label></span></a></li>
                        <li id="ManageUserTab" runat="server"><a href="ManUser.aspx"><i class="glyphicon glyphicon-th-large"></i> Manajemen Akun</a></li>
					</ul>
					<div class="navbar-form navbar-right">
                        <div class="form-group">
						    <asp:Label ID="LabelUser" runat="server"></asp:Label>
                            <asp:LinkButton ID="ButtonLogout" runat="server" OnClick="Logout_Click" Text="Logout" CssClass="btn btn-warning" />
					    </div>
                    </div>
				</div>
			</div>
		</nav>   
		
			<div class="container">
				<div class="row">
                    <div class="col-md-8 col-md-offset-4"> 
                        <!--For Test Outside Tab Purpose-->
                    </div>
					<div class="col-md-4 col-lg-4">
                        <div class="img-responsive">
                            <asp:DataList ID="DataList_ProfilSpbe" runat="server" DataKeyField="id_vendor_spbe">
                                <ItemTemplate>
                                    <asp:Image ImageUrl='<%# Eval("imgpp_spbe") %>' runat="server" ID="ImagePP_Spbe" CssClass="img-thumbnail" />                                 
                                </ItemTemplate>
                            </asp:DataList>
                            <button id="Btn_EditPP_Spbe" runat="server" class="btn btn-primary btn-sm btn-xs ataspp" type="button" data-toggle="collapse" data-target="#collapsePPSpbe" aria-expanded="false" aria-controls="collapseExample"><i class="glyphicon glyphicon-pencil"></i></button>
                        </div>
                        <!--------button colapse edit pp----------->
                        <div class="collapse" id="collapsePPSpbe">
                            <div class="well">
                                <asp:FileUpload ID="UploadPP_Spbe" runat="server" />
                                <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png<br />Ukuran file maksimal 2 Megabyte</p>
                                <asp:LinkButton ID="SavePP_Spbe" CssClass="btn btn-success btn-sm" runat="server" Text="Simpan" OnClick="SavePP_Spbe_Click" />  
                            </div>
                        </div>
                        <!------------end of button colapse edit pp--------->
                    </div>
                    

                    <div class="col-md-8 col-lg-8">
                        <ul class="nav nav-tabs" id="myTab">
                            <li class="active"><a href="#profil" data-toggle="tab">Profil</a></li>
                            <li><a href="#sarfas" data-toggle="tab">Sarana & Fasilitas</a></li>
                            <li><a href="#dokumen" data-toggle="tab">Dokumen</a></li>
                            <li><a href="#histori" data-toggle="tab">Riwayat</a></li>
                            <li><a href="#galeri" data-toggle="tab">Galeri</a></li>
                        </ul>
                        
                        <div class="tab-content">

                            <!-----profile tab session here----------------------------------->
                            <div id="profil" class="tab-pane fade in active">
                                <div class="batas">         
                                    <asp:FormView ID="FormView_ProfilSpbe" runat="server" DataKeyNames="id_vendor_spbe" DataSourceID="SqlDataSource6">
                                        <EditItemTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-hover table-striped">
                                                    <asp:Label Visible="false" ID="id_vendor_spbeLabel1" runat="server" Text='<%# Eval("id_vendor_spbe") %>' /> 
                                                    <tr><td>Nomor Vendor</td><td>:</td><td><asp:TextBox ID="no_vendor_spbeTextBox" runat="server" Text='<%# Bind("no_vendor_spbe") %>' /></td></tr>
                                                    <tr><td>Kode</td><td>:</td><td><asp:TextBox ID="id_spbeTextBox" runat="server" Text='<%# Bind("id_spbe") %>' /></td></tr>
                                                    <tr><td>Tipe</td><td>:</td><td><asp:TextBox ID="tipe_spbeTextBox" runat="server" Text='<%# Bind("tipe_spbe") %>' /></td></tr>
                                                    <tr><td>Produk</td><td>:</td><td><asp:TextBox ID="produk_spbeTextBox" runat="server" Text='<%# Bind("produk_spbe") %>' /></td></tr>
                                                    <tr><td>Nama</td><td>:</td><td><asp:TextBox ID="nama_spbeTextBox" runat="server" Text='<%# Bind("nama_spbe") %>' /></td></tr>
                                                    <tr><td>Alamat Kantor</td><td>:</td><td><asp:TextBox ID="alamat1_spbeTextBox" runat="server" Text='<%# Bind("alamat1_spbe") %>' /></td></tr>
                                                    <tr><td>Alamat Plant</td><td>:</td><td><asp:TextBox ID="alamat2_spbeTextBox" runat="server" Text='<%# Bind("alamat2_spbe") %>' /></td></tr>
                                                    <tr><td>Kota</td><td>:</td><td><asp:TextBox ID="kota_spbeTextBox" runat="server" Text='<%# Bind("kota_spbe") %>' /></td></tr>
                                                    <tr><td>Provinsi</td><td>:</td><td><asp:TextBox ID="prov_spbeTextBox" runat="server" Text='<%# Bind("prov_spbe") %>' /></td></tr>
                                                    <tr><td>Rayon</td><td>:</td><td><asp:TextBox ID="rayon_spbeTextBox" runat="server" Text='<%# Bind("rayon_spbe") %>' /></td></tr>
                                                    <tr><td>Status</td><td>:</td><td><asp:TextBox ID="status_spbeTextBox" runat="server" Text='<%# Bind("status_spbe") %>' /></td></tr>
                                                    <tr><td>Jumlah Penyaluran Per Hari</td><td>:</td><td><asp:TextBox ID="jmlsalur_spbeTextBox" runat="server" Text='<%# Bind("jmlsalur_spbe") %>' /></td></tr>
                                                    <tr><td>Telepon/Fax</td><td>:</td><td><asp:TextBox ID="telp_spbeTextBox" runat="server" Text='<%# Bind("telp_spbe") %>' /></td></tr>
                                                    <tr><td>Email</td><td>:</td><td><asp:TextBox ID="email_spbeTextBox" runat="server" Text='<%# Bind("email_spbe") %>' /></td></tr>
                                                    <tr><td>Koordinat Lokasi</td><td>:</td><td><asp:TextBox ID="koor_spbeTextBox" runat="server" Text='<%# Bind("koor_spbe") %>' /></td></tr>                               
                                                </table>
                                            </div>
                                            <asp:LinkButton ID="Update_ProfilSpbe" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm" />
                                            <asp:LinkButton ID="UpdateCancel_ProfilSpbe" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm" />
                                        </EditItemTemplate>

                                        <ItemTemplate>
                                            <asp:Label Visible="false" ID="id_vendor_spbeLabel" runat="server" Text='<%# Eval("id_vendor_spbe") %>' />
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-striped">
                                                        <asp:Label Visible="false" ID="Label6" runat="server" Text='<%# Eval("id_vendor_spbe") %>' />
                                                        <tr><td>Nomor Vendor</td><td>:</td><td><asp:Label ID="no_vendor_spbeLabel" runat="server" Text='<%# Bind("no_vendor_spbe") %>' /></td></tr>
                                                        <tr><td>Kode</td><td>:</td><td><asp:Label ID="id_spbeLabel" runat="server" Text='<%# Bind("id_spbe") %>' /></td></tr>
                                                        <tr><td>Tipe</td><td>:</td><td><asp:Label ID="tipe_spbeLabel" runat="server" Text='<%# Bind("tipe_spbe") %>' /></td></tr>
                                                        <tr><td>Produk</td><td>:</td><td><asp:Label ID="produk_spbeLabel" runat="server" Text='<%# Bind("produk_spbe") %>' /></td></tr>
                                                        <tr><td>Nama</td><td>:</td><td><asp:Label ID="nama_spbeLabel" runat="server" Text='<%# Bind("nama_spbe") %>' /></td></tr>
                                                        <tr><td>Alamat Kantor</td><td>:</td><td><asp:Label ID="alamat1_spbeLabel" runat="server" Text='<%# Bind("alamat1_spbe") %>' /></td></tr>
                                                        <tr><td>Alamat Plant</td><td>:</td><td><asp:Label ID="alamat2_spbeLabel" runat="server" Text='<%# Bind("alamat2_spbe") %>' /></td></tr>
                                                        <tr><td>Kota</td><td>:</td><td><asp:Label ID="kota_spbeLabel" runat="server" Text='<%# Bind("kota_spbe") %>' /></td></tr>
                                                        <tr><td>Provinsi</td><td>:</td><td><asp:Label ID="prov_spbeLabel" runat="server" Text='<%# Bind("prov_spbe") %>' /></td></tr>
                                                        <tr><td>Rayon</td><td>:</td><td><asp:Label ID="rayon_spbeLabel" runat="server" Text='<%# Bind("rayon_spbe") %>' /></td></tr>
                                                        <tr><td>Status</td><td>:</td><td><asp:Label ID="status_spbeLabel" runat="server" Text='<%# Bind("status_spbe") %>' /></td></tr>
                                                        <tr><td>Jumlah Penyaluran Per hari</td><td>:</td><td><asp:Label ID="salur_spbeLabel" runat="server" Text='<%# Bind("jmlsalur_spbe") %>' /></td></tr>
                                                        <tr><td>Telepon/Fax</td><td>:</td><td><asp:Label ID="telp_spbeLabel" runat="server" Text='<%# Bind("telp_spbe") %>' /></td></tr>
                                                        <tr><td>Email</td><td>:</td><td><asp:Label ID="email_spbeLabel" runat="server" Text='<%# Bind("email_spbe") %>' /></td></tr>
                                                        <tr><td>Koordinat Lokasi</td><td>:</td><td><asp:Label ID="koor_spbeLabel" runat="server" Text='<%# Bind("koor_spbe") %>' /></td></tr>
                                                    </table>
                                                </div>                        
                                            <asp:LinkButton ID="Edit_ProfilSpbe" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah" CssClass="btn btn-info btn-sm" />                               
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                        DeleteCommand="DELETE FROM [spbe] WHERE [id_vendor_spbe] = @original_id_vendor_spbe AND (([no_vendor_spbe] = @original_no_vendor_spbe) OR ([no_vendor_spbe] IS NULL AND @original_no_vendor_spbe IS NULL)) AND (([id_spbe] = @original_id_spbe) OR ([id_spbe] IS NULL AND @original_id_spbe IS NULL)) AND (([tipe_spbe] = @original_tipe_spbe) OR ([tipe_spbe] IS NULL AND @original_tipe_spbe IS NULL)) AND (([produk_spbe] = @original_produk_spbe) OR ([produk_spbe] IS NULL AND @original_produk_spbe IS NULL)) AND (([nama_spbe] = @original_nama_spbe) OR ([nama_spbe] IS NULL AND @original_nama_spbe IS NULL)) AND (([alamat1_spbe] = @original_alamat1_spbe) OR ([alamat1_spbe] IS NULL AND @original_alamat1_spbe IS NULL)) AND (([alamat2_spbe] = @original_alamat2_spbe) OR ([alamat2_spbe] IS NULL AND @original_alamat2_spbe IS NULL)) AND (([kota_spbe] = @original_kota_spbe) OR ([kota_spbe] IS NULL AND @original_kota_spbe IS NULL)) AND (([prov_spbe] = @original_prov_spbe) OR ([prov_spbe] IS NULL AND @original_prov_spbe IS NULL)) AND (([rayon_spbe] = @original_rayon_spbe) OR ([rayon_spbe] IS NULL AND @original_rayon_spbe IS NULL)) AND (([status_spbe] = @original_status_spbe) OR ([status_spbe] IS NULL AND @original_status_spbe IS NULL)) AND (([email_spbe] = @original_email_spbe) OR ([email_spbe] IS NULL AND @original_email_spbe IS NULL)) AND (([telp_spbe] = @original_telp_spbe) OR ([telp_spbe] IS NULL AND @original_telp_spbe IS NULL)) AND (([koor_spbe] = @original_koor_spbe) OR ([koor_spbe] IS NULL AND @original_koor_spbe IS NULL)) AND (([jmlsalur_spbe] = @original_jmlsalur_spbe) OR ([jmlsalur_spbe] IS NULL AND @original_jmlsalur_spbe IS NULL))" 
                                        InsertCommand="INSERT INTO [spbe] ([no_vendor_spbe], [id_spbe], [tipe_spbe], [produk_spbe], [nama_spbe], [alamat1_spbe], [alamat2_spbe], [kota_spbe], [prov_spbe], [rayon_spbe], [status_spbe], [email_spbe], [telp_spbe], [koor_spbe], [jmlsalur_spbe]) VALUES (@no_vendor_spbe, @id_spbe, @tipe_spbe, @produk_spbe, @nama_spbe, @alamat1_spbe, @alamat2_spbe, @kota_spbe, @prov_spbe, @rayon_spbe, @status_spbe, @email_spbe, @telp_spbe, @koor_spbe, @jmlsalur_spbe)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT * FROM [spbe] WHERE [id_vendor_spbe] = @id_vendor_spbe" 
                                        UpdateCommand="UPDATE [spbe] SET [no_vendor_spbe] = @no_vendor_spbe, [id_spbe] = @id_spbe, [tipe_spbe] = @tipe_spbe, [produk_spbe] = @produk_spbe, [nama_spbe] = @nama_spbe, [alamat1_spbe] = @alamat1_spbe, [alamat2_spbe] = @alamat2_spbe, [kota_spbe] = @kota_spbe, [prov_spbe] = @prov_spbe, [rayon_spbe] = @rayon_spbe, [status_spbe] = @status_spbe, [email_spbe] = @email_spbe, [telp_spbe] = @telp_spbe, [koor_spbe] = @koor_spbe, [jmlsalur_spbe] = @jmlsalur_spbe WHERE [id_vendor_spbe] = @original_id_vendor_spbe AND (([no_vendor_spbe] = @original_no_vendor_spbe) OR ([no_vendor_spbe] IS NULL AND @original_no_vendor_spbe IS NULL)) AND (([id_spbe] = @original_id_spbe) OR ([id_spbe] IS NULL AND @original_id_spbe IS NULL)) AND (([tipe_spbe] = @original_tipe_spbe) OR ([tipe_spbe] IS NULL AND @original_tipe_spbe IS NULL)) AND (([produk_spbe] = @original_produk_spbe) OR ([produk_spbe] IS NULL AND @original_produk_spbe IS NULL)) AND (([nama_spbe] = @original_nama_spbe) OR ([nama_spbe] IS NULL AND @original_nama_spbe IS NULL)) AND (([alamat1_spbe] = @original_alamat1_spbe) OR ([alamat1_spbe] IS NULL AND @original_alamat1_spbe IS NULL)) AND (([alamat2_spbe] = @original_alamat2_spbe) OR ([alamat2_spbe] IS NULL AND @original_alamat2_spbe IS NULL)) AND (([kota_spbe] = @original_kota_spbe) OR ([kota_spbe] IS NULL AND @original_kota_spbe IS NULL)) AND (([prov_spbe] = @original_prov_spbe) OR ([prov_spbe] IS NULL AND @original_prov_spbe IS NULL)) AND (([rayon_spbe] = @original_rayon_spbe) OR ([rayon_spbe] IS NULL AND @original_rayon_spbe IS NULL)) AND (([status_spbe] = @original_status_spbe) OR ([status_spbe] IS NULL AND @original_status_spbe IS NULL)) AND (([email_spbe] = @original_email_spbe) OR ([email_spbe] IS NULL AND @original_email_spbe IS NULL)) AND (([telp_spbe] = @original_telp_spbe) OR ([telp_spbe] IS NULL AND @original_telp_spbe IS NULL)) AND (([koor_spbe] = @original_koor_spbe) OR ([koor_spbe] IS NULL AND @original_koor_spbe IS NULL)) AND (([jmlsalur_spbe] = @original_jmlsalur_spbe) OR ([jmlsalur_spbe] IS NULL AND @original_jmlsalur_spbe IS NULL))">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id_vendor_spbe" QueryStringField="spbe" Type="String" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_id_vendor_spbe" Type="Int32" />
                                            <asp:Parameter Name="original_no_vendor_spbe" Type="String" />
                                            <asp:Parameter Name="original_id_spbe" Type="String" />
                                            <asp:Parameter Name="original_tipe_spbe" Type="String" />
                                            <asp:Parameter Name="original_produk_spbe" Type="String" />
                                            <asp:Parameter Name="original_nama_spbe" Type="String" />
                                            <asp:Parameter Name="original_alamat1_spbe" Type="String" />
                                            <asp:Parameter Name="original_alamat2_spbe" Type="String" />
                                            <asp:Parameter Name="original_kota_spbe" Type="String" />
                                            <asp:Parameter Name="original_prov_spbe" Type="String" />
                                            <asp:Parameter Name="original_rayon_spbe" Type="String" />
                                            <asp:Parameter Name="original_status_spbe" Type="String" />
                                            <asp:Parameter Name="original_email_spbe" Type="String" />
                                            <asp:Parameter Name="original_telp_spbe" Type="String" />
                                            <asp:Parameter Name="original_koor_spbe" Type="String" />
                                            <asp:Parameter Name="original_jmlsalur_spbe" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="no_vendor_spbe" Type="String" />
                                            <asp:Parameter Name="id_spbe" Type="String" />
                                            <asp:Parameter Name="tipe_spbe" Type="String" />
                                            <asp:Parameter Name="produk_spbe" Type="String" />
                                            <asp:Parameter Name="nama_spbe" Type="String" />
                                            <asp:Parameter Name="alamat1_spbe" Type="String" />
                                            <asp:Parameter Name="alamat2_spbe" Type="String" />
                                            <asp:Parameter Name="kota_spbe" Type="String" />
                                            <asp:Parameter Name="prov_spbe" Type="String" />
                                            <asp:Parameter Name="rayon_spbe" Type="String" />
                                            <asp:Parameter Name="status_spbe" Type="String" />
                                            <asp:Parameter Name="email_spbe" Type="String" />
                                            <asp:Parameter Name="telp_spbe" Type="String" />
                                            <asp:Parameter Name="koor_spbe" Type="String" />
                                            <asp:Parameter Name="jmlsalur_spbe" Type="String" />
                                            <asp:Parameter Name="original_id_vendor_spbe" Type="Int32" />
                                            <asp:Parameter Name="original_no_vendor_spbe" Type="String" />
                                            <asp:Parameter Name="original_id_spbe" Type="String" />
                                            <asp:Parameter Name="original_tipe_spbe" Type="String" />
                                            <asp:Parameter Name="original_produk_spbe" Type="String" />
                                            <asp:Parameter Name="original_nama_spbe" Type="String" />
                                            <asp:Parameter Name="original_alamat1_spbe" Type="String" />
                                            <asp:Parameter Name="original_alamat2_spbe" Type="String" />
                                            <asp:Parameter Name="original_kota_spbe" Type="String" />
                                            <asp:Parameter Name="original_prov_spbe" Type="String" />
                                            <asp:Parameter Name="original_rayon_spbe" Type="String" />
                                            <asp:Parameter Name="original_status_spbe" Type="String" />
                                            <asp:Parameter Name="original_email_spbe" Type="String" />
                                            <asp:Parameter Name="original_telp_spbe" Type="String" />
                                            <asp:Parameter Name="original_koor_spbe" Type="String" />
                                            <asp:Parameter Name="original_jmlsalur_spbe" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                    
                                </div>
                            </div>
                            <!--profile tab session end here----------------------------------------------->
                            
                            <!--sarfas tab session here---------------------------------------->
                            <div class="tab-pane fade in" id="sarfas">
                                <div class="batas">
                                    <asp:FormView ID="FormView_SarfasSpbe" runat="server" DataKeyNames="id_vendor_spbe" DataSourceID="SqlDataSource1">
                                        <EditItemTemplate>
                                            <table class="table table-hover table-striped">
                                                <tr><td>Jumlah Tabung</td><td>:</td><td><asp:TextBox ID="jmltabung_spbeTextBox" runat="server" Text='<%# Bind("jmltabung_spbe") %>' /></td></tr>
                                                <tr><td>Jumlah Filling Machine</td><td>:</td><td><asp:TextBox ID="jmlfill_spbeTextBox" runat="server" Text='<%# Bind("jmlfill_spbe") %>' /></td></tr>
                                                <tr><td>Jumlah Truk Tangki</td><td>:</td><td><asp:TextBox ID="jmltruk_spbeTextBox" runat="server" Text='<%# Bind("jmltruk_spbe") %>' /></td></tr>
                                                <tr><td>Kapasitas Truk Tangki</td><td>:</td><td><asp:TextBox ID="kaptruk_spbeTextBox" runat="server" Text='<%# Bind("kaptruk_spbe") %>' /></td></tr>     
                                                <tr><td>Jumlah Tangki Timbun</td><td>:</td><td><asp:TextBox ID="jmltimbun_spbeTextBox" runat="server" Text='<%# Bind("jmltimbun_spbe") %>' /></td></tr>
                                                <tr><td>Kapasitas Tangki Timbun</td><td>:</td><td><asp:TextBox ID="kaptimbun_spbeTextBox" runat="server" Text='<%# Bind("kaptimbun_spbe") %>' /></td></tr>                                       
                                                <!--<tr>
                                                    <asp:Label ID="id_vendor_spbeLabel1" runat="server" Text='<%# Eval("id_vendor_spbe") %>' Visible="false" /></td>
                                                </tr>-->
                                            </table> 
                                            <asp:LinkButton ID="Update_SarfasSpbe" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm" />
                                            <asp:LinkButton ID="UpdateCancel_SarfasSpbe" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <table class="table table-hover table-striped">
                                                <tr><td>Jumlah Tabung</td><td>:</td><td><asp:Label ID="jmltabung_spbeLabel" runat="server" Text='<%# Bind("jmltabung_spbe") %>' /></td></tr>
                                                <tr><td>Jumlah Filling Machine</td><td>:</td><td><asp:Label ID="jmlfill_spbeLabel" runat="server" Text='<%# Bind("jmlfill_spbe") %>' /></td></tr>
                                                <tr><td>Jumlah Truk Tangki</td><td>:</td><td><asp:Label ID="jmltruk_spbeLabel" runat="server" Text='<%# Bind("jmltruk_spbe") %>' /></td></tr>
                                                <tr><td>Kapasitas Truk Tangki</td><td>:</td><td><asp:Label ID="kaptruk_spbeLabel" runat="server" Text='<%# Bind("kaptruk_spbe") %>' /></td></tr>
                                                <tr><td>Jumlah Tangki Timbun</td><td>:</td><td><asp:Label ID="jmltimbun_spbeLabel" runat="server" Text='<%# Bind("jmltimbun_spbe") %>' /></td></tr>
                                                <tr><td>Kapasitas Tangki Timbun</td><td>:</td><td><asp:Label ID="kaptimbun_spbeLabel" runat="server" Text='<%# Bind("kaptimbun_spbe") %>' /></td></tr>
                                                <!--<tr>
                                                    <td><asp:Label ID="id_vendor_spbeLabel" runat="server" Text='<%# Eval("id_vendor_spbe") %>' Visible="false" /></td>
                                                </tr>-->
                                            </table> 
                                            <asp:LinkButton ID="Edit_SarfasSpbe" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah" CssClass="btn btn-info btn-sm" />                 
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                        DeleteCommand="DELETE FROM [spbe] WHERE [id_vendor_spbe] = @original_id_vendor_spbe AND (([jmltabung_spbe] = @original_jmltabung_spbe) OR ([jmltabung_spbe] IS NULL AND @original_jmltabung_spbe IS NULL)) AND (([jmlfill_spbe] = @original_jmlfill_spbe) OR ([jmlfill_spbe] IS NULL AND @original_jmlfill_spbe IS NULL)) AND (([jmltruk_spbe] = @original_jmltruk_spbe) OR ([jmltruk_spbe] IS NULL AND @original_jmltruk_spbe IS NULL)) AND (([kaptruk_spbe] = @original_kaptruk_spbe) OR ([kaptruk_spbe] IS NULL AND @original_kaptruk_spbe IS NULL)) AND (([jmltimbun_spbe] = @original_jmltimbun_spbe) OR ([jmltimbun_spbe] IS NULL AND @original_jmltimbun_spbe IS NULL)) AND (([kaptimbun_spbe] = @original_kaptimbun_spbe) OR ([kaptimbun_spbe] IS NULL AND @original_kaptimbun_spbe IS NULL))" 
                                        InsertCommand="INSERT INTO [spbe] ([jmltabung_spbe], [jmlfill_spbe], [jmltruk_spbe], [kaptruk_spbe], [jmltimbun_spbe], [kaptimbun_spbe], [id_vendor_spbe]) VALUES (@jmltabung_spbe, @jmlfill_spbe, @jmltruk_spbe, @kaptruk_spbe, @jmltimbun_spbe, @kaptimbun_spbe, @id_vendor_spbe)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT [jmltabung_spbe], [jmlfill_spbe], [jmltruk_spbe], [kaptruk_spbe], [jmltimbun_spbe], [kaptimbun_spbe], [id_vendor_spbe] FROM [spbe] WHERE [id_vendor_spbe] = @id_vendor_spbe" 
                                        UpdateCommand="UPDATE [spbe] SET [jmltabung_spbe] = @jmltabung_spbe, [jmlfill_spbe] = @jmlfill_spbe, [jmltruk_spbe] = @jmltruk_spbe, [kaptruk_spbe] = @kaptruk_spbe, [jmltimbun_spbe] = @jmltimbun_spbe, [kaptimbun_spbe] = @kaptimbun_spbe WHERE [id_vendor_spbe] = @original_id_vendor_spbe AND (([jmltabung_spbe] = @original_jmltabung_spbe) OR ([jmltabung_spbe] IS NULL AND @original_jmltabung_spbe IS NULL)) AND (([jmlfill_spbe] = @original_jmlfill_spbe) OR ([jmlfill_spbe] IS NULL AND @original_jmlfill_spbe IS NULL)) AND (([jmltruk_spbe] = @original_jmltruk_spbe) OR ([jmltruk_spbe] IS NULL AND @original_jmltruk_spbe IS NULL)) AND (([kaptruk_spbe] = @original_kaptruk_spbe) OR ([kaptruk_spbe] IS NULL AND @original_kaptruk_spbe IS NULL)) AND (([jmltimbun_spbe] = @original_jmltimbun_spbe) OR ([jmltimbun_spbe] IS NULL AND @original_jmltimbun_spbe IS NULL)) AND (([kaptimbun_spbe] = @original_kaptimbun_spbe) OR ([kaptimbun_spbe] IS NULL AND @original_kaptimbun_spbe IS NULL))">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id_vendor_spbe" QueryStringField="spbe" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="jmltabung_spbe" Type="Int32" />
                                            <asp:Parameter Name="jmlfill_spbe" Type="Int32" />
                                            <asp:Parameter Name="jmltruk_spbe" Type="Int32" />
                                            <asp:Parameter Name="kaptruk_spbe" Type="String" />
                                            <asp:Parameter Name="jmltimbun_spbe" Type="Int32" />
                                            <asp:Parameter Name="kaptimbun_spbe" Type="String" />
                                            <asp:Parameter Name="original_id_vendor_spbe" Type="String" />
                                            <asp:Parameter Name="original_jmltabung_spbe" Type="Int32" />
                                            <asp:Parameter Name="original_jmlfill_spbe" Type="Int32" />
                                            <asp:Parameter Name="original_jmltruk_spbe" Type="Int32" />
                                            <asp:Parameter Name="original_kaptruk_spbe" Type="String" />
                                            <asp:Parameter Name="original_jmltimbun_spbe" Type="Int32" />
                                            <asp:Parameter Name="original_kaptimbun_spbe" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <!--sarfas tab session end here------------------------------------>                        

                            <!--dokumen tab session here------------------------------------------------->
                            <div class="tab-pane fade in" id="dokumen">
                                <div class="batas">
                                    <a href="#ModalAddDokSpbe" class="btn btn-sm btn-info mod" data-toggle="modal" id="addnewdoc" runat="server">Tambah Dokumen Baru</a>   
                                    <div class="table-responsive batas">
                                        <asp:GridView ID="GridView_DokSpbe" runat="server" AutoGenerateColumns="False" AllowPaging="true" DataKeyNames="id_dokumen_spbe" 
                                            OnPageIndexChanging="GridView_DokSpbe_PageIndexChanging"
                                            OnRowCancelingEdit="GridView_DokSpbe_RowCancelingEdit"
                                            OnRowEditing="GridView_DokSpbe_RowEditing"
                                            OnRowUpdating="GridView_DokSpbe_RowUpdating"
                                            OnRowDeleting="GridView_DokSpbe_RowDeleting"
                                            CssClass="table table-bordered table-hover table-striped">
                                            <PagerStyle CssClass="cssPager" HorizontalAlign="Center" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" PreviousPageText="<" NextPageText=">" FirstPageText="<<" LastPageText=">>" Position="Bottom" Visible="true" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="No. Dokumen" SortExpression="noreg_dokumen_spbe">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("noreg_dokumen_spbe") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_spbe">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("tipe_dokumen_spbe") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_spbe">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("pub_dokumen_spbe") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("pub_dokumen_spbe") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_spbe">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" data-provide="datepicker" data-date-format="mm/dd/yyyy" runat="server" Text='<%# Eval("date_dokumen_spbe") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("date_dokumen_spbe", "{0:d MMMM yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_spbe">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" data-provide="datepicker" data-date-format="mm/dd/yyyy" runat="server" Text='<%# Eval("exp_dokumen_spbe") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("exp_dokumen_spbe", "{0:d MMMM yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="false" HeaderText="Preview Dokumen" SortExpression="image_dokumen_spbe">
                                                    <EditItemTemplate>
                                                        <asp:Image ID="img_up" runat="server" ImageUrl='<%# Eval("image_dokumen_spbe") %>' Height="20px" Width="20px"></asp:Image>
                                                        <asp:FileUpload ID="FileUpload4" runat="server" />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <a href="#ShowDokSpbe" data-toggle="modal"><asp:ImageButton ID="ImgBtn_DokSpbe" runat="server" ImageUrl='<%# Eval("image_dokumen_spbe") %>'
                                                            CssClass="img-thumbnail" Height="30px" Width="30px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="downBtn" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandArgument='<%# Eval("image_dokumen_spbe") %>' OnClick="Down_Click"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ShowHeader="False">
                                                    <EditItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm"></asp:LinkButton>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm"></asp:LinkButton>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah" CssClass="btn btn-info btn-sm"></asp:LinkButton>                
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-danger btn-sm" CommandName="Delete" Text="X" OnClientClick="return confirm('Apakah anda yakin menghapus Dokumen SP(P)BE ini?');"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>                                   
                                            </Columns>
                                        </asp:GridView>
                                        
                                    </div>
                                </div>
                            </div>
                            <!--dokumen tab session end here------------------------------------>

                            <!--histori tab session here------------------------------------>
                            <div class="tab-pane fade in" id="histori">
                                <div class="batas">
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView_HistoriSpbe" AllowPaging="true" runat="server" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="id_histori_spbe" DataSourceID="SqlDataSource5" OnRowDataBound="GridView_HistoriSpbe_RowDataBound">
                                            <PagerStyle CssClass="cssPager" HorizontalAlign="Center" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" PreviousPageText="<" NextPageText=">" FirstPageText="<<" LastPageText=">>" Position="Bottom" Visible="true" />
                                            <Columns>
                                                <asp:BoundField Visible="false" DataField="id_histori_spbe" HeaderText="id_histori_spbe" InsertVisible="False" ReadOnly="True" SortExpression="id_histori_spbe" />
                                                <asp:BoundField Visible="false" DataField="id_dokumen_spbe" HeaderText="id_dokumen_spbe" SortExpression="id_dokumen_spbe" />
                                                <asp:BoundField Visible="false" DataField="id_vendor_spbe" HeaderText="id_vendor_spbe" SortExpression="id_vendor_spbe" />
                                                <asp:BoundField DataField="aksi_spbe" HeaderText="Aktivitas" SortExpression="aksi_spbe" />
                                                <asp:BoundField DataField="dateubah_histori_spbe" HeaderText="Tanggal Aktivitas" SortExpression="dateubah_histori_spbe" dataformatstring="{0:d MMMM yyyy}" />
                                                <asp:BoundField DataField="no_regdok_spbe" HeaderText="No. Dokumen" SortExpression="no_regdok_spbe" />
                                                <asp:BoundField DataField="dateawal_histori_spbe" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="dateawal_histori_spbe" dataformatstring="{0:d MMMM yyyy}"/>
                                                <asp:BoundField DataField="dateakhir_histori_spbe" HeaderText="Tanggal Dokumen Berakhir" SortExpression="dateakhir_histori_spbe" dataformatstring="{0:d MMMM yyyy}" />            
                                                <asp:BoundField DataField="tipedok_spbe" HeaderText="Jenis Dokumen" SortExpression="tipedok_spbe" />
                                                <asp:BoundField DataField="pubdok_spbe" HeaderText="Penerbit Dokumen" SortExpression="pubdok_spbe" />
                                                <asp:TemplateField HeaderText="Preview Dokumen" SortExpression="imgdok_spbe">
                                                    <ItemTemplate>
                                                        <a href="#ShowHistoriSpbe" data-toggle="modal"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("imgdok_spbe") %>'
                                                            CssClass="img-thumbnail" Height="20px" Width="20px" Style="cursor: pointer" OnClientClick="return LoadDiv1(this.src);" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="downBtnHis" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandArgument='<%# Eval("imgdok_spbe") %>' OnClick="DownHis_Click"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                        
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                            SelectCommand="SELECT * FROM [histori_spbe] WHERE [id_vendor_spbe] = @id_vendor_spbe ORDER BY [id_histori_spbe] DESC">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_vendor_spbe" QueryStringField="spbe" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                            <!--histori tab session end here------------------------------------>

                            <!--galeri tab session here------------------------------------>
                            <div class="tab-pane fade in" id="galeri">
                                <div class="batas">
                                    <button id="btnaddnewgal" runat="server" class="btn btn-success btn-sm" type="button" data-toggle="collapse" data-target="#collapseGal" aria-expanded="false" aria-controls="collapseExample">Tambah Gambar Baru</button>
                                    <div class="collapse" id="collapseGal">
                                        <div class="well">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="FileUpload_galeri">Upload Foto Galeri</label>
                                                    <asp:FileUpload ID="FileUpload_galeri" runat="server" />
                                                </div>
                                                <div class="col-md-2 col-md-offset-4"><asp:LinkButton ID="Save_GalSpbe" runat="server" Text="Simpan" OnClick="Save_GalSpbe_Click" CssClass="btn btn-success" /></div> 
                                                <div class="col-md-12">
                                                    <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png, .bmp, .gif<br />Ukuran file maksimal 2 Megabyte</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="batas">
                                        <div class="img-responsive">
                                            <asp:DataList ID="DataList_GalSpbe" OnItemDataBound="DataList_GalSpbe_ItemDataBound" runat="server" DataKeyField="idimg_spbe" OnDeleteCommand="DataList_GalSpbe_DeleteCommand" DataSourceID="SqlDataSource2" RepeatColumns="3" CellPadding="3" ShowFooter="False" ShowHeader="False">
                                                <EditItemStyle BackColor="Fuchsia" Font-Bold="True" Font-Italic="False" Font-Names="Algerian" Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="Aqua" HorizontalAlign="Left" VerticalAlign="Top" />
                                                <ItemTemplate>
                                                    <a href="#ShowGalSpbe" data-toggle="modal"><asp:ImageButton ImageUrl='<%# Eval("img_spbe") %>' runat="server" ID="img1" CssClass="img-thumbnail" Width="300px" Height="250px" Style="cursor: pointer" OnClientClick="return LoadGal(this.src);" /></a><br />
                                                    <asp:LinkButton ID="DltBtn" CssClass="btn btn-danger btn-xs atas" runat="server" CommandName="delete" Text="X"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>
                        
                                        </div>
                                    </div>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:PlantCS %>' DeleteCommand="DELETE FROM [image_spbe] WHERE [idimg_spbe] = @original_idimg_spbe AND (([id_vendor_spbe] = @original_id_vendor_spbe) OR ([id_vendor_spbe] IS NULL AND @original_id_vendor_spbe IS NULL)) AND (([img_spbe] = @original_img_spbe) OR ([img_spbe] IS NULL AND @original_img_spbe IS NULL))" InsertCommand="INSERT INTO [image_spbe] ([id_vendor_spbe], [img_spbe]) VALUES (@id_vendor_spbe, @img_spbe)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [image_spbe] WHERE ([id_vendor_spbe] = @id_vendor_spbe)" UpdateCommand="UPDATE [image_spbe] SET [id_vendor_spbe] = @id_vendor_spbe, [img_spbe] = @img_spbe WHERE [idimg_spbe] = @original_idimg_spbe AND (([id_vendor_spbe] = @original_id_vendor_spbe) OR ([id_vendor_spbe] IS NULL AND @original_id_vendor_spbe IS NULL)) AND (([img_spbe] = @original_img_spbe) OR ([img_spbe] IS NULL AND @original_img_spbe IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_idimg_spbe" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_id_vendor_spbe" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_img_spbe" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="id_vendor_spbe" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="img_spbe" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="spbe" Name="id_vendor_spbe" Type="Int32"></asp:QueryStringParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="id_vendor_spbe" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="img_spbe" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_idimg_spbe" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_id_vendor_spbe" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_img_spbe" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    
                                </div>
                            </div>    
                            <!--galeri tab session end here------------------------------------>
                                             
					    </div>	
     
				    </div>
                    <asp:HiddenField ID="TabName" runat="server" />
                    <div class="batas">
                        <a href="Spbe.aspx" class="btn btn-default btn-sm pull-right">Kembali Ke Daftar SP(P)BE</a> 
                    </div>
			    </div>
		    </div>

        <!-- Modal tambah dokumen-->
        <div id="ModalAddDokSpbe" class="modal fade bs-example-modal-lg">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Tambah Dokumen Baru</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="Txt_nodok_spbe">Nomor Dokumen</label>
					                    <asp:TextBox ID="Txt_nodok_spbe" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_tipedok_spbe">Jenis Dokumen</label>
					                    <asp:TextBox ID="Txt_tipedok_spbe" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jenis Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_pubdoc_spbe">Penerbit Dokumen</label>
					                    <asp:TextBox ID="Txt_pubdoc_spbe" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Penerbit Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_remdoc_spbe">Waktu Reminder (Hari)</label>
					                    <asp:TextBox ID="Txt_remdoc_spbe" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Waktu Reminder Dokumen Dalam Hari"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="Txt_datedoc_spbe">Tanggal Dokumen Diterbitkan</label>
					                    <asp:TextBox ID="Txt_datedoc_spbe" required data-provide="datepicker" data-date-format="dd-mm-yyyy" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Tanggal Dokumen Diterbitkan"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="Txt_expdoc_spbe">Tanggal Dokumen Berakhir</label>
					                    <asp:TextBox ID="Txt_expdoc_spbe" required data-provide="datepicker" data-date-format="dd-mm-yyyy" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Tanggal Dokumen Berakhir"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-10 col-md-offset-1">
                                    <label for="FileUpload_dokspbe">Upload File Dokumen</label>
                                    <asp:FileUpload ID="FileUpload_dokspbe" runat="server" />
                                    <p class="help-block" style="font-size: 12px">Semua format file dokumen dapat disimpan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                        <asp:Button ID="Btn_savedok_spbe" CssClass="btn btn-success"  runat="server" Text="Simpan" OnClick="Btn_savedok_spbe_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!--modal tambah dokumen session end here-->
		
        <!-- Modal lihat gambar dokumen-->
        <div id="ShowDokSpbe" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">                
                    <div class="modal-body">
                        <div class="container-fluid">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <div class="row">
                                <div class="col-md-12">
                                    <img id="imgFull" alt="" src="" class="img-responsive img-thumbnail" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--modal lihat gambar dokumen session end here-->
        
        <!-- Modal lihat galeri-->
        <div id="ShowGalSpbe" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">                
                    <div class="modal-body">
                        <div class="container-fluid">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <div class="row">
                                <div class="col-md-12">
                                    <img id="imgGal" alt="" src="" class="img-responsive img-thumbnail" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--modal lihat galeri session end here-->
    
        <!-- Modal lihat gambar histori-->
        <div id="ShowHistoriSpbe" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">                
                    <div class="modal-body">
                        <div class="container-fluid">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <div class="row">
                                <div class="col-md-12">
                                    <img id="imgFull1" alt="" src="" class="img-responsive img-thumbnail" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--modal lihat gambar histori session end here-->

		<hr />

		<div class="container">
			<footer class="copyright">
				Hak Cipta &copy; Pertamina 2015
			</footer>
		</div>
		
    </form>
</body>
</html>
