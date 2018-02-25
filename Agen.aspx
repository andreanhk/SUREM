<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Agen.aspx.cs" Inherits="Agen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Daftar Agen - Domestic Gas Region V</title>

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
						<li class="active"><a href="Agen.aspx"><i class="glyphicon glyphicon-user"></i> Agen</a></li>
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
		    <h1 class="near">Daftar Agen</h1>
			<h1><small>Domestic Gas Region V</small></h1>    
		</div>

			<div class="container">
				<div class="row">
                    <div class="col-md-1 col-md-offset-1">
                        <a href="#ModalAddAgen" class="btn btn-sm btn-success mod" data-toggle="modal" id="addagen" runat="server">Tambah Agen Baru</a>
                    </div>

					<div class="col-md-10 col-lg-10 col-md-offset-1 batas">
						<div class="table-responsive">
						    <asp:GridView ID="GridView_Agen" runat="server" AutoGenerateColumns="False" DataKeyNames="id_vendor_agen" 
                                CssClass="table table-bordered table-hover" OnRowDeleting="GridView_Agen_RowDeleting" OnSelectedIndexChanged="GridView_Agen_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField Visible="false" DataField="no_vendor_agen" HeaderText="No. Vendor" ReadOnly="True" SortExpression="id_vendor_agen" />
                                    <asp:BoundField DataField="soldto_agen" HeaderText="Sold To" SortExpression="soldto_agen" />
                                    <asp:BoundField DataField="nama_agen" HeaderText="Nama" SortExpression="nama_agen" />
                                    <asp:BoundField DataField="produk_agen" HeaderText="Produk" SortExpression="produk_agen" />
                                    <asp:BoundField DataField="kota_agen" HeaderText="Kota" SortExpression="kota_agen" />
                                    <asp:BoundField DataField="rayon_agen" HeaderText="Rayon" SortExpression="rayon_agen" />
                                    <asp:BoundField DataField="jmlpangkal_agen" HeaderText="Jumlah Pangkalan" SortExpression="jmlpangkal_agen" />
                                    <asp:BoundField DataField="jmlsalur_agen" HeaderText="Jumlah Penyaluran" SortExpression="jmlsalur_agen" /> 
                                    <asp:CommandField ShowSelectButton="true" SelectText="Profil" ControlStyle-CssClass="btn btn-info btn-sm" >
                                        <ControlStyle CssClass="btn btn-info btn-sm"></ControlStyle>
                                    </asp:CommandField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Del_Agen" runat="server" CausesValidation="False" CommandName="Delete" Text="X"
                                                OnClientClick="return confirm('Apakah anda yakin menghapus Agen ini?');"></asp:LinkButton>
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
		

        <!-- Modal tambah agen baru-->
        <div id="ModalAddAgen" class="modal fade bs-example-modal-lg">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Tambah Agen Baru</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="TextBox_vendor_agen">Nomor Vendor</label>
					                    <asp:TextBox ID="TextBox_vendor_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Vendor Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kode_agen">Sold To</label>
					                    <asp:TextBox ID="TextBox_kode_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kode Sold To Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_tipe_agen">Ship To</label>
					                    <asp:TextBox ID="TextBox_tipe_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kode Ship To Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_produk_agen">Produk</label>
					                    <asp:TextBox ID="TextBox_produk_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Produk Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_nama_agen">Nama</label>
					                    <asp:TextBox ID="TextBox_nama_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nama Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_alamat1_agen">Alamat Kantor</label>
					                    <asp:TextBox ID="TextBox_alamat1_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Kantor Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_alamat2_agen">Alamat Gudang</label>
					                    <asp:TextBox ID="TextBox_alamat2_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Gudang Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kota_agen">Kota</label>
					                    <asp:TextBox ID="TextBox_kota_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kota Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_provinsi_agen">Provinsi</label>
					                    <asp:TextBox ID="TextBox_provinsi_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Provinsi Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_rayon_agen">Rayon</label>
					                    <asp:TextBox ID="TextBox_rayon_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Rayon Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_status_agen">Status</label>
					                    <asp:TextBox ID="TextBox_status_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Status Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_email_agen">Email</label>
					                    <asp:TextBox ID="TextBox_email_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Alamat Email Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_telp_agen">Nomor Telepon/Fax</label>
					                    <asp:TextBox ID="TextBox_telp_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Telepon/Fax Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_koor_agen">Koordinat Lokasi</label>
					                    <asp:TextBox ID="TextBox_koor_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Koordinat Lokasi Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmltruk_agen">Jumlah Truk (Unit)</label>
					                    <asp:TextBox ID="TextBox_jmltruk_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Truk Yang Dimiliki Oleh Agen Dalam Satuan Unit" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kaptruk_agen">Kapasitas Truk (Unit x mt/metric ton)</label>
					                    <asp:TextBox ID="TextBox_kaptruk_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Detail Jumlah Truk Yang Dimiliki Oleh Agen (ex: 2x10 mt, 2x20 mt, ...)" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_kapgdg_agen">Kapasitas Gudang (mt/metric ton)</label>
					                    <asp:TextBox ID="TextBox_kapgdg_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Kapasitas Gudang Yang Dimiliki Oleh Agen" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmlpangkal_agen">Jumlah Pangkalan (Unit)</label>
					                    <asp:TextBox ID="TextBox_jmlpangkal_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Pangkalan Yang Dimiliki Oleh Agen Dalam Satuan Unit" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmlsalur_agen">Jumlah Penyaluran Per Hari (mt/metric ton)</label>
					                    <asp:TextBox ID="TextBox_jmlsalur_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah Penyaluran Per Hari Yang Dilakukan Oleh Agen Dalam Satuan mt/metric ton" required></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="TextBox_jmltabung_agen">Jumlah Tabung (Pcs)</label>
					                    <asp:TextBox ID="TextBox_jmltabung_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jumlah tabung Yang Dimiliki Oleh Agen Dalam Satuan Pcs" required></asp:TextBox>
                                    </div>

                                    <label for="UploadPP_Agen">Upload Foto Profil</label>
                                    <asp:FileUpload ID="UploadPP_Agen" runat="server" />
                                    <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png, .bmp, .gif<br />Ukuran file maksimal 2 Megabyte</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Batal</button>
                        <asp:Button ID="Save_Agen" CssClass="btn btn-success btn-sm" runat="server" Text="Simpan" OnClick="Save_Agen_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!--modal tambah agen baru session end here-->

    </form>
</body>
</html>


