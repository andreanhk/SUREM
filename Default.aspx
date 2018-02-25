<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    
    <meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" href="assets/images/favicon.ico" />

	<title>Monitoring Dokumen - Domestic Gas Region V</title>

    <link href="assets/css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css" />

    <script src="assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function(){
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
						<li><a href="Bengkel.aspx"><i class="glyphicon glyphicon-wrench"></i> Bengkel Tabung</a></li>
                        <li class="active"><a href="Default.aspx" data-toggle="tooltip" data-placement="bottom" data-html="true" title='Dokumen Dalam Masa Tenggang: <asp:Label ID="Label_TipRmdr" runat="server"></asp:Label><br />Dokumen Habis Masa Berlaku: <asp:Label ID="Label_TipExp" runat="server" CssClass="red"></asp:Label>'><i class="glyphicon glyphicon-time"></i> Monitoring Dokumen <span class="badge"><asp:Label ID="Label_NotifRmdr" runat="server"></asp:Label></span> <span class="badge red"><asp:Label ID="Label_NotifExp" runat="server" CssClass="red"></asp:Label></span></a></li>
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
            <h1 class="near">Monitoring Dokumen</h1>
            <h1><small>Domestic Gas Region V</small></h1>
	    </div>

			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-12">
                        <h3><i class="glyphicon glyphicon-file"></i> Dokumen Dalam Masa Tenggang</h3>
                        <div class="kanan">
                            <h4><i class="glyphicon glyphicon-home"></i> SP(P)BE</h4>
                            <div class="table-responsive">
                               <asp:GridView ID="GridView_SpbeRmdr" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dokumen_spbe" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField Visible="false" DataField="id_vendor_spbe" HeaderText="No. Vendor" SortExpression="id_vendor_spbe" />
                                        <asp:BoundField DataField="id_spbe" HeaderText="Kode Plant" SortExpression="id_spbe" />
                                        <asp:BoundField DataField="nama_spbe" HeaderText="Nama" SortExpression="nama_spbe" />
                                        <asp:BoundField Visible="false" DataField="id_dokumen_spbe" HeaderText="id_dokumen_spbe" InsertVisible="False" ReadOnly="True" SortExpression="id_dokumen_spbe" />
                                        <asp:BoundField DataField="noreg_dokumen_spbe" HeaderText="No. Dokumen" SortExpression="noreg_dokumen_spbe" />
                                        <asp:BoundField DataField="tipe_dokumen_spbe" HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_spbe" />
                                        <asp:BoundField DataField="pub_dokumen_spbe" HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_spbe" />
                                        <asp:BoundField DataField="date_dokumen_spbe" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_spbe" dataformatstring="{0:d MMMM yyyy}" />
                                        <asp:BoundField DataField="exp_dokumen_spbe" HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_spbe" dataformatstring="{0:d MMMM yyyy}" />
                                        <asp:BoundField DataField="dif_dokumen_spbe" HeaderText="Sisa Hari" SortExpression="dif_dokumen_spbe" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image_Bell" runat="server" ImageUrl="~/assets/images/bell.gif" CssClass="img-responsive" Width="20px" Height="20px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                    SelectCommand="SELECT *,[spbe].[nama_spbe] FROM [dokumen_spbe] INNER JOIN [spbe] ON [dokumen_spbe].[id_vendor_spbe] = [spbe].[id_vendor_spbe] WHERE [dokumen_spbe].[dif_dokumen_spbe] <= [dokumen_spbe].[rem_dokumen_spbe] AND DATEDIFF(day, GETDATE(), [dokumen_spbe].[exp_dokumen_spbe]) >= 0">
                                </asp:SqlDataSource>
                            </div>

                            <h4><i class="glyphicon glyphicon-user"></i> Agen</h4>
                            <div class="table-responsive">
                                <asp:GridView ID="GridView_AgenRmdr" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dokumen_agen" DataSourceID="SqlDataSource3">
                                    <Columns>
                                        <asp:BoundField Visible="false" DataField="id_vendor_agen" HeaderText="No. Vendor" SortExpression="id_vendor_agen"></asp:BoundField>               
                                        <asp:BoundField DataField="soldto_agen" HeaderText="Sold To" SortExpression="soldto_agen" />
                                        <asp:BoundField DataField="nama_agen" HeaderText="Nama" SortExpression="nama_agen" />
                                        <asp:BoundField DataField="noreg_dokumen_agen" HeaderText="No. Dokumen" SortExpression="noreg_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField Visible="false" DataField="id_dokumen_agen" HeaderText="id_dokumen_agen" ReadOnly="True" InsertVisible="False" SortExpression="id_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField DataField="tipe_dokumen_agen" HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField DataField="pub_dokumen_agen" HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField DataField="date_dokumen_agen" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_agen" dataformatstring="{0:d MMMM yyyy}"></asp:BoundField>
                                        <asp:BoundField DataField="exp_dokumen_agen" HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_agen" dataformatstring="{0:d MMMM yyyy}"></asp:BoundField>
                                        <asp:BoundField DataField="dif_dokumen_agen" HeaderText="Sisa Hari" SortExpression="dif_dokumen_agen"></asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image_Bell" runat="server" ImageUrl="~/assets/images/bell.gif" CssClass="img-responsive" Width="20px" Height="20px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:PlantCS %>' 
                                    SelectCommand="SELECT *, [agen].[nama_agen] FROM [dokumen_agen] INNER JOIN [agen] ON [dokumen_agen].[id_vendor_agen] = [agen].[id_vendor_agen] WHERE [dokumen_agen].[dif_dokumen_agen] <= [dokumen_agen].[rem_dokumen_agen] AND DATEDIFF(day, GETDATE(), [dokumen_agen].[exp_dokumen_agen]) >= 0">
                                </asp:SqlDataSource>
                            </div>

                            <h4><i class="glyphicon glyphicon-wrench"></i> Bengkel</h4>
                            <div class="table-responsive">
                                <asp:GridView ID="GridView_BklRmdr" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dokumen_bkl" DataSourceID="SqlDataSource4">
                                    <Columns>
                                        <asp:BoundField Visible="false" DataField="id_dokumen_bkl" HeaderText="id_dokumen_bkl" ReadOnly="True" InsertVisible="False" SortExpression="id_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField Visible="false" DataField="id_vendor_bkl" HeaderText="No. Vendor" SortExpression="id_vendor_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="no_vendor_bkl" HeaderText="No. Vendor" SortExpression="no_vendor_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="nama_bkl" HeaderText="Nama" SortExpression="nama_bkl" />
                                        <asp:BoundField DataField="noreg_dokumen_bkl" HeaderText="No. Dokumen" SortExpression="noreg_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="tipe_dokumen_bkl" HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="pub_dokumen_bkl" HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="date_dokumen_bkl" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_bkl" dataformatstring="{0:d MMMM yyyy}" ></asp:BoundField>
                                        <asp:BoundField DataField="exp_dokumen_bkl" HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_bkl" dataformatstring="{0:d MMMM yyyy}" ></asp:BoundField>
                                        <asp:BoundField DataField="dif_dokumen_bkl" HeaderText="Sisa Hari" SortExpression="dif_dokumen_bkl"></asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image_Bell" runat="server" ImageUrl="~/assets/images/bell.gif" CssClass="img-responsive" Width="20px" Height="20px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:PlantCS %>' 
                                    SelectCommand="SELECT *,[bkl].[nama_bkl] FROM [dokumen_bkl] INNER JOIN [bkl] ON [dokumen_bkl].[id_vendor_bkl] = [bkl].[id_vendor_bkl] WHERE [dokumen_bkl].[dif_dokumen_bkl] <= [dokumen_bkl].[rem_dokumen_bkl] AND DATEDIFF(day, GETDATE(), [dokumen_bkl].[exp_dokumen_bkl]) >= 0">
                                </asp:SqlDataSource>
                            </div>
                        </div>

                        <h3><i class="glyphicon glyphicon-duplicate"></i> Dokumen Habis Masa Berlaku</h3>
                        <div class="kanan">
                            <h4><i class="glyphicon glyphicon-home"></i> SP(P)BE</h4>
                            <div class="table-responsive">
                                <asp:GridView ID="GridView_SpbeExp" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dokumen_spbe" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundField Visible="false" DataField="id_vendor_spbe" HeaderText="No. Vendor" SortExpression="id_vendor_spbe" />
                                        <asp:BoundField DataField="id_spbe" HeaderText="Kode Plant" SortExpression="id_spbe" />
                                        <asp:BoundField DataField="nama_spbe" HeaderText="Nama" SortExpression="nama_spbe" />
                                        <asp:BoundField Visible="false" DataField="id_dokumen_spbe" HeaderText="id_dokumen_spbe" InsertVisible="False" ReadOnly="True" SortExpression="id_dokumen_spbe" />
                                        <asp:BoundField DataField="noreg_dokumen_spbe" HeaderText="No. Dokumen" SortExpression="noreg_dokumen_spbe" />
                                        <asp:BoundField DataField="tipe_dokumen_spbe" HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_spbe" />
                                        <asp:BoundField DataField="pub_dokumen_spbe" HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_spbe" />
                                        <asp:BoundField DataField="date_dokumen_spbe" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_spbe" dataformatstring="{0:d MMMM yyyy}" />
                                        <asp:BoundField DataField="exp_dokumen_spbe" HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_spbe" dataformatstring="{0:d MMMM yyyy}" />
                                        <asp:BoundField DataField="dif_dokumen_spbe" HeaderText="Sisa Hari" SortExpression="dif_dokumen_spbe" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image_Alert" runat="server" ImageUrl="~/assets/images/alert.gif" CssClass="img-responsive" Width="8px" Height="20px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E67373" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E67373" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PlantCS %>" 
                                    SelectCommand="SELECT *,[spbe].[nama_spbe] FROM [dokumen_spbe] INNER JOIN [spbe] ON [dokumen_spbe].[id_vendor_spbe] = [spbe].[id_vendor_spbe] WHERE [dokumen_spbe].[dif_dokumen_spbe] < 0">
                                </asp:SqlDataSource>
                            </div>

                            <h4><i class="glyphicon glyphicon-user"></i> Agen</h4>
                            <div class="table-responsive">
                                <asp:GridView ID="GridView_AgenExp" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dokumen_agen" DataSourceID="SqlDataSource5">
                                    <Columns>
                                        <asp:BoundField Visible="false" DataField="id_vendor_agen" HeaderText="No. Vendor" SortExpression="id_vendor_agen"></asp:BoundField>               
                                        <asp:BoundField DataField="soldto_agen" HeaderText="Sold To" SortExpression="soldto_agen" />
                                        <asp:BoundField DataField="nama_agen" HeaderText="Nama" SortExpression="nama_agen" />
                                        <asp:BoundField DataField="noreg_dokumen_agen" HeaderText="No. Dokumen" SortExpression="noreg_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField Visible="false" DataField="id_dokumen_agen" HeaderText="id_dokumen_agen" ReadOnly="True" InsertVisible="False" SortExpression="id_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField DataField="tipe_dokumen_agen" HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField DataField="pub_dokumen_agen" HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_agen"></asp:BoundField>
                                        <asp:BoundField DataField="date_dokumen_agen" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_agen" dataformatstring="{0:d MMMM yyyy}"></asp:BoundField>
                                        <asp:BoundField DataField="exp_dokumen_agen" HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_agen" dataformatstring="{0:d MMMM yyyy}"></asp:BoundField>
                                        <asp:BoundField DataField="dif_dokumen_agen" HeaderText="Sisa Hari" SortExpression="dif_dokumen_agen"></asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image_Alert" runat="server" ImageUrl="~/assets/images/alert.gif" CssClass="img-responsive" Width="8px" Height="20px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E67373" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E67373" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:PlantCS %>' 
                                    SelectCommand="SELECT *, [agen].[nama_agen] FROM [dokumen_agen] INNER JOIN [agen] ON [dokumen_agen].[id_vendor_agen] = [agen].[id_vendor_agen] WHERE [dokumen_agen].[dif_dokumen_agen] < 0">
                                </asp:SqlDataSource>
                            </div>

                            <h4><i class="glyphicon glyphicon-wrench"></i> Bengkel</h4>
                            <div class="table-responsive">
                                <asp:GridView ID="GridView_BklExp" CssClass="table table-bordered table-hover table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id_dokumen_bkl" DataSourceID="SqlDataSource6">
                                    <Columns>
                                        <asp:BoundField Visible="false" DataField="id_dokumen_bkl" HeaderText="id_dokumen_bkl" ReadOnly="True" InsertVisible="False" SortExpression="id_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField Visible="false" DataField="id_vendor_bkl" HeaderText="No. Vendor" SortExpression="id_vendor_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="no_vendor_bkl" HeaderText="No. Vendor" SortExpression="no_vendor_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="nama_bkl" HeaderText="Nama" SortExpression="nama_bkl" />
                                        <asp:BoundField DataField="noreg_dokumen_bkl" HeaderText="No. Dokumen" SortExpression="noreg_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="tipe_dokumen_bkl" HeaderText="Jenis Dokumen" SortExpression="tipe_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="pub_dokumen_bkl" HeaderText="Penerbit Dokumen" SortExpression="pub_dokumen_bkl"></asp:BoundField>
                                        <asp:BoundField DataField="date_dokumen_bkl" HeaderText="Tanggal Dokumen Diterbitkan" SortExpression="date_dokumen_bkl" dataformatstring="{0:d MMMM yyyy}" ></asp:BoundField>
                                        <asp:BoundField DataField="exp_dokumen_bkl" HeaderText="Tanggal Dokumen Berakhir" SortExpression="exp_dokumen_bkl" dataformatstring="{0:d MMMM yyyy}" ></asp:BoundField>
                                        <asp:BoundField DataField="dif_dokumen_bkl" HeaderText="Sisa Hari" SortExpression="dif_dokumen_bkl"></asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image_Alert" runat="server" ImageUrl="~/assets/images/alert.gif" CssClass="img-responsive" Width="8px" Height="20px" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E67373" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E67373" Font-Bold="True" ForeColor="Navy" />
                                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                    <SortedDescendingHeaderStyle BackColor="#820000" />
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:PlantCS %>' 
                                    SelectCommand="SELECT *,[bkl].[nama_bkl] FROM [dokumen_bkl] INNER JOIN [bkl] ON [dokumen_bkl].[id_vendor_bkl] = [bkl].[id_vendor_bkl] WHERE [dokumen_bkl].[dif_dokumen_bkl] < 0">
                                </asp:SqlDataSource>
                            </div>

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
