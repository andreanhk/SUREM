<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Spbe.aspx.cs" Inherits="SPBE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Daftar SP(P)BE - Domestic Gas Region V</title>

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
		    <h1 class="near">Daftar SP(P)BE</h1>
			<h1><small>Domestic Gas Region V</small></h1>    
        </div>

			<div class="container">
				<div class="row">
                    <div class="col-md-1 col-md-offset-1">
                        <a href="#ModalAddSpbe" class="btn btn-sm btn-success mod" data-toggle="modal" id="addspbe" runat="server">Tambah SP(P)BE Baru</a>
                    </div>

					<div class="col-md-10 col-lg-10 col-md-offset-1 batas">
						<div class="table-responsive">
						    <asp:GridView ID="GridView_Spbe" runat="server" AutoGenerateColumns="False" DataKeyNames="id_vendor_spbe" 
                                CssClass="table table-bordered table-hover" OnRowDeleting="GridView_Spbe_RowDeleting" OnSelectedIndexChanged="GridView_Spbe_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField Visible="false" DataField="no_vendor_spbe" HeaderText="No. Vendor" ReadOnly="True" SortExpression="id_vendor_spbe" />
                                    <asp:BoundField DataField="id_spbe" HeaderText="Kode Plant" SortExpression="id_spbe" />
                                    <asp:BoundField DataField="tipe_spbe" HeaderText="Tipe" SortExpression="tipe_spbe" />
                                    <asp:BoundField DataField="nama_spbe" HeaderText="Nama" SortExpression="nama_spbe" />
                                    <asp:BoundField DataField="produk_spbe" HeaderText="Produk" SortExpression="produk_spbe" />
                                    <asp:BoundField DataField="kota_spbe" HeaderText="Kota" SortExpression="kota_spbe" />
                                    <asp:BoundField DataField="rayon_spbe" HeaderText="Rayon" SortExpression="rayon_spbe" />
                                    <asp:BoundField DataField="jmlsalur_spbe" HeaderText="Jumlah Penyaluran" SortExpression="jmlsalur_spbe" />  
                                    <asp:CommandField ShowSelectButton="true" SelectText="Profil" ControlStyle-CssClass="btn btn-info btn-sm" >
                                        <ControlStyle CssClass="btn btn-info btn-sm"></ControlStyle>
                                    </asp:CommandField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Del_Spbe" runat="server" CausesValidation="False" CommandName="Delete" Text="X"
                                                OnClientClick="return confirm('Apakah anda yakin menghapus SP(P)BE ini?');"></asp:LinkButton>
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
		

        <!-- Modal tambah spbe baru-->
        <div id="ModalAddSpbe" class="modal fade bs-example-modal-lg">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Tambah SP(P)BE Baru</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="TextBox_vendor_spbe">Nomor Vendor</label>
					                    <asp:TextBox ID="TextBox_vendor_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Vendor SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kode_spbe">Kode Plant</label>
					                    <asp:TextBox ID="TextBox_kode_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kode Plant SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_tipe_spbe">Tipe</label>
					                    <asp:TextBox ID="TextBox_tipe_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Tipe SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_produk_spbe">Produk</label>
					                    <asp:TextBox ID="TextBox_produk_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Produk SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_nama_spbe">Nama</label>
					                    <asp:TextBox ID="TextBox_nama_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nama SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_alamat1_spbe">Alamat Kantor</label>
					                    <asp:TextBox ID="TextBox_alamat1_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Kantor SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_alamat2_spbe">Alamat Plant</label>
					                    <asp:TextBox ID="TextBox_alamat2_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Plant SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kota_spbe">Kota</label>
					                    <asp:TextBox ID="TextBox_kota_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kota SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_provinsi_spbe">Provinsi</label>
					                    <asp:TextBox ID="TextBox_provinsi_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Provinsi SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_rayon_spbe">Rayon</label>
					                    <asp:TextBox ID="TextBox_rayon_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Rayon SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_status_spbe">Status</label>
					                    <asp:TextBox ID="TextBox_status_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Status SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_email_spbe">Email</label>
					                    <asp:TextBox ID="TextBox_email_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Email SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_telp_spbe">Nomor Telepon/Fax</label>
					                    <asp:TextBox ID="TextBox_telp_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Telepon/Fax SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_koor_spbe">Koordinat Lokasi</label>
					                    <asp:TextBox ID="TextBox_koor_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Koordinat Lokasi SP(P)BE" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmlsalur_spbe">Jumlah Penyaluran Per Hari (mt/metric ton)</label>
					                    <asp:TextBox ID="TextBox_jmlsalur_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Penyaluran Per Hari Yang Dilakukan Oleh SP(P)BE Dalam Satuan Metric ton/mt" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmltruk_spbe">Jumlah Truk Tangki (unit)</label>
					                    <asp:TextBox ID="TextBox_jmltruk_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Truk Tangki Yang Dimiliki Oleh SP(P)BE Dalam Satuan Unit" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptruk_spbe">Kapasitas Truk Tangki (Unit x mt/metric ton)</label>
					                    <asp:TextBox ID="TextBox_kaptruk_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Detail Jumlah Truk Tangki yang Dimiliki Oleh SP(P)BE (ex: 2x10 mt, 2x20 mt, ...)" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmlfill_spbe">Jumlah Filling Machine (Unit)</label>
					                    <asp:TextBox ID="TextBox_jmlfill_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Filling Machine Yang Dimiliki Oleh SP(P)BE Dalam Satuan Unit" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmltruk_spbe">Jumlah Tangki Timbun (Unit)</label>
					                    <asp:TextBox ID="TextBox_jmltimbun_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Tangki Timbun Yang Dimiliki Oleh SP(P)BE Dalam Satuan Unit" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptimbun_spbe">Kapasitas Tangki Timbun (Unit x mt/metric ton)</label>
					                    <asp:TextBox ID="TextBox_kaptimbun_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Detail Jumlah Tangki Timbun Yang Dimiliki Oleh SP(P)BE (ex: 2x10 mt, 2x20 mt, ...)" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmltabung_spbe">Jumlah Tabung (Pcs)</label>
					                    <asp:TextBox ID="TextBox_jmltabung_spbe" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah tabung yang Dimiliki Oleh SP(P)BE Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <label for="UploadPP_Spbe">Upload Foto Profil</label>
                                    <asp:FileUpload ID="UploadPP_Spbe" runat="server" />
                                    <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png, .bmp, .gif<br />Ukuran file maksimal 2 Megabyte</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Batal</button>
                        <asp:Button ID="Save_Spbe" CssClass="btn btn-success btn-sm"  runat="server" Text="Simpan" OnClick="Save_Spbe_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!--modal tambah spbe baru session end here-->

    </form>
</body>
</html>

