<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profil_Agen.aspx.cs" Inherits="Profil_agen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Profil Agen - Domestic Gas Region V</title>

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
				<div class="row">
                    <div class="col-md-8 col-md-offset-4"> 
                        <!--For Test Outside Tab Purpose-->
                    </div>
					<div class="col-md-4 col-lg-4">
                        <asp:DataList ID="DataList_ProfilAgen" runat="server" DataKeyField="id_vendor_agen">
                            <ItemTemplate>
                                <asp:Image ImageUrl='<%# Eval("imgpp_agen") %>' runat="server" ID="img_agenLabel" CssClass="img-responsive img-thumbnail" />                                 
                            </ItemTemplate>
                        </asp:DataList>
                        <button id="Btn_EditPP_Spbe" runat="server" class="btn btn-primary btn-sm btn-xs ataspp" type="button" data-toggle="collapse" data-target="#collapsePPAgen" aria-expanded="false" aria-controls="collapseExample"><i class="glyphicon glyphicon-pencil"></i></button>
                        <!--------button colapse edit pp----------->
                        <div class="collapse" id="collapsePPAgen">
                            <div class="well">
                                <asp:FileUpload ID="UploadPP_Agen" runat="server" />
                                <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png<br />Ukuran file maksimal 2 Megabyte</p>
                                <asp:LinkButton ID="SavePP_Agen" CssClass="btn btn-success btn-sm" runat="server" Text="Simpan" OnClick="SavePP_Agen_Click" />  
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
                                    <asp:FormView ID="FormView_ProfilAgen" runat="server" DataKeyNames="id_vendor_agen" DataSourceID="SqlDataSource6">
                                        <EditItemTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-hover table-striped">
                                                    <asp:Label Visible="false" ID="id_vendor_agenLabel1" runat="server" Text='<%# Eval("id_vendor_agen") %>' /> 
                                                    <tr><td>Nomor Vendor</td><td>:</td><td><asp:TextBox ID="no_vendor_agenTextBox" runat="server" Text='<%# Bind("no_vendor_agen") %>' /></td></tr>
                                                    <tr><td>Sold To</td><td>:</td><td><asp:TextBox ID="soldto_agenTextBox" runat="server" Text='<%# Bind("soldto_agen") %>' /></td></tr>
                                                    <tr><td>Ship To</td><td>:</td><td><asp:TextBox ID="shipto_agenTextBox" runat="server" Text='<%# Bind("shipto_agen") %>' /></td></tr>
                                                    <tr><td>Nama</td><td>:</td><td><asp:TextBox ID="nama_agenTextBox" runat="server" Text='<%# Bind("nama_agen") %>' /></td></tr>
                                                    <tr><td>Alamat Kantor</td><td>:</td><td><asp:TextBox ID="alamat1_agenTextBox" runat="server" Text='<%# Bind("alamat1_agen") %>' /></td></tr>
                                                    <tr><td>Alamat Gudang</td><td>:</td><td><asp:TextBox ID="alamat2_agenTextBox" runat="server" Text='<%# Bind("alamat2_agen") %>' /></td></tr>
                                                    <tr><td>Kota Plant</td><td>:</td><td><asp:TextBox ID="kota_agenTextBox" runat="server" Text='<%# Bind("kota_agen") %>' /></td></tr>
                                                    <tr><td>Provinsi</td><td>:</td><td><asp:TextBox ID="prov_agenTextBox" runat="server" Text='<%# Bind("provinsi_agen") %>' /></td></tr>
                                                    <tr><td>Rayon</td><td>:</td><td><asp:TextBox ID="rayon_agenTextBox" runat="server" Text='<%# Bind("rayon_agen") %>' /></td></tr>
                                                    <tr><td>Status</td><td>:</td><td><asp:TextBox ID="status_agenTextBox" runat="server" Text='<%# Bind("status_agen") %>' /></td></tr>
                                                    <tr><td>Jumlah Pangkalan</td><td>:</td><td><asp:TextBox ID="jmlpangkal_agenTextBox" runat="server" Text='<%# Bind("jmlpangkal_agen") %>' /></td></tr>
                                                    <tr><td>Jumlah Penyaluran Per Hari</td><td>:</td><td><asp:TextBox ID="jmlsalur_agenTextBox" runat="server" Text='<%# Bind("jmlsalur_agen") %>' /></td></tr>
                                                    <tr><td>Telepon/Fax</td><td>:</td><td><asp:TextBox ID="telp_agenTextBox" runat="server" Text='<%# Bind("telp_agen") %>' /></td></tr>
                                                    <tr><td>Email</td><td>:</td><td><asp:TextBox ID="email_agenTextBox" runat="server" Text='<%# Bind("email_agen") %>' /></td></tr>
                                                    <tr><td>Koordinat Lokasi</td><td>:</td><td><asp:TextBox ID="koor_agenTextBox" runat="server" Text='<%# Bind("koor_agen") %>' /></td></tr>                               
                                                </table>
                                            </div>
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm" />
                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm" />
                                        </EditItemTemplate>

                                        <ItemTemplate>
                                            <asp:Label Visible="false" ID="id_vendor_agenLabel" runat="server" Text='<%# Eval("id_vendor_agen") %>' />
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-striped">
                                                        <asp:Label Visible="false" ID="Label6" runat="server" Text='<%# Eval("id_vendor_agen") %>' />
                                                        <tr><td>Nomor Vendor</td><td>:</td><td><asp:Label ID="no_vendor_agenLabel" runat="server" Text='<%# Bind("no_vendor_agen") %>' /></td></tr>
                                                        <tr><td>Sold To</td><td>:</td><td><asp:Label ID="soldto_agenLabel" runat="server" Text='<%# Bind("soldto_agen") %>' /></td></tr>
                                                        <tr><td>Ship To</td><td>:</td><td><asp:Label ID="shipto_agenLabel" runat="server" Text='<%# Bind("shipto_agen") %>' /></td></tr>
                                                        <tr><td>Nama</td><td>:</td><td><asp:Label ID="nama_agenLabel" runat="server" Text='<%# Bind("nama_agen") %>' /></td></tr>
                                                        <tr><td>Alamat Kantor</td><td>:</td><td><asp:Label ID="alamat1_agenLabel" runat="server" Text='<%# Bind("alamat1_agen") %>' /></td></tr>
                                                        <tr><td>Alamat Gudang</td><td>:</td><td><asp:Label ID="alamat2_agenLabel" runat="server" Text='<%# Bind("alamat2_agen") %>' /></td></tr>
                                                        <tr><td>Kota</td><td>:</td><td><asp:Label ID="kota_agenLabel" runat="server" Text='<%# Bind("kota_agen") %>' /></td></tr>
                                                        <tr><td>Provinsi</td><td>:</td><td><asp:Label ID="prov_agenLabel" runat="server" Text='<%# Bind("provinsi_agen") %>' /></td></tr>
                                                        <tr><td>Rayon</td><td>:</td><td><asp:Label ID="rayon_agenLabel" runat="server" Text='<%# Bind("rayon_agen") %>' /></td></tr>
                                                        <tr><td>Status</td><td>:</td><td><asp:Label ID="status_agenLabel" runat="server" Text='<%# Bind("status_agen") %>' /></td></tr>
                                                        <tr><td>Jumlah Pangkalan</td><td>:</td><td><asp:Label ID="jmlpangkal_agenLabel" runat="server" Text='<%# Bind("jmlpangkal_agen") %>' /></td></tr>
                                                        <tr><td>Jumlah Penyaluran Per Hari</td><td>:</td><td><asp:Label ID="jmlsalur_agenLabel" runat="server" Text='<%# Bind("jmlsalur_agen") %>' /></td></tr>
                                                        <tr><td>Telepon/Fax</td><td>:</td><td><asp:Label ID="telp_agenLabel" runat="server" Text='<%# Bind("telp_agen") %>' /></td></tr>
                                                        <tr><td>Email</td><td>:</td><td><asp:Label ID="email_agenLabel" runat="server" Text='<%# Bind("email_agen") %>' /></td></tr>
                                                        <tr><td>Koordinat Lokasi</td><td>:</td><td><asp:Label ID="koor_agenLabel" runat="server" Text='<%# Bind("koor_agen") %>' /></td></tr>
                                                    </table>
                                                </div>                        
                                            <asp:LinkButton ID="Edit_ProfilAgen" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah" CssClass="btn btn-info btn-sm" />                               
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                        DeleteCommand="DELETE FROM [agen] WHERE [id_vendor_agen] = @original_id_vendor_agen AND (([no_vendor_agen] = @original_no_vendor_agen) OR ([no_vendor_agen] IS NULL AND @original_no_vendor_agen IS NULL)) AND (([soldto_agen] = @original_soldto_agen) OR ([soldto_agen] IS NULL AND @original_soldto_agen IS NULL)) AND (([shipto_agen] = @original_shipto_agen) OR ([shipto_agen] IS NULL AND @original_shipto_agen IS NULL)) AND (([nama_agen] = @original_nama_agen) OR ([nama_agen] IS NULL AND @original_nama_agen IS NULL)) AND (([alamat1_agen] = @original_alamat1_agen) OR ([alamat1_agen] IS NULL AND @original_alamat1_agen IS NULL)) AND (([alamat2_agen] = @original_alamat2_agen) OR ([alamat2_agen] IS NULL AND @original_alamat2_agen IS NULL)) AND (([kota_agen] = @original_kota_agen) OR ([kota_agen] IS NULL AND @original_kota_agen IS NULL)) AND (([provinsi_agen] = @original_provinsi_agen) OR ([provinsi_agen] IS NULL AND @original_provinsi_agen IS NULL)) AND (([rayon_agen] = @original_rayon_agen) OR ([rayon_agen] IS NULL AND @original_rayon_agen IS NULL)) AND (([status_agen] = @original_status_agen) OR ([status_agen] IS NULL AND @original_status_agen IS NULL)) AND (([email_agen] = @original_email_agen) OR ([email_agen] IS NULL AND @original_email_agen IS NULL)) AND (([telp_agen] = @original_telp_agen) OR ([telp_agen] IS NULL AND @original_telp_agen IS NULL)) AND (([koor_agen] = @original_koor_agen) OR ([koor_agen] IS NULL AND @original_koor_agen IS NULL)) AND (([jmlpangkal_agen] = @original_jmlpangkal_agen) OR ([jmlpangkal_agen] IS NULL AND @original_jmlpangkal_agen IS NULL)) AND (([jmlsalur_agen] = @original_jmlsalur_agen) OR ([jmlsalur_agen] IS NULL AND @original_jmlsalur_agen IS NULL))" 
                                        InsertCommand="INSERT INTO [agen] ([no_vendor_agen] [soldto_agen], [shipto_agen], [nama_agen], [alamat1_agen], [alamat2_agen], [kota_agen], [provinsi_agen], [rayon_agen], [status_agen], [email_agen], [telp_agen], [koor_agen], [jmlpangkal_agen], [jmlsalur_agen]) VALUES (@no_vendor_agen, @soldto_agen, @shipto_agen, @nama_agen, @alamat1_agen, @alamat2_agen, @kota_agen, @provinsi_agen, @rayon_agen, @status_agen, @email_agen, @telp_agen, @koor_agen, @jmlpangkal_agen, @jmlsalur_agen)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT * FROM [agen] WHERE [id_vendor_agen] = @id_vendor_agen" 
                                        UpdateCommand="UPDATE [agen] SET [no_vendor_agen] = @no_vendor_agen, [soldto_agen] = @soldto_agen, [shipto_agen] = @shipto_agen, [nama_agen] = @nama_agen, [alamat1_agen] = @alamat1_agen, [alamat2_agen] = @alamat2_agen, [kota_agen] = @kota_agen, [provinsi_agen] = @provinsi_agen, [rayon_agen] = @rayon_agen, [status_agen] = @status_agen, [email_agen] = @email_agen, [telp_agen] = @telp_agen, [koor_agen] = @koor_agen, [jmlpangkal_agen] = @jmlpangkal_agen, [jmlsalur_agen] = @jmlsalur_agen WHERE [id_vendor_agen] = @original_id_vendor_agen AND (([no_vendor_agen] = @original_no_vendor_agen) OR ([no_vendor_agen] IS NULL AND @original_no_vendor_agen IS NULL)) AND (([soldto_agen] = @original_soldto_agen) OR ([soldto_agen] IS NULL AND @original_soldto_agen IS NULL)) AND (([shipto_agen] = @original_shipto_agen) OR ([shipto_agen] IS NULL AND @original_shipto_agen IS NULL)) AND (([nama_agen] = @original_nama_agen) OR ([nama_agen] IS NULL AND @original_nama_agen IS NULL)) AND (([alamat1_agen] = @original_alamat1_agen) OR ([alamat1_agen] IS NULL AND @original_alamat1_agen IS NULL)) AND (([alamat2_agen] = @original_alamat2_agen) OR ([alamat2_agen] IS NULL AND @original_alamat2_agen IS NULL)) AND (([kota_agen] = @original_kota_agen) OR ([kota_agen] IS NULL AND @original_kota_agen IS NULL)) AND (([provinsi_agen] = @original_provinsi_agen) OR ([provinsi_agen] IS NULL AND @original_provinsi_agen IS NULL)) AND (([rayon_agen] = @original_rayon_agen) OR ([rayon_agen] IS NULL AND @original_rayon_agen IS NULL)) AND (([status_agen] = @original_status_agen) OR ([status_agen] IS NULL AND @original_status_agen IS NULL)) AND (([email_agen] = @original_email_agen) OR ([email_agen] IS NULL AND @original_email_agen IS NULL)) AND (([telp_agen] = @original_telp_agen) OR ([telp_agen] IS NULL AND @original_telp_agen IS NULL)) AND (([koor_agen] = @original_koor_agen) OR ([koor_agen] IS NULL AND @original_koor_agen IS NULL)) AND (([jmlpangkal_agen] = @original_jmlpangkal_agen) OR ([jmlpangkal_agen] IS NULL AND @original_jmlpangkal_agen IS NULL)) AND (([jmlsalur_agen] = @original_jmlsalur_agen) OR ([jmlsalur_agen] IS NULL AND @original_jmlsalur_agen IS NULL))">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id_vendor_agen" QueryStringField="agen" Type="String" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_id_vendor_agen" Type="Int32" />
                                            <asp:Parameter Name="original_no_vendor_agen" Type="String" />
                                            <asp:Parameter Name="original_soldto_agen" Type="String" />
                                            <asp:Parameter Name="original_shipto_agen" Type="String" />
                                            <asp:Parameter Name="original_nama_agen" Type="String" />
                                            <asp:Parameter Name="original_alamat1_agen" Type="String" />
                                            <asp:Parameter Name="original_alamat2_agen" Type="String" />
                                            <asp:Parameter Name="original_kota_agen" Type="String" />
                                            <asp:Parameter Name="original_provinsi_agen" Type="String" />
                                            <asp:Parameter Name="original_rayon_agen" Type="String" />
                                            <asp:Parameter Name="original_status_agen" Type="String" />
                                            <asp:Parameter Name="original_email_agen" Type="String" />
                                            <asp:Parameter Name="original_telp_agen" Type="String" />
                                            <asp:Parameter Name="original_koor_agen" Type="String" />
                                            <asp:Parameter Name="original_jmlpangkal_agen" Type="String" />
                                            <asp:Parameter Name="original_jmlsalur_agen" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="no_vendor_agen" Type="String" />
                                            <asp:Parameter Name="soldto_agen" Type="String" />
                                            <asp:Parameter Name="shipto_agen" Type="String" />
                                            <asp:Parameter Name="nama_agen" Type="String" />
                                            <asp:Parameter Name="alamat1_agen" Type="String" />
                                            <asp:Parameter Name="alamat2_agen" Type="String" />
                                            <asp:Parameter Name="kota_agen" Type="String" />
                                            <asp:Parameter Name="provinsi_agen" Type="String" />
                                            <asp:Parameter Name="rayon_agen" Type="String" />
                                            <asp:Parameter Name="status_agen" Type="String" />
                                            <asp:Parameter Name="email_agen" Type="String" />
                                            <asp:Parameter Name="telp_agen" Type="String" />
                                            <asp:Parameter Name="koor_agen" Type="String" />
                                            <asp:Parameter Name="jmlpangkal_agen" Type="String" />
                                            <asp:Parameter Name="jmlsalur_agen" Type="String" />
                                            <asp:Parameter Name="original_id_vendor_agen" Type="Int32" />
                                            <asp:Parameter Name="original_no_vendor_agen" Type="String" />
                                            <asp:Parameter Name="original_soldto_agen" Type="String" />
                                            <asp:Parameter Name="original_shipto_agen" Type="String" />
                                            <asp:Parameter Name="original_nama_agen" Type="String" />
                                            <asp:Parameter Name="original_alamat1_agen" Type="String" />
                                            <asp:Parameter Name="original_alamat2_agen" Type="String" />
                                            <asp:Parameter Name="original_kota_agen" Type="String" />
                                            <asp:Parameter Name="original_provinsi_agen" Type="String" />
                                            <asp:Parameter Name="original_rayon_agen" Type="String" />
                                            <asp:Parameter Name="original_status_agen" Type="String" />
                                            <asp:Parameter Name="original_email_agen" Type="String" />
                                            <asp:Parameter Name="original_telp_agen" Type="String" />
                                            <asp:Parameter Name="original_koor_agen" Type="String" />
                                            <asp:Parameter Name="original_jmlpangkal_agen" Type="String" />
                                            <asp:Parameter Name="original_jmlsalur_agen" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <!--profile tab session end here----------------------------------------------->
                            
                            <!--sarfas tab session here------------------------------------------------->
                            <div class="tab-pane fade in" id="sarfas">
                                <div class="batas">
                                    <asp:FormView ID="FormView_SarfasAgen" runat="server" DataKeyNames="id_vendor_agen" DataSourceID="SqlDataSource1">
                                        <EditItemTemplate>
                                            <table class="table table-hover table-striped">
                                                <tr><td>Jumlah Tabung</td><td>:</td><td><asp:TextBox ID="jmltabung_agenTextBox" runat="server" Text='<%# Bind("jmltabung_agen") %>' /></td></tr>
                                                <tr><td>Jumlah Truk</td><td>:</td><td><asp:TextBox ID="jmltruk_agenTextBox" runat="server" Text='<%# Bind("jmltruk_agen") %>' /></td></tr>
                                                <tr><td>Kapasitas Truk</td><td>:</td><td><asp:TextBox ID="kaptruk_agenTextBox" runat="server" Text='<%# Bind("kaptruk_agen") %>' /></td></tr>     
                                                <tr><td>Kapasitas Gudang</td><td>:</td><td><asp:TextBox ID="kapgdg_agenTextBox" runat="server" Text='<%# Bind("kapgdg_agen") %>' /></td></tr>     
                                                <!--<tr>
                                                    <asp:Label ID="id_vendor_agenLabel1" runat="server" Text='<%# Eval("id_vendor_agen") %>' Visible="false" /></td>
                                                </tr>-->
                                            </table> 
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm" />
                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <table class="table table-hover table-striped">
                                                <tr><td>Jumlah Tabung</td><td>:</td><td><asp:Label ID="jmltabung_agenLabel" runat="server" Text='<%# Bind("jmltabung_agen") %>' /></td></tr>
                                                <tr><td>Jumlah Truk</td><td>:</td><td><asp:Label ID="jmltruk_agenLabel" runat="server" Text='<%# Bind("jmltruk_agen") %>' /></td></tr>
                                                <tr><td>Kapasitas Truk</td><td>:</td><td><asp:Label ID="kaptruk_agenLabel" runat="server" Text='<%# Bind("kaptruk_agen") %>' /></td></tr>
                                                <tr><td>Kapasitas Gudang</td><td>:</td><td><asp:Label ID="kapgdg_agenLabel" runat="server" Text='<%# Bind("kapgdg_agen") %>' /></td></tr>
                                                <!--<tr>
                                                    <td><asp:Label ID="id_vendor_agenLabel" runat="server" Text='<%# Eval("id_vendor_agen") %>' Visible="false" /></td>
                                                </tr>-->
                                            </table> 
                                            <asp:LinkButton ID="Edit_SarfasAgen" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah" CssClass="btn btn-info btn-sm" />                 
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                        DeleteCommand="DELETE FROM [agen] WHERE [id_vendor_agen] = @original_id_vendor_agen AND (([jmltabung_agen] = @original_jmltabung_agen) OR ([jmltabung_agen] IS NULL AND @original_jmltabung_agen IS NULL)) AND (([jmltruk_agen] = @original_jmltruk_agen) OR ([jmltruk_agen] IS NULL AND @original_jmltruk_agen IS NULL)) AND (([kaptruk_agen] = @original_kaptruk_agen) OR ([kaptruk_agen] IS NULL AND @original_kaptruk_agen IS NULL)) AND (([kapgdg_agen] = @original_kapgdg_agen) OR ([kapgdg_agen] IS NULL AND @original_kapgdg_agen IS NULL))" 
                                        InsertCommand="INSERT INTO [agen] ([jmltabung_agen], [jmltruk_agen], [kaptruk_agen], [id_vendor_agen]) VALUES (@jmltabung_agen, @jmltruk_agen, @kaptruk_agen, @id_vendor_agen)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT [jmltabung_agen], [jmltruk_agen], [kaptruk_agen], [id_vendor_agen], [kapgdg_agen] FROM [agen] WHERE [id_vendor_agen] = @id_vendor_agen" 
                                        UpdateCommand="UPDATE [agen] SET [jmltabung_agen] = @jmltabung_agen, [jmltruk_agen] = @jmltruk_agen, [kaptruk_agen] = @kaptruk_agen, [kapgdg_agen] = @kapgdg_agen WHERE [id_vendor_agen] = @original_id_vendor_agen AND (([jmltabung_agen] = @original_jmltabung_agen) OR ([jmltabung_agen] IS NULL AND @original_jmltabung_agen IS NULL)) AND (([jmltruk_agen] = @original_jmltruk_agen) OR ([jmltruk_agen] IS NULL AND @original_jmltruk_agen IS NULL)) AND (([kaptruk_agen] = @original_kaptruk_agen) OR ([kaptruk_agen] IS NULL AND @original_kaptruk_agen IS NULL)) AND (([kapgdg_agen] = @original_kapgdg_agen) OR ([kapgdg_agen] IS NULL AND @original_kapgdg_agen IS NULL))">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id_vendor_agen" QueryStringField="agen" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="jmltabung_agen" Type="Int32" />
                                            <asp:Parameter Name="jmltruk_agen" Type="Int32" />
                                            <asp:Parameter Name="kaptruk_agen" Type="String" />
                                            <asp:Parameter Name="kapgdg_agen" Type="String" />
                                            <asp:Parameter Name="original_id_vendor_agen" Type="String" />
                                            <asp:Parameter Name="original_jmltabung_agen" Type="Int32" />
                                            <asp:Parameter Name="original_jmltruk_agen" Type="Int32" />
                                            <asp:Parameter Name="original_kaptruk_agen" Type="String" />
                                            <asp:Parameter Name="original_kapgdg_agen" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <!--sarfas tab session end here-------------------------------------------->                        

                            <!--dokumen tab session here------------------------------------------------->
                            <div class="tab-pane fade in" id="dokumen">
                                <div class="batas">
                                    <a href="#ModalAddDokAgen" class="btn btn-sm btn-info mod" data-toggle="modal" id="addnewdoc" runat="server">Tambah Dokumen Baru</a>   
                                    <div class="table-responsive batas">
                                        <asp:GridView ID="GridView_DokAgen" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="id_dokumen_agen" 
                                            OnPageIndexChanging="GridView_DokAgen_PageIndexChanging" 
                                            OnRowCancelingEdit="GridView_DokAgen_RowCancelingEdit"
                                            OnRowEditing="GridView_DokAgen_RowEditing"
                                            OnRowUpdating="GridView_DokAgen_RowUpdating"
                                            OnRowDeleting="GridView_DokAgen_RowDeleting"
                                            CssClass="table table-bordered table-hover table-striped">
                                            <PagerStyle CssClass="cssPager" HorizontalAlign="Center" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" PreviousPageText="<" NextPageText=">" FirstPageText="<<" LastPageText=">>" Position="Bottom" Visible="true" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="No. Dokumen" SortExpression="noreg_dokumen_agen">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("noreg_dokumen_agen") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_agen">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("tipe_dokumen_agen") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_agen">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("pub_dokumen_agen") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("pub_dokumen_agen") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_agen">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" data-provide="datepicker" data-date-format="mm/dd/yyyy" runat="server" Text='<%# Eval("date_dokumen_agen") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("date_dokumen_agen", "{0:d MMMM yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_agen">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" data-provide="datepicker" data-date-format="mm/dd/yyyy" runat="server" Text='<%# Eval("exp_dokumen_agen") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("exp_dokumen_agen", "{0:d MMMM yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="false" HeaderText="Preview Dokumen" SortExpression="image_dokumen_agen">
                                                    <EditItemTemplate>
                                                        <asp:Image ID="img_up" runat="server" ImageUrl='<%# Eval("image_dokumen_agen") %>' Height="20px" Width="20px"></asp:Image>
                                                        <asp:FileUpload ID="FileUpload4" runat="server" />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <a href="#ShowDokAgen" data-toggle="modal"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("image_dokumen_agen") %>'
                                                            CssClass="img-thumbnail" Height="20px" Width="20px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="downBtn" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandArgument='<%# Eval("image_dokumen_agen") %>' OnClick="Down_Click"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
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
                                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-danger btn-sm" CommandName="Delete" Text="X" OnClientClick="return confirm('Apakah anda yakin menghapus Dokumen Agen ini?');"></asp:LinkButton>
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
                                        <asp:GridView ID="GridView_HistoriAgen" AllowPaging="true" runat="server" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="id_histori_agen" DataSourceID="SqlDataSource5" OnRowDataBound="GridView_HistoriAgen_RowDataBound">
                                            <PagerStyle CssClass="cssPager" HorizontalAlign="Center" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" PreviousPageText="<" NextPageText=">" FirstPageText="<<" LastPageText=">>" Position="Bottom" Visible="true" />
                                            <Columns>
                                                <asp:BoundField Visible="false" DataField="id_histori_agen" HeaderText="id_histori_agen" InsertVisible="False" ReadOnly="True" SortExpression="id_histori_agen" />
                                                <asp:BoundField Visible="false" DataField="id_dokumen_agen" HeaderText="id_dokumen_agen" SortExpression="id_dokumen_agen" />
                                                <asp:BoundField Visible="false" DataField="id_vendor_agen" HeaderText="id_vendor_agen" SortExpression="id_vendor_agen" />
                                                <asp:BoundField DataField="aksi_agen" HeaderText="Aktivitas" SortExpression="aksi_agen" />
                                                <asp:BoundField DataField="dateubah_histori_agen" HeaderText="Tanggal Aktivitas" SortExpression="dateubah_histori_agen" dataformatstring="{0:d MMMM yyyy}" />
                                                <asp:BoundField DataField="no_regdok_agen" HeaderText="No. Dokumen" SortExpression="no_regdok_agen" />
                                                <asp:BoundField DataField="dateawal_histori_agen" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="dateawal_histori_agen" dataformatstring="{0:d MMMM yyyy}"/>
                                                <asp:BoundField DataField="dateakhir_histori_agen" HeaderText="Tanggal Dokumen Berakhir" SortExpression="dateakhir_histori_agen" dataformatstring="{0:d MMMM yyyy}" />            
                                                <asp:BoundField DataField="tipedok_agen" HeaderText="Jenis Dokumen" SortExpression="tipedok_agen" />
                                                <asp:BoundField DataField="pubdok_agen" HeaderText="Penerbit Dokumen" SortExpression="pubdok_agen" />
                                                <asp:TemplateField HeaderText="Preview Dokumen" SortExpression="imgdok_agen">
                                                    <ItemTemplate>
                                                        <a href="#ShowHistoriAgen" data-toggle="modal"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("imgdok_agen") %>'
                                                            CssClass="img-thumbnail" Height="20px" Width="20px" Style="cursor: pointer" OnClientClick="return LoadDiv1(this.src);" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="downBtnHis" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandArgument='<%# Eval("imgdok_agen") %>' OnClick="DownHis_Click"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                        
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                            SelectCommand="SELECT * FROM [histori_agen] WHERE [id_vendor_agen] = @id_vendor_agen ORDER BY [id_histori_agen] DESC">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_vendor_agen" QueryStringField="agen" Type="String" />
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
                                                <div class="col-md-2 col-md-offset-4"><asp:LinkButton ID="Button1" runat="server" Text="Simpan" OnClick="Button1_Click" CssClass="btn btn-success" /></div> 
                                                <div class="col-md-12">
                                                    <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png, .bmp, .gif<br />Ukuran file maksimal 2 Megabyte</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="batas">
                                        <div class="img-responsive">
                                            <asp:DataList ID="DataList_GalAgen" OnItemDataBound="DataList_GalAgen_ItemDataBound" runat="server" DataKeyField="idimg_agen" OnDeleteCommand="DataList_GalAgen_DeleteCommand" DataSourceID="SqlDataSource2" RepeatColumns="3" CellPadding="3" ShowFooter="False" ShowHeader="False">
                                                <EditItemStyle BackColor="Fuchsia" Font-Bold="True" Font-Italic="False" Font-Names="Algerian" Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="Aqua" HorizontalAlign="Left" VerticalAlign="Top" />
                                                <ItemTemplate>
                                                    <a href="#ShowGalAgen" data-toggle="modal"><asp:ImageButton ImageUrl='<%# Eval("img_agen") %>' runat="server" ID="img1" CssClass="img-thumbnail" Width="300px" Height="250px" Style="cursor: pointer" OnClientClick="return LoadGal(this.src);" /></a><br />
                                                    <asp:LinkButton ID="DltBtn" CssClass="btn btn-danger btn-xs atas" runat="server" CommandName="delete" Text="X"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>
                        
                                        </div>
                                    </div>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:PlantCS %>' DeleteCommand="DELETE FROM [image_agen] WHERE [idimg_agen] = @original_idimg_agen AND (([id_vendor_agen] = @original_id_vendor_agen) OR ([id_vendor_agen] IS NULL AND @original_id_vendor_agen IS NULL)) AND (([img_agen] = @original_img_agen) OR ([img_agen] IS NULL AND @original_img_agen IS NULL))" InsertCommand="INSERT INTO [image_agen] ([id_vendor_agen], [img_agen]) VALUES (@id_vendor_agen, @img_agen)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [image_agen] WHERE ([id_vendor_agen] = @id_vendor_agen)" UpdateCommand="UPDATE [image_agen] SET [id_vendor_agen] = @id_vendor_agen, [img_agen] = @img_agen WHERE [idimg_agen] = @original_idimg_agen AND (([id_vendor_agen] = @original_id_vendor_agen) OR ([id_vendor_agen] IS NULL AND @original_id_vendor_agen IS NULL)) AND (([img_agen] = @original_img_agen) OR ([img_agen] IS NULL AND @original_img_agen IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_idimg_agen" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_id_vendor_agen" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_img_agen" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="id_vendor_agen" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="img_agen" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="agen" Name="id_vendor_agen" Type="Int32"></asp:QueryStringParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="id_vendor_agen" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="img_agen" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_idimg_agen" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_id_vendor_agen" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_img_agen" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    
                                </div>
                            </div>    
                            <!--galeri tab session end here------------------------------------>
                                             
					    </div>	
     
				    </div>
                    <asp:HiddenField ID="TabName" runat="server" />
                    <div class>
                        <a href="Agen.aspx" class="btn btn-default btn-sm pull-right">Kembali Ke Daftar Agen</a>
                    </div> 
			    </div>
		    </div>

        <!-- Modal tambah dokumen-->
        <div id="ModalAddDokAgen" class="modal fade bs-example-modal-lg">
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
                                        <label for="Txt_nodok_agen">Nomor Dokumen</label>
					                    <asp:TextBox ID="Txt_nodok_agen" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_tipedok_agen">Jenis Dokumen</label>
					                    <asp:TextBox ID="Txt_tipedok_agen" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jenis Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_pubdoc_agen">Penerbit Dokumen</label>
					                    <asp:TextBox ID="Txt_pubdoc_agen" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Penerbit Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_remdoc_agen">Waktu Reminder (Hari)</label>
					                    <asp:TextBox ID="Txt_remdoc_agen" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Waktu Reminder Dokumen Dalam Hari"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="Txt_datedoc_agen">Tanggal Dokumen Diterbitkan</label>
					                    <asp:TextBox ID="Txt_datedoc_agen" required data-provide="datepicker" data-date-format="dd-mm-yyyy" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Tanggal Dokumen Diterbitkan"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="Txt_expdoc_agen">Tanggal Dokumen Berakhir</label>
					                    <asp:TextBox ID="Txt_expdoc_agen" required data-provide="datepicker" data-date-format="dd-mm-yyyy" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Tanggal Dokumen Berakhir"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-10 col-md-offset-1">
                                    <!--<div class="form-group">
                                        <label for="TextBox_alamat1_agen">Alamat1 Agen</label>
					                    <asp:TextBox ID="TextBox_alamat1_agen" runat="server" type="text" CssClass="form-control" placeholder="Masukkan alamat1 Agen" required></asp:TextBox>
                                    </div>-->
                                    <label for="FileUpload_dokagen">Upload File Dokumen</label>
                                    <asp:FileUpload ID="FileUpload_dokagen" runat="server" />
                                    <p class="help-block" style="font-size: 12px">Semua format file dokumen dapat disimpan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                        <asp:Button ID="Btn_savedok_agen" CssClass="btn btn-success"  runat="server" Text="Simpan" OnClick="Btn_savedok_agen_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!--modal tambah dokumen session end here-->
		
        <!-- Modal lihat gambar dokumen-->
        <div id="ShowDokAgen" class="modal fade">
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
        <div id="ShowGalAgen" class="modal fade">
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
        <div id="ShowHistoriAgen" class="modal fade">
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
