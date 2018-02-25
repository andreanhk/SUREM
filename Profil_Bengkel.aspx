<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profil_Bengkel.aspx.cs" Inherits="Profil_Bengkel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Profil Bengkel Perbaikan tabung - Domestic Gas Region V</title>

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
						<li><a href="Agen.aspx"><i class="glyphicon glyphicon-user"></i> Agen</a></li>
						<li class="active"><a href="Bengkel.aspx"><i class="glyphicon glyphicon-wrench"></i> Bengkel Tabung</a></li>
                        <li><a href="Default.aspx" data-toggle="tooltip" data-placement="bottom" data-html="true" title='Dokumen Dalam Masa Tenggang: <asp:Label ID="Label_TipRmdr" runat="server"></asp:Label><br />Dokumen Habis Masa Berlaku: <asp:Label ID="Label_TipExp" runat="server" CssClass="red"></asp:Label>'><i class="glyphicon glyphicon-time"></i> Monitoring Dokumen <span class="badge"><asp:Label ID="Label_NotifRmdr" runat="server"></asp:Label></span> <span class="badge red"><asp:Label ID="Label_NotifExp" runat="server" CssClass="red"></asp:Label></span></a></li>
                        <li id="ManageUserTab" runat="server"><a href="ManUser.aspx"><i class="glyphicon glyphicon-th-large"></i> Manajemen Akun</a></li>
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
                    <div class="col-md-8 col-md-offset-4"> 
                        
                    </div>
					<div class="col-md-4 col-lg-4">
                        <div class="img-responsive">
                            <asp:DataList ID="DataList_ProfilBkl" runat="server" DataKeyField="id_vendor_bkl">
                                <ItemTemplate>
                                    <asp:Image ImageUrl='<%# Eval("imgpp_bkl") %>' runat="server" ID="img_bklLabel" CssClass="img-thumbnail" />                                 
                                </ItemTemplate>
                            </asp:DataList>
                            <button id="Btn_EditPP_Bkl" runat="server" class="btn btn-primary btn-sm btn-xs ataspp" type="button" data-toggle="collapse" data-target="#collapsePPBkl" aria-expanded="false" aria-controls="collapseExample"><i class="glyphicon glyphicon-pencil"></i></button>
                        </div>
                        <!--------button colapse edit pp----------->
                        <div class="collapse" id="collapsePPBkl">
                            <div class="well">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png<br />Ukuran file maksimal 2 Megabyte</p>
                                <asp:Button ID="SavePP_Bkl" CssClass="btn btn-success btn-sm" runat="server" Text="Simpan" OnClick="SavePP_Bkl_Click" />  
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
                                    <asp:FormView ID="FormView_ProfilBkl" runat="server" DataKeyNames="id_vendor_bkl" DataSourceID="SqlDataSource6">
                                        <EditItemTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-hover table-striped">
                                                    <asp:Label Visible="false" ID="id_vendor_bklLabel1" runat="server" Text='<%# Eval("id_vendor_bkl") %>' /> 
                                                    <tr><td>Nomor Vendor</td><td>:</td><td><asp:TextBox ID="no_vendor_bklTextBox" runat="server" Text='<%# Bind("no_vendor_bkl") %>' /></td></tr>
                                                    <tr><td>Produk</td><td>:</td><td><asp:TextBox ID="produk_bklTextBox" runat="server" Text='<%# Bind("produk_bkl") %>' /></td></tr>
                                                    <tr><td>Nama</td><td>:</td><td><asp:TextBox ID="nama_bklTextBox" runat="server" Text='<%# Bind("nama_bkl") %>' /></td></tr>
                                                    <tr><td>Alamat Kantor</td><td>:</td><td><asp:TextBox ID="alamat1_bklTextBox" runat="server" Text='<%# Bind("alamat1_bkl") %>' /></td></tr>
                                                    <tr><td>Alamat Bengkel Perbaikan Tabung</td><td>:</td><td><asp:TextBox ID="alamat2_bklTextBox" runat="server" Text='<%# Bind("alamat2_bkl") %>' /></td></tr>
                                                    <tr><td>Kota</td><td>:</td><td><asp:TextBox ID="kota_bklTextBox" runat="server" Text='<%# Bind("kota_bkl") %>' /></td></tr>
                                                    <tr><td>Provinsi</td><td>:</td><td><asp:TextBox ID="provinsi_bklTextBox" runat="server" Text='<%# Bind("provinsi_bkl") %>' /></td></tr>
                                                    <tr><td>Rayon</td><td>:</td><td><asp:TextBox ID="rayon_bklTextBox" runat="server" Text='<%# Bind("rayon_bkl") %>' /></td></tr>
                                                    <tr><td>Status</td><td>:</td><td><asp:TextBox ID="status_bklTextBox" runat="server" Text='<%# Bind("status_bkl") %>' /></td></tr>
                                                    <tr><td>Telepon/Fax</td><td>:</td><td><asp:TextBox ID="telp_bklTextBox" runat="server" Text='<%# Bind("telp_bkl") %>' /></td></tr>
                                                    <tr><td>Email</td><td>:</td><td><asp:TextBox ID="email_bklTextBox" runat="server" Text='<%# Bind("email_bkl") %>' /></td></tr>
                                                    <tr><td>Koordinat Lokasi</td><td>:</td><td><asp:TextBox ID="koor_bklTextBox" runat="server" Text='<%# Bind("koor_bkl") %>' /></td></tr>                               
                                                </table>
                                            </div>
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm" />
                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm" />
                                        </EditItemTemplate>

                                        <ItemTemplate>
                                            <asp:Label Visible="false" ID="id_vendor_bklLabel" runat="server" Text='<%# Eval("id_vendor_bkl") %>' />
                                                <div class="table-responsive">
                                                    <table class="table table-hover table-striped">
                                                        <asp:Label Visible="false" ID="Label6" runat="server" Text='<%# Eval("id_vendor_bkl") %>' />
                                                        <tr><td>Nomor Vendor</td><td>:</td><td><asp:Label ID="no_vendor_bklLabel" runat="server" Text='<%# Bind("no_vendor_bkl") %>' /></td></tr>
                                                        <tr><td>Produk</td><td>:</td><td><asp:Label ID="produk_bklLabel" runat="server" Text='<%# Bind("produk_bkl") %>' /></td></tr>
                                                        <tr><td>Nama</td><td>:</td><td><asp:Label ID="nama_bklLabel" runat="server" Text='<%# Bind("nama_bkl") %>' /></td></tr>
                                                        <tr><td>Alamat Kantor</td><td>:</td><td><asp:Label ID="alamat1_bklLabel" runat="server" Text='<%# Bind("alamat1_bkl") %>' /></td></tr>
                                                        <tr><td>Alamat Bengkel Perbaikan Tabung</td><td>:</td><td><asp:Label ID="alamat2_bklLabel" runat="server" Text='<%# Bind("alamat2_bkl") %>' /></td></tr>
                                                        <tr><td>Kota</td><td>:</td><td><asp:Label ID="kota_bklLabel" runat="server" Text='<%# Bind("kota_bkl") %>' /></td></tr>
                                                        <tr><td>Provinsi</td><td>:</td><td><asp:Label ID="provinsi_bklLabel" runat="server" Text='<%# Bind("provinsi_bkl") %>' /></td></tr>
                                                        <tr><td>Rayon</td><td>:</td><td><asp:Label ID="rayon_bklLabel" runat="server" Text='<%# Bind("rayon_bkl") %>' /></td></tr>
                                                        <tr><td>Status</td><td>:</td><td><asp:Label ID="status_bklLabel" runat="server" Text='<%# Bind("status_bkl") %>' /></td></tr>
                                                        <tr><td>Telepon/Fax</td><td>:</td><td><asp:Label ID="telp_bklLabel" runat="server" Text='<%# Bind("telp_bkl") %>' /></td></tr>
                                                        <tr><td>Email</td><td>:</td><td><asp:Label ID="email_bklLabel" runat="server" Text='<%# Bind("email_bkl") %>' /></td></tr>
                                                        <tr><td>Koordinat Lokasi</td><td>:</td><td><asp:Label ID="koor_bklLabel" runat="server" Text='<%# Bind("koor_bkl") %>' /></td></tr>
                                                    </table>
                                                </div>                        
                                            <asp:LinkButton ID="Edit_ProfilBkl" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah" CssClass="btn btn-info btn-sm" />                               
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                        DeleteCommand="DELETE FROM [bkl] WHERE [id_vendor_bkl] = @original_id_vendor_bkl AND (([no_vendor_bkl] = @original_no_vendor_bkl) OR ([no_vendor_bkl] IS NULL AND @original_no_vendor_bkl IS NULL)) AND (([produk_bkl] = @original_produk_bkl) OR ([produk_bkl] IS NULL AND @original_produk_bkl IS NULL)) AND (([nama_bkl] = @original_nama_bkl) OR ([nama_bkl] IS NULL AND @original_nama_bkl IS NULL)) AND (([alamat1_bkl] = @original_alamat1_bkl) OR ([alamat1_bkl] IS NULL AND @original_alamat1_bkl IS NULL)) AND (([alamat2_bkl] = @original_alamat2_bkl) OR ([alamat2_bkl] IS NULL AND @original_alamat2_bkl IS NULL)) AND (([kota_bkl] = @original_kota_bkl) OR ([kota_bkl] IS NULL AND @original_kota_bkl IS NULL)) AND (([provinsi_bkl] = @original_provinsi_bkl) OR ([provinsi_bkl] IS NULL AND @original_provinsi_bkl IS NULL)) AND (([rayon_bkl] = @original_rayon_bkl) OR ([rayon_bkl] IS NULL AND @original_rayon_bkl IS NULL)) AND (([status_bkl] = @original_status_bkl) OR ([status_bkl] IS NULL AND @original_status_bkl IS NULL)) AND (([email_bkl] = @original_email_bkl) OR ([email_bkl] IS NULL AND @original_email_bkl IS NULL)) AND (([telp_bkl] = @original_telp_bkl) OR ([telp_bkl] IS NULL AND @original_telp_bkl IS NULL)) AND (([koor_bkl] = @original_koor_bkl) OR ([koor_bkl] IS NULL AND @original_koor_bkl IS NULL))" 
                                        InsertCommand="INSERT INTO [bkl] ([no_vendor_bkl], [produk_bkl], [nama_bkl], [alamat1_bkl], [alamat2_bkl], [kota_bkl], [provinsi_bkl], [rayon_bkl], [status_bkl], [email_bkl], [telp_bkl], [koor_bkl]) VALUES (@no_vendor_bkl, @produk_bkl, @nama_bkl, @alamat1_bkl, @alamat2_bkl, @kota_bkl, @provinsi_bkl, @rayon_bkl, @status_bkl, @email_bkl, @telp_bkl, @koor_bkl)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT * FROM [bkl] WHERE [id_vendor_bkl] = @id_vendor_bkl" 
                                        UpdateCommand="UPDATE [bkl] SET [no_vendor_bkl] = @no_vendor_bkl, [produk_bkl] = @produk_bkl, [nama_bkl] = @nama_bkl, [alamat1_bkl] = @alamat1_bkl, [alamat2_bkl] = @alamat2_bkl, [kota_bkl] = @kota_bkl, [provinsi_bkl] = @provinsi_bkl, [rayon_bkl] = @rayon_bkl, [status_bkl] = @status_bkl, [email_bkl] = @email_bkl, [telp_bkl] = @telp_bkl, [koor_bkl] = @koor_bkl WHERE [id_vendor_bkl] = @original_id_vendor_bkl AND (([no_vendor_bkl] = @original_no_vendor_bkl) OR ([no_vendor_bkl] IS NULL AND @original_no_vendor_bkl IS NULL)) AND (([produk_bkl] = @original_produk_bkl) OR ([produk_bkl] IS NULL AND @original_produk_bkl IS NULL)) AND (([nama_bkl] = @original_nama_bkl) OR ([nama_bkl] IS NULL AND @original_nama_bkl IS NULL)) AND (([alamat1_bkl] = @original_alamat1_bkl) OR ([alamat1_bkl] IS NULL AND @original_alamat1_bkl IS NULL)) AND (([alamat2_bkl] = @original_alamat2_bkl) OR ([alamat2_bkl] IS NULL AND @original_alamat2_bkl IS NULL)) AND (([kota_bkl] = @original_kota_bkl) OR ([kota_bkl] IS NULL AND @original_kota_bkl IS NULL)) AND (([provinsi_bkl] = @original_provinsi_bkl) OR ([provinsi_bkl] IS NULL AND @original_provinsi_bkl IS NULL)) AND (([rayon_bkl] = @original_rayon_bkl) OR ([rayon_bkl] IS NULL AND @original_rayon_bkl IS NULL)) AND (([status_bkl] = @original_status_bkl) OR ([status_bkl] IS NULL AND @original_status_bkl IS NULL)) AND (([email_bkl] = @original_email_bkl) OR ([email_bkl] IS NULL AND @original_email_bkl IS NULL)) AND (([telp_bkl] = @original_telp_bkl) OR ([telp_bkl] IS NULL AND @original_telp_bkl IS NULL)) AND (([koor_bkl] = @original_koor_bkl) OR ([koor_bkl] IS NULL AND @original_koor_bkl IS NULL))">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id_vendor_bkl" QueryStringField="bengkel" Type="String" />
                                        </SelectParameters>
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_id_vendor_bkl" Type="Int32" />
                                            <asp:Parameter Name="original_no_vendor_bkl" Type="String" />
                                            <asp:Parameter Name="original_produk_bkl" Type="String" />
                                            <asp:Parameter Name="original_nama_bkl" Type="String" />
                                            <asp:Parameter Name="original_alamat1_bkl" Type="String" />
                                            <asp:Parameter Name="original_alamat2_bkl" Type="String" />
                                            <asp:Parameter Name="original_kota_bkl" Type="String" />
                                            <asp:Parameter Name="original_provinsi_bkl" Type="String" />
                                            <asp:Parameter Name="original_rayon_bkl" Type="String" />
                                            <asp:Parameter Name="original_status_bkl" Type="String" />
                                            <asp:Parameter Name="original_email_bkl" Type="String" />
                                            <asp:Parameter Name="original_telp_bkl" Type="String" />
                                            <asp:Parameter Name="original_koor_bkl" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="no_vendor_bkl" Type="String" />
                                            <asp:Parameter Name="produk_bkl" Type="String" />
                                            <asp:Parameter Name="nama_bkl" Type="String" />
                                            <asp:Parameter Name="alamat1_bkl" Type="String" />
                                            <asp:Parameter Name="alamat2_bkl" Type="String" />
                                            <asp:Parameter Name="kota_bkl" Type="String" />
                                            <asp:Parameter Name="provinsi_bkl" Type="String" />
                                            <asp:Parameter Name="rayon_bkl" Type="String" />
                                            <asp:Parameter Name="status_bkl" Type="String" />
                                            <asp:Parameter Name="email_bkl" Type="String" />
                                            <asp:Parameter Name="telp_bkl" Type="String" />
                                            <asp:Parameter Name="koor_bkl" Type="String" />
                                            <asp:Parameter Name="original_id_vendor_bkl" Type="Int32" />
                                            <asp:Parameter Name="original_no_vendor_bkl" Type="String" />
                                            <asp:Parameter Name="original_produk_bkl" Type="String" />
                                            <asp:Parameter Name="original_nama_bkl" Type="String" />
                                            <asp:Parameter Name="original_alamat1_bkl" Type="String" />
                                            <asp:Parameter Name="original_alamat2_bkl" Type="String" />
                                            <asp:Parameter Name="original_kota_bkl" Type="String" />
                                            <asp:Parameter Name="original_provinsi_bkl" Type="String" />
                                            <asp:Parameter Name="original_rayon_bkl" Type="String" />
                                            <asp:Parameter Name="original_status_bkl" Type="String" />
                                            <asp:Parameter Name="original_email_bkl" Type="String" />
                                            <asp:Parameter Name="original_telp_bkl" Type="String" />
                                            <asp:Parameter Name="original_koor_bkl" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <!--profile tab session end here----------------------------------------------->                        

                            <!--sarfas tab session here------------------------------------------------->
                            <div class="tab-pane fade in" id="sarfas">
                                <div class="batas">
                                    <asp:FormView ID="FormView_SarfasAgen" runat="server" DataKeyNames="id_vendor_bkl" DataSourceID="SqlDataSource1">
                                        <EditItemTemplate>
                                            <table class="table table-hover table-striped">
                                                <tr><td>Kemampuan Annealing</td><td>:</td><td><asp:TextBox ID="Anneal_bklTextBox" runat="server" Text='<%# Bind("anneal_bkl") %>' /></td></tr>     
                                                <tr><td>Jumlah Tabung</td><td>:</td><td><asp:TextBox ID="jmltabung_bklTextBox" runat="server" Text='<%# Bind("jmltabung_bkl") %>' /></td></tr>
                                                <tr><td>Jumlah Truk</td><td>:</td><td><asp:TextBox ID="jmltruk_bklTextBox" runat="server" Text='<%# Bind("jmltruk_bkl") %>' /></td></tr>
                                                <tr><td>Kapasitas Truk</td><td>:</td><td><asp:TextBox ID="kaptruk_bklTextBox" runat="server" Text='<%# Bind("kaptruk_bkl") %>' /></td></tr>     
                                                <!--<tr>
                                                    <asp:Label ID="id_vendor_bklLabel1" runat="server" Text='<%# Eval("id_vendor_bkl") %>' Visible="false" /></td>
                                                </tr>-->
                                            </table> 
                                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Simpan" CssClass="btn btn-success btn-sm" />
                                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Batal" CssClass="btn btn-warning btn-sm" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <table class="table table-hover table-striped">
                                                <tr><td>Kemampuan Annealing</td><td>:</td><td><asp:Label ID="anneal_bklLabel" runat="server" Text='<%# Bind("anneal_bkl") %>' /></td></tr>
                                                <tr><td>Jumlah Tabung</td><td>:</td><td><asp:Label ID="jmltabung_bklLabel" runat="server" Text='<%# Bind("jmltabung_bkl") %>' /></td></tr>
                                                <tr><td>Jumlah Truk</td><td>:</td><td><asp:Label ID="jmltruk_bklLabel" runat="server" Text='<%# Bind("jmltruk_bkl") %>' /></td></tr>
                                                <tr><td>Kapasitas Truk</td><td>:</td><td><asp:Label ID="kaptruk_bklLabel" runat="server" Text='<%# Bind("kaptruk_bkl") %>' /></td></tr>
                                                <!--<tr>
                                                    <td><asp:Label ID="id_vendor_bklLabel" runat="server" Text='<%# Eval("id_vendor_bkl") %>' Visible="false" /></td>
                                                </tr>-->
                                            </table> 
                                            <asp:LinkButton ID="Edit_SarfasBkl" runat="server" CausesValidation="False" CommandName="Edit" Text="Ubah" CssClass="btn btn-info btn-sm" />                 
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                        DeleteCommand="DELETE FROM [bkl] WHERE [id_vendor_bkl] = @original_id_vendor_bkl AND (([jmltabung_bkl] = @original_jmltabung_bkl) OR ([jmltabung_bkl] IS NULL AND @original_jmltabung_bkl IS NULL)) AND (([jmltruk_bkl] = @original_jmltruk_bkl) OR ([jmltruk_bkl] IS NULL AND @original_jmltruk_bkl IS NULL)) AND (([kaptruk_bkl] = @original_kaptruk_bkl) OR ([kaptruk_bkl] IS NULL AND @original_kaptruk_bkl IS NULL))" 
                                        InsertCommand="INSERT INTO [bkl] ([jmltabung_bkl], [jmltruk_bkl], [kaptruk_bkl], [id_vendor_bkl]) VALUES (@jmltabung_bkl,@jmltruk_bkl, @kaptruk_bkl, @id_vendor_bkl)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT [jmltabung_bkl], [jmltruk_bkl], [kaptruk_bkl], [id_vendor_bkl], [anneal_bkl] FROM [bkl] WHERE [id_vendor_bkl] = @id_vendor_bkl" 
                                        UpdateCommand="UPDATE [bkl] SET [jmltabung_bkl] = @jmltabung_bkl, [jmltruk_bkl] = @jmltruk_bkl, [kaptruk_bkl] = @kaptruk_bkl, [anneal_bkl] = @anneal_bkl WHERE [id_vendor_bkl] = @original_id_vendor_bkl AND (([jmltabung_bkl] = @original_jmltabung_bkl) OR ([jmltabung_bkl] IS NULL AND @original_jmltabung_bkl IS NULL)) AND (([jmltruk_bkl] = @original_jmltruk_bkl) OR ([jmltruk_bkl] IS NULL AND @original_jmltruk_bkl IS NULL)) AND (([kaptruk_bkl] = @original_kaptruk_bkl) OR ([kaptruk_bkl] IS NULL AND @original_kaptruk_bkl IS NULL)) AND (([kaptruk_bkl] = @original_kaptruk_bkl) OR ([kaptruk_bkl] IS NULL AND @original_kaptruk_bkl IS NULL))">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id_vendor_bkl" QueryStringField="bengkel" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="jmltabung_bkl" Type="Int32" />
                                            <asp:Parameter Name="jmltruk_bkl" Type="Int32" />
                                            <asp:Parameter Name="kaptruk_bkl" Type="String" />
                                            <asp:Parameter Name="anneal_bkl" Type="String" />
                                            <asp:Parameter Name="original_id_vendor_bkl" Type="String" />
                                            <asp:Parameter Name="original_jmltabung_bkl" Type="Int32" />
                                            <asp:Parameter Name="original_jmltruk_bkl" Type="Int32" />
                                            <asp:Parameter Name="original_kaptruk_bkl" Type="String" />
                                            <asp:Parameter Name="original_anneal_bkl" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                <h2>Kapasitas Perbaikan Tabung Per Bulan</h2>
                                    <asp:FormView ID="FormView_KapBkl" runat="server" DataKeyNames="id_vendor_bkl" DataSourceID="SqlDataSource3">
                                        <EditItemTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-hover table-striped">
                                                    <tr><td>Kapasitas Total Per Bulan</td><td>:</td><td><asp:TextBox Text='<%# Bind("total_bkl") %>' runat="server" ID="total_bklTextBox" /></td></tr>
                                                    <tr><td>Kapasitas Retest Per Bulan</td><td>:</td><td><asp:TextBox Text='<%# Bind("retest_bkl") %>' runat="server" ID="retest_bklTextBox" /></td></tr>
                                                    <tr><td>Kapasitas Repaint Per Bulan</td><td>:</td><td><asp:TextBox Text='<%# Bind("retp_bkl") %>' runat="server" ID="retp_bklTextBox" /></td></tr>
                                                    <tr><td>Kapasitas Retest dan Re-paint Per Bulan</td><td>:</td><td><asp:TextBox Text='<%# Bind("repaint_bkl") %>' runat="server" ID="repaint_bklTextBox" /></td></tr>
                                                    <tr><td>Kapasitas Repair Per Bulan</td><td>:</td><td><asp:TextBox Text='<%# Bind("repair_bkl") %>' runat="server" ID="repair_bklTextBox" /></td></tr>
                                                    <asp:Label Visible="false" Text='<%# Eval("id_vendor_bkl") %>' runat="server" ID="id_vendor_bklLabel1" /><br />
                                                </table>
                                            </div>
                                            <asp:LinkButton runat="server" Text="Simpan" CssClass="btn btn-success btn-sm" CommandName="Update" ID="UpdateButton" CausesValidation="True" />
                                            <asp:LinkButton runat="server" Text="Batal" CssClass="btn btn-danger btn-sm" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />      
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <div class="table-responsive">
                                                <table class="table table-hover table-striped">
                                                    <tr><td>Kapasitas Total Per Bulan</td><td>:</td><td><asp:Label Text='<%# Bind("total_bkl") %>' runat="server" ID="total_bklLabel" /></td></tr>
                                                    <tr><td>Kapasitas Retest Per Bulan</td><td>:</td><td><asp:Label Text='<%# Bind("retest_bkl") %>' runat="server" ID="retest_bklLabel" /></td></tr>
                                                    <tr><td>Kapasitas Repaint Per Bulan</td><td>:</td><td><asp:Label Text='<%# Bind("retp_bkl") %>' runat="server" ID="retp_bklLabel" /></td></tr>
                                                    <tr><td>Kapasitas Retest dan Re-paint Per Bulan</td><td>:</td><td><asp:Label Text='<%# Bind("repaint_bkl") %>' runat="server" ID="repaint_bklLabel" /></td></tr>
                                                    <tr><td>Kapasitas Repair Per Bulan</td><td>:</td><td><asp:Label Text='<%# Bind("repair_bkl") %>' runat="server" ID="repair_bklLabel" /></td></tr>
                                                    <asp:Label Visible="false" Text='<%# Eval("id_vendor_bkl") %>' runat="server" ID="id_vendor_bklLabel" />
                                                </table>
                                                
                                                <asp:LinkButton runat="server" Text="Ubah" CommandName="Edit" ID="Edit_KapBkl" CausesValidation="False" CssClass="btn btn-info btn-sm" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:PlantCS %>' 
                                        DeleteCommand="DELETE FROM [bkl] WHERE [id_vendor_bkl] = @original_id_vendor_bkl AND (([retest_bkl] = @original_retest_bkl) OR ([retest_bkl] IS NULL AND @original_retest_bkl IS NULL)) AND (([retp_bkl] = @original_retp_bkl) OR ([retp_bkl] IS NULL AND @original_retp_bkl IS NULL)) AND (([repaint_bkl] = @original_repaint_bkl) OR ([repaint_bkl] IS NULL AND @original_repaint_bkl IS NULL)) AND (([repair_bkl] = @original_repair_bkl) OR ([repair_bkl] IS NULL AND @original_repair_bkl IS NULL)) AND (([total_bkl] = @original_total_bkl) OR ([total_bkl] IS NULL AND @original_total_bkl IS NULL))" 
                                        InsertCommand="INSERT INTO [bkl] ([retest_bkl], [retp_bkl], [repaint_bkl], [repair_bkl], [total_bkl]) VALUES (@retest_bkl, @retp_bkl, @repaint_bkl, @repair_bkl, @total_bkl)" OldValuesParameterFormatString="original_{0}" 
                                        SelectCommand="SELECT [id_vendor_bkl], [retest_bkl], [retp_bkl], [repaint_bkl], [repair_bkl], [total_bkl] FROM [bkl] WHERE [id_vendor_bkl] = @id_vendor_bkl" 
                                        UpdateCommand="UPDATE [bkl] SET [retest_bkl] = @retest_bkl, [retp_bkl] = @retp_bkl, [repaint_bkl] = @repaint_bkl, [repair_bkl] = @repair_bkl, [total_bkl] = @total_bkl WHERE [id_vendor_bkl] = @original_id_vendor_bkl AND (([retest_bkl] = @original_retest_bkl) OR ([retest_bkl] IS NULL AND @original_retest_bkl IS NULL)) AND (([retp_bkl] = @original_retp_bkl) OR ([retp_bkl] IS NULL AND @original_retp_bkl IS NULL)) AND (([repaint_bkl] = @original_repaint_bkl) OR ([repaint_bkl] IS NULL AND @original_repaint_bkl IS NULL)) AND (([repair_bkl] = @original_repair_bkl) OR ([repair_bkl] IS NULL AND @original_repair_bkl IS NULL)) AND (([total_bkl] = @original_total_bkl) OR ([total_bkl] IS NULL AND @original_total_bkl IS NULL))">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="id_vendor_bkl" QueryStringField="bengkel" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="retest_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="retp_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="repaint_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="repair_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="total_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_id_vendor_bkl" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_retest_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_retp_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_repaint_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_repair_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_total_bkl" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <!--sarfas tab session end here-------------------------------------------->

                            <!--dokumen tab session here------------------------------------------------->
                            <div class="tab-pane fade in" id="dokumen">
                                <div class="batas">
                                    <a href="#ModalAddDokBkl" class="btn btn-sm btn-info mod" data-toggle="modal" id="addnewdoc" runat="server">Tambah Dokumen Baru</a>   
                                    <div class="table-responsive batas">
                                        <asp:GridView ID="GridView_DokBkl" runat="server" AllowPaging="true" AutoGenerateColumns="False" DataKeyNames="id_dokumen_bkl" 
                                            OnPageIndexChanging="GridView_DokBkl_PageIndexChanging" 
                                            OnRowCancelingEdit="GridView_DokBkl_RowCancelingEdit"
                                            OnRowEditing="GridView_DokBkl_RowEditing"
                                            OnRowUpdating="GridView_DokBkl_RowUpdating"
                                            OnRowDeleting="GridView_DokBkl_RowDeleting"
                                            CssClass="table table-bordered table-hover table-striped">
                                            <PagerStyle CssClass="cssPager" HorizontalAlign="Center" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" PreviousPageText="<" NextPageText=">" FirstPageText="<<" LastPageText=">>" Position="Bottom" Visible="true" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="No. Dokumen" SortExpression="noreg_dokumen_bkl">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("noreg_dokumen_bkl") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_bkl">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("tipe_dokumen_bkl") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_bkl">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("pub_dokumen_bkl") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("pub_dokumen_bkl") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_bkl">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" data-provide="datepicker" data-date-format="mm/dd/yyyy" runat="server" Text='<%# Eval("date_dokumen_bkl") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("date_dokumen_bkl", "{0:d MMMM yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_bkl">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" data-provide="datepicker" data-date-format="mm/dd/yyyy" runat="server" Text='<%# Eval("exp_dokumen_bkl") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("exp_dokumen_bkl", "{0:d MMMM yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="false" HeaderText="Preview Dokumen" SortExpression="image_dokumen_bkl">
                                                    <EditItemTemplate>
                                                        <asp:Image ID="img_up" runat="server" ImageUrl='<%# Eval("image_dokumen_bkl") %>' Height="20px" Width="20px"></asp:Image>
                                                        <asp:FileUpload ID="FileUpload4" runat="server" />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <a href="#ShowDokBkl" data-toggle="modal"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("image_dokumen_bkl") %>'
                                                            CssClass="img-thumbnail" Height="20px" Width="20px" Style="cursor: pointer" OnClientClick="return LoadDiv(this.src);" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="downBtn" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandArgument='<%# Eval("image_dokumen_bkl") %>' OnClick="Down_Click"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
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
                                                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CssClass="btn btn-danger btn-sm" CommandName="Delete" Text="X" OnClientClick="return confirm('Apakah anda yakin menghapus Dokumen Bengkel ini?');"></asp:LinkButton>
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
                                        <asp:GridView ID="GridView_HistoriBkl" runat="server" AllowPaging="true" CssClass="table table-bordered table-hover table-striped" AutoGenerateColumns="False" DataKeyNames="id_histori_bkl" DataSourceID="SqlDataSource5" OnRowDataBound="GridView_HistoriBkl_RowDataBound">
                                            <PagerStyle CssClass="cssPager" HorizontalAlign="Center" />
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="20" PreviousPageText="<" NextPageText=">" FirstPageText="<<" LastPageText=">>" Position="Bottom" Visible="true" />
                                            <Columns>
                                                <asp:BoundField Visible="false" DataField="id_histori_bkl" HeaderText="id_histori_bkl" InsertVisible="False" ReadOnly="True" SortExpression="id_histori_bkl" />
                                                <asp:BoundField Visible="false" DataField="id_dokumen_bkl" HeaderText="id_dokumen_bkl" SortExpression="id_dokumen_bkl" />
                                                <asp:BoundField Visible="false" DataField="id_vendor_bkl" HeaderText="id_vendor_bkl" SortExpression="id_vendor_bkl" />
                                                <asp:BoundField DataField="aksi_bkl" HeaderText="Aktivitas" SortExpression="aksi_bkl" />
                                                <asp:BoundField DataField="dateubah_histori_bkl" HeaderText="Tanggal Aktivitas" SortExpression="dateubah_histori_bkl" dataformatstring="{0:d MMMM yyyy}" />
                                                <asp:BoundField DataField="no_regdok_bkl" HeaderText="No. Dokumen" SortExpression="no_regdok_bkl" />
                                                <asp:BoundField DataField="dateawal_histori_bkl" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="dateawal_histori_bkl" dataformatstring="{0:d MMMM yyyy}"/>
                                                <asp:BoundField DataField="dateakhir_histori_bkl" HeaderText="Tanggal Dokumen Berakhir" SortExpression="dateakhir_histori_bkl" dataformatstring="{0:d MMMM yyyy}" />            
                                                <asp:BoundField DataField="tipedok_bkl" HeaderText="Jenis Dokumen" SortExpression="tipedok_bkl" />
                                                <asp:BoundField DataField="pubdok_bkl" HeaderText="Penerbit Dokumen" SortExpression="pubdok_bkl" />
                                                <asp:TemplateField HeaderText="Preview Dokumen" SortExpression="imgdok_bkl">
                                                    <ItemTemplate>
                                                        <a href="#ShowHistoriBkl" data-toggle="modal"><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("imgdok_bkl") %>'
                                                            CssClass="img-thumbnail" Height="20px" Width="20px" Style="cursor: pointer" OnClientClick="return LoadDiv1(this.src);" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="downBtnHis" runat="server" CausesValidation="False" CssClass="btn btn-info btn-sm" CommandArgument='<%# Eval("imgdok_bkl") %>' OnClick="DownHis_Click"><i class="glyphicon glyphicon-floppy-disk"></i></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                        
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                            SelectCommand="SELECT * FROM [histori_bkl] WHERE [id_vendor_bkl] = @id_vendor_bkl ORDER BY [id_histori_bkl] DESC">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="id_vendor_bkl" QueryStringField="bengkel" Type="String" />
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
                                                <div class="col-md-2 col-md-offset-4"><asp:Button ID="Button1" runat="server" Text="Simpan" OnClick="Button1_Click" CssClass="btn btn-success" /></div> 
                                                <div class="col-md-12">
                                                    <p class="help-block" style="font-size: 12px">Format file dokumen yang dapat disimpan .jpg, .jpeg, .png, .bmp, .gif<br />Ukuran file maksimal 2 Megabyte</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="batas">
                                        <div class="img-responsive">
                                            <asp:DataList ID="DataList_GalBkl" OnItemDataBound="DataList_GalBkl_ItemDataBound" runat="server" DataKeyField="idimg_bkl" OnDeleteCommand="DataList_GalBkl_DeleteCommand" DataSourceID="SqlDataSource2" RepeatColumns="3" CellPadding="3" ShowFooter="False" ShowHeader="False">
                                                <EditItemStyle BackColor="Fuchsia" Font-Bold="True" Font-Italic="False" Font-Names="Algerian" Font-Overline="False" Font-Size="Smaller" Font-Strikeout="False" Font-Underline="False" ForeColor="Aqua" HorizontalAlign="Left" VerticalAlign="Top" />
                                                <ItemTemplate>
                                                    <a href="#ShowGalBkl" data-toggle="modal"><asp:ImageButton ImageUrl='<%# Eval("img_bkl") %>' runat="server" ID="img1" CssClass="img-thumbnail" Width="300px" Height="250px" Style="cursor: pointer" OnClientClick="return LoadGal(this.src);" /></a><br />
                                                    <asp:LinkButton ID="DltBtn" CssClass="btn btn-danger btn-xs atas" runat="server" CommandName="delete" Text="X"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:DataList>
                        
                                        </div>
                                    </div>

                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:PlantCS %>' DeleteCommand="DELETE FROM [image_bkl] WHERE [idimg_bkl] = @original_idimg_bkl AND (([id_vendor_bkl] = @original_id_vendor_bkl) OR ([id_vendor_bkl] IS NULL AND @original_id_vendor_bkl IS NULL)) AND (([img_bkl] = @original_img_bkl) OR ([img_bkl] IS NULL AND @original_img_bkl IS NULL))" InsertCommand="INSERT INTO [image_bkl] ([id_vendor_bkl], [img_bkl]) VALUES (@id_vendor_bkl, @img_bkl)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [image_bkl] WHERE ([id_vendor_bkl] = @id_vendor_bkl)" UpdateCommand="UPDATE [image_bkl] SET [id_vendor_bkl] = @id_vendor_bkl, [img_bkl] = @img_bkl WHERE [idimg_bkl] = @original_idimg_bkl AND (([id_vendor_bkl] = @original_id_vendor_bkl) OR ([id_vendor_bkl] IS NULL AND @original_id_vendor_bkl IS NULL)) AND (([img_bkl] = @original_img_bkl) OR ([img_bkl] IS NULL AND @original_img_bkl IS NULL))">
                                        <DeleteParameters>
                                            <asp:Parameter Name="original_idimg_bkl" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_id_vendor_bkl" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_img_bkl" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="id_vendor_bkl" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="img_bkl" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:QueryStringParameter QueryStringField="bengkel" Name="id_vendor_bkl" Type="Int32"></asp:QueryStringParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="id_vendor_bkl" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="img_bkl" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="original_idimg_bkl" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_id_vendor_bkl" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="original_img_bkl" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    
                                </div>
                            </div>    
                            <!--galeri tab session end here------------------------------------>
                                             
					    </div>	
     
				    </div>
                    <asp:HiddenField ID="TabName" runat="server" />
                    <div class="batas">
                        <a href="Bengkel.aspx" class="btn btn-default btn-sm pull-right">Kembali Ke Daftar Bengkel</a> 
                    </div>                
			    </div>
		    </div>

        <!-- Modal tambah dokumen-->
        <div id="ModalAddDokBkl" class="modal fade bs-example-modal-lg">
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
                                        <label for="Txt_nodok_bkl">Nomor Dokumen</label>
					                    <asp:TextBox ID="Txt_nodok_bkl" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Nomor Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_tipedok_bkl">Jenis Dokumen</label>
					                    <asp:TextBox ID="Txt_tipedok_bkl" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Jenis Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_pubdoc_bkl">Penerbit Dokumen</label>
					                    <asp:TextBox ID="Txt_pubdoc_bkl" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Penerbit Dokumen"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="Txt_remdoc_bkl">Waktu Reminder (hari)</label>
					                    <asp:TextBox ID="Txt_remdoc_bkl" required runat="server" type="text" CssClass="form-control" placeholder="Masukkan Waktu Reminder Dokumen Dalam Hari"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5 col-md-offset-1">
                                    <div class="form-group">
                                        <label for="Txt_datedoc_bkl">Tanggal Dokumen Diterbitkan</label>
					                    <asp:TextBox ID="Txt_datedoc_bkl" required data-provide="datepicker" data-date-format="dd-mm-yyyy" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Tanggal Dokumen Diterbitkan"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="Txt_expdoc_bkl">Tanggal Dokumen Berakhir</label>
					                    <asp:TextBox ID="Txt_expdoc_bkl" required data-provide="datepicker" data-date-format="dd-mm-yyyy" runat="server" type="text" CssClass="form-control" placeholder="Masukkan Tanggal Dokumen Berakhir"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-10 col-md-offset-1">
                                    <!--<div class="form-group">
                                        <label for="TextBox_alamat1_bkl">Alamat1 Bengkel</label>
					                    <asp:TextBox ID="TextBox_alamat1_bkl" runat="server" type="text" CssClass="form-control" placeholder="Masukkan alamat1 Bengkel" required></asp:TextBox>
                                    </div>-->
                                    <label for="FileUpload_dokbkl">Upload File Dokumen</label>
                                    <asp:FileUpload ID="FileUpload_dokbkl" runat="server" />
                                    <p class="help-block" style="font-size: 12px">Semua format file dokumen dapat disimpan</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
                        <asp:Button ID="Btn_savedok_bkl" CssClass="btn btn-success"  runat="server" Text="Simpan" OnClick="Btn_savedok_bkl_Click" />
                    </div>
                </div>
            </div>
        </div>
        <!--modal tambah dokumen session end here-->
		
        <!-- Modal lihat gambar dokumen-->
        <div id="ShowDokBkl" class="modal fade">
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
        <div id="ShowGalBkl" class="modal fade">
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
        <div id="ShowHistoriBkl" class="modal fade">
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