<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bengkel.aspx.cs" Inherits="Bengkel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title> Daftar Bengkel Perbaikan Tabung - Domestic Gas Region V</title>

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
						<li><a href="Spbe.aspx"><i class="glyphicon glyphicon-home"></i> SP(P)BE</a></li>
						<li><a href="Agen.aspx"><i class="glyphicon glyphicon-user"></i> Agen</a></li>
						<li class="active"><a href="Bengkel.aspx"><i class="glyphicon glyphicon-wrench"></i> Bengkel Tabung</a></li>
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
			<h1 class="near">Daftar Bengkel Perbaikan Tabung</h1>
			<h1><small>Domestic Gas Region V</small></h1>    
		</div>

			<div class="container">
				<div class="row">
                    <div class="col-md-1 col-md-offset-1">
                        <a href="#ModalAddBkl" class="btn btn-sm btn-success mod" data-toggle="modal" id="addbkl" runat="server">Tambah Bengkel Perbaikan Tabung Baru</a>
                    </div>

					<div class="col-md-10 col-lg-10 col-md-offset-1 batas">
						<div class="table-responsive">
						    <asp:GridView ID="GridView_Bkl" runat="server" AutoGenerateColumns="False" DataKeyNames="id_vendor_bkl" 
                                CssClass="table table-bordered table-hover" OnRowDeleting="GridView_Bkl_RowDeleting" OnSelectedIndexChanged="GridView_Bkl_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="no_vendor_bkl" HeaderText="No. Vendor" ReadOnly="True" SortExpression="id_vendor_bkl" />
                                    <asp:BoundField DataField="nama_bkl" HeaderText="Nama" SortExpression="nama_bkl" />
                                    <asp:BoundField DataField="produk_bkl" HeaderText="Produk" SortExpression="produk_bkl" />
                                    <asp:BoundField DataField="kota_bkl" HeaderText="Kota" SortExpression="kota_bkl" />
                                    <asp:BoundField DataField="rayon_bkl" HeaderText="Rayon" SortExpression="rayon_bkl" /> 
                                    <asp:BoundField DataField="total_bkl" HeaderText="Kemampuan Perbaikan Per bulan" SortExpression="total_bkl" /> 
                                    <asp:CommandField ShowSelectButton="true" SelectText="Profil" ControlStyle-CssClass="btn btn-info btn-sm" >
                                        <ControlStyle CssClass="btn btn-info btn-sm"></ControlStyle>
                                    </asp:CommandField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Del_Bkl" runat="server" CausesValidation="False" CommandName="Delete" Text="X"
                                                OnClientClick="return confirm('Apakah anda yakin menghapus Bengkel ini?');"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="btn btn-danger btn-sm" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
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
		

        <!-- Modal tambah bkl baru-->
        <div id="ModalAddBkl" class="modal fade bs-example-modal-lg">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Tambah Bengkel Perbaikan Tabung Baru</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="TextBox_vendor_bkl">Nomor Vendor</label>
					                    <asp:TextBox ID="TextBox_vendor_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Vendor Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_anneal_bkl">Kemampuan Annealing</label>
					                    <asp:TextBox ID="TextBox_anneal_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Apakah Bengkel Perbaikan Tabung Memiliki Kemampuan Annealing" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_produk_bkl">Produk</label>
					                    <asp:TextBox ID="TextBox_produk_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Produk Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_nama_bkl">Nama</label>
					                    <asp:TextBox ID="TextBox_nama_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nama Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_alamat1_bkl">Alamat Kantor</label>
					                    <asp:TextBox ID="TextBox_alamat1_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Kantor Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_alamat2_bkl">Alamat Bengkel Perbaikan Tabung</label>
					                    <asp:TextBox ID="TextBox_alamat2_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kota_bkl">Kota</label>
					                    <asp:TextBox ID="TextBox_kota_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kota Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_provinsi_bkl">Provinsi</label>
					                    <asp:TextBox ID="TextBox_provinsi_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Provinsi Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_rayon_bkl">Rayon</label>
					                    <asp:TextBox ID="TextBox_rayon_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Rayon Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_status_bkl">Status</label>
					                    <asp:TextBox ID="TextBox_status_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Status Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_email_bkl">Email</label>
					                    <asp:TextBox ID="TextBox_email_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Email Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_telp_bkl">Nomor Telepon/Fax</label>
					                    <asp:TextBox ID="TextBox_telp_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Telepon/Fax Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_koor_bkl">Koordinat Lokasi</label>
					                    <asp:TextBox ID="TextBox_koor_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan koordinat Lokasi Bengkel Perbaikan Tabung" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmltruk_bkl">Jumlah Truk (Unit)</label>
					                    <asp:TextBox ID="TextBox_jmltruk_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Truk Yang Dimiliki Oleh Bengkel Perbaikan Tabung Dalam Satuan Unit" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptruk_bkl">Kapasitas Truk (Unit x mt/metric ton)</label>
					                    <asp:TextBox ID="TextBox_kaptruk_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Detail Jumlah Truk Yang Dimiliki Oleh Bengkel Perbaikan Tabung (ex: 2x10 mt, 2x20 mt, ...)" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmltabung_bkl">Jumlah Tabung (Pcs)</label>
					                    <asp:TextBox ID="TextBox_jmltabung_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Tabung Yang Dimiliki Oleh Bengkel Perbaikan Tabung Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_total_bkl">Kapasitas Total Perbaikan Tabung Per Bulan (Pcs)</label>
					                    <asp:TextBox ID="TextBox_total_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kapasitas Total Perbaikan Tabung Yang Dapat Dilakukan Per Bulan Oleh Bengkel Perbaikan Tabung Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptruk_bkl">Kapasitas Retest Tabung Per Bulan</label>
					                    <asp:TextBox ID="TextBox_retest_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kapasitas Retest Tabung Yang Dapat Dilakukan Per Bulan Oleh Bengkel Perbaikan Tabung Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptruk_bkl">Kapasitas Repaint Tabung Per Bulan</label>
					                    <asp:TextBox ID="TextBox_repaint_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kapasitas Repaint Tabung Yang Dapat Dilakukan Per Bulan Oleh Bengkel Perbaikan Tabung Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptruk_bkl">Kapasitas Retest & Repaint Tabung Per Bulan</label>
					                    <asp:TextBox ID="TextBox_rtp_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kapasitas Retest & Repaint Tabung Yang Dapat Dilakukan Per Bulan Oleh Bengkel Perbaikan Tabung Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptruk_bkl">Kapasitas Repair Tabung Per Bulan</label>
					                    <asp:TextBox ID="TextBox_repair_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kapasitas Repair Tabung Yang Dapat Dilakukan Per Bulan Oleh Bengkel Perbaikan Tabung Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <label for="UploadPP_Bkl">Upload Foto Profil</label>
                                    <asp:FileUpload ID="UploadPP_Bkl" runat="server" />
                                    <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png, .bmp, .gif<br />Ukuran file maksimal 2 Megabyte</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Batal</button>
                        <asp:Button ID="Save_Bkl" CssClass="btn btn-success btn-sm"  runat="server" Text="Simpan" OnClick="Save_Bkl_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!--modal tambah bkl baru session end here-->

    </form>
</body>
</html>

