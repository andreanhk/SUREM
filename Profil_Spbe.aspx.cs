using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Data.Sql;
using System.Configuration;

public partial class Try : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PlantCS"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["NotifRmdr"] == null && Session["NotifExp"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["NotifRmdr"] != null && Session["NotifExp"] != null)
        {
            string TotalRMdr = Session["NotifRmdr"].ToString();
            string TotalExp = Session["NotifExp"].ToString();
            Label_TipRmdr.Text = TotalRMdr;
            Label_TipExp.Text = TotalExp;
            Label_NotifRmdr.Text = TotalRMdr;
            Label_NotifExp.Text = TotalExp;
        }

        if (Session["New"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else if (Session["New"] != null)
        {
            string strses = Convert.ToString(Session["New"]);

            if (strses == "admin")
                LabelUser.Text = "Admin ";
            else
            {
                LabelUser.Text = "" + strses;
                LinkButton editbtn1 = (LinkButton)FormView_ProfilSpbe.FindControl("Edit_ProfilSpbe");
                LinkButton editbtn2 = (LinkButton)FormView_SarfasSpbe.FindControl("Edit_SarfasSpbe");
                
                addnewdoc.Visible = false;
                GridView_DokSpbe.Columns[7].Visible = (Session["New"] == "admin");
                GridView_DokSpbe.Columns[8].Visible = (Session["New"] == "admin");
                FileUpload_galeri.Visible = false;
                ManageUserTab.Visible = false;

                Btn_EditPP_Spbe.Visible = false;
                btnaddnewgal.Visible = false;              

                if (Session["New"] != "admin")
                {
                    editbtn1.Visible = false;
                    editbtn2.Visible = false;
                }
            }
        }
        if (this.IsPostBack)
        {
            TabName.Value = Request.Form[TabName.UniqueID];
        }
        if (!IsPostBack)
        {
            BindGridView_DokSpbe();
            DetailImage();
        }

        string s = "DELETE FROM [histori_spbe] WHERE DATEDIFF(day, GETDATE(), [dateubah_histori_spbe]) = 1826";
        SqlCommand cmd = new SqlCommand(s, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void Btn_savedok_spbe_Click(object sender, EventArgs e)
    {
        string vendor = Request.QueryString["spbe"];
        string path = Server.MapPath("Images/");
        var awal1 = DateTime.ParseExact(Txt_datedoc_spbe.Text, "dd-mm-yyyy", null).ToString("yyyy-mm-dd");
        var awal2 = DateTime.ParseExact(Txt_expdoc_spbe.Text, "dd-mm-yyyy", null).ToString("yyyy-mm-dd");

        if (FileUpload_dokspbe.HasFile)
        {
            if (vendor != null)
            {
                    FileUpload_dokspbe.SaveAs(path + FileUpload_dokspbe.FileName);
                    string name = "~/Images/" + FileUpload_dokspbe.FileName;
                    string s = "INSERT INTO dokumen_spbe(noreg_dokumen_spbe, tipe_dokumen_spbe, pub_dokumen_spbe, date_dokumen_spbe, exp_dokumen_spbe,image_dokumen_spbe, id_vendor_spbe, rem_dokumen_spbe) VALUES('" + Txt_nodok_spbe.Text + "','" + Txt_tipedok_spbe.Text + "','" + Txt_pubdoc_spbe.Text + "','" + awal1 + "','" + awal2 + "','" + name + "','" + vendor + "','" + Txt_remdoc_spbe.Text + "')";
                    string sh = "INSERT INTO histori_spbe(id_vendor_spbe, aksi_spbe, dateawal_histori_spbe, dateakhir_histori_spbe, no_regdok_spbe, tipedok_spbe, pubdok_spbe, imgdok_spbe) VALUES('" + vendor +"','Tambah Dokumen Baru','" + awal1 + "','" + awal2 + "','" + Txt_nodok_spbe.Text + "','" + Txt_tipedok_spbe.Text + "','" + Txt_pubdoc_spbe.Text + "','" + name + "')";

                    SqlCommand cmd = new SqlCommand(s, con);
                    SqlCommand cmd1 = new SqlCommand(sh, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Maaf, tidak dapat menyimpan data (error no parameter found)');</script>");
            }
        }
        else
        {
            if (vendor != null)
            {
                string s = "INSERT INTO dokumen_spbe(noreg_dokumen_spbe, tipe_dokumen_spbe, pub_dokumen_spbe, date_dokumen_spbe, exp_dokumen_spbe, id_vendor_spbe, rem_dokumen_spbe) VALUES('" + Txt_nodok_spbe.Text + "','" + Txt_tipedok_spbe.Text + "','" + Txt_pubdoc_spbe.Text + "','" + awal1 + "','" + awal2 + "','" + vendor + "','" + Txt_remdoc_spbe.Text + "')";
                string sh = "INSERT INTO histori_spbe(id_vendor_spbe, aksi_spbe, dateawal_histori_spbe, dateakhir_histori_spbe, no_regdok_spbe, tipedok_spbe, pubdok_spbe) VALUES('" + vendor + "','Tambah Dokumen Baru','" + awal1 + "','" + awal2 + "','" + Txt_nodok_spbe.Text + "','" + Txt_tipedok_spbe.Text + "','" + Txt_pubdoc_spbe.Text + "')";

                SqlCommand cmd = new SqlCommand(s, con);
                SqlCommand cmd1 = new SqlCommand(sh, con);
                con.Open();
                cmd.ExecuteNonQuery();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Maaf, tidak dapat menyimpan data (error no parameter found)');</script>");
            }
        }
    }

    protected void Save_GalSpbe_Click(object sender, EventArgs e)
    {
        string vendor1 = Request.QueryString["spbe"];
        string path1 = Server.MapPath("Images/");

        if (FileUpload_galeri.HasFile)
        {
            int filesize1 = FileUpload_galeri.PostedFile.ContentLength;
            if (filesize1 > 2097152)
            {
                Response.Write(@"<script language='javascript'>alert('Ukuran file lebih dari 2Mb');</script>");
            }
            else
            {
                FileUpload_galeri.SaveAs(path1 + FileUpload_galeri.FileName);
                string name1 = "~/Images/" + FileUpload_galeri.FileName;
                string s1 = "INSERT INTO image_spbe(id_vendor_spbe, img_spbe) VALUES('" + vendor1 + "','" +  name1 + "')";

                SqlCommand cmd1 = new SqlCommand(s1, con);
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
        }
    }

    protected void BindGridView_DokSpbe()
    {
        string par = Request.QueryString["spbe"].ToString();
            
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dokumen_spbe WHERE id_vendor_spbe = " + par, con);

        con.Open();
        da.Fill(dt);
        con.Close();

        if (dt.Rows.Count > 0)
        {
            GridView_DokSpbe.DataSource = dt;
            GridView_DokSpbe.DataBind();
        }
    }

    protected void GridView_DokSpbe_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView_DokSpbe.EditIndex = -1;
        BindGridView_DokSpbe();
    }

    protected void GridView_DokSpbe_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView_DokSpbe.EditIndex = e.NewEditIndex;
        BindGridView_DokSpbe();
    }

    protected void GridView_DokSpbe_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string vendor2 = Request.QueryString["spbe"];
        string iddok = GridView_DokSpbe.DataKeys[e.RowIndex].Value.ToString();

        TextBox dokpubsp = (TextBox)GridView_DokSpbe.Rows[e.RowIndex].FindControl("TextBox5");
        TextBox dokdatesp = (TextBox)GridView_DokSpbe.Rows[e.RowIndex].FindControl("TextBox2");
        TextBox dokexpsp = (TextBox)GridView_DokSpbe.Rows[e.RowIndex].FindControl("TextBox3");

        FileUpload FileUpload4 = (FileUpload)GridView_DokSpbe.Rows[e.RowIndex].FindControl("FileUpload4");

        string path1 = "~/Images/";
        if (FileUpload4.HasFile)
        {
            path1 += FileUpload4.FileName;
            FileUpload4.SaveAs(MapPath(path1));
        }
        else
        {
            Image img = (Image)GridView_DokSpbe.Rows[e.RowIndex].FindControl("img_up");
            path1 = img.ImageUrl;
        }

        SqlCommand cmd2 = new SqlCommand("UPDATE dokumen_spbe SET pub_dokumen_spbe='" + dokpubsp.Text + "', date_dokumen_spbe='" + dokdatesp.Text + "', exp_dokumen_spbe='" + dokexpsp.Text + "', image_dokumen_spbe='" + path1 + "' WHERE id_dokumen_spbe=" + iddok + "", con);
        SqlCommand cmd3 = new SqlCommand("INSERT INTO [histori_spbe] (aksi_spbe, id_vendor_spbe, dateawal_histori_spbe, dateakhir_histori_spbe, no_regdok_spbe, tipedok_spbe, pubdok_spbe, imgdok_spbe) SELECT ('Update Dokumen'), id_vendor_spbe, date_dokumen_spbe, exp_dokumen_spbe, noreg_dokumen_spbe, tipe_dokumen_spbe, pub_dokumen_spbe, image_dokumen_spbe FROM [dokumen_spbe] WHERE id_dokumen_spbe =" + iddok, con);

        con.Open();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        con.Close();

        GridView_DokSpbe.EditIndex = -1;
        BindGridView_DokSpbe();
        Response.Redirect(Request.RawUrl);
    }

    protected void GridView_DokSpbe_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView_DokSpbe.DataKeys[e.RowIndex].Value.ToString();

        SqlCommand cmd1 = new SqlCommand("INSERT INTO [histori_spbe] (aksi_spbe, id_vendor_spbe, dateawal_histori_spbe, dateakhir_histori_spbe, no_regdok_spbe, tipedok_spbe, pubdok_spbe, imgdok_spbe) SELECT ('Hapus Dokumen'), id_vendor_spbe, date_dokumen_spbe, exp_dokumen_spbe, noreg_dokumen_spbe, tipe_dokumen_spbe, pub_dokumen_spbe, image_dokumen_spbe FROM [dokumen_spbe] WHERE id_dokumen_spbe =" + id, con);
        SqlCommand cmd = new SqlCommand("delete from dokumen_spbe where id_dokumen_spbe=" + id, con);
        con.Open();
        cmd1.ExecuteNonQuery();
        cmd.ExecuteNonQuery();
        con.Close();
        BindGridView_DokSpbe();
        Response.Redirect(Request.RawUrl);
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void GridView_HistoriSpbe_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (drv["aksi_spbe"].ToString().Equals("Tambah Dokumen Baru"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#66FF99");
            }
            else if (drv["aksi_spbe"].ToString().Equals("Update Dokumen"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#0099FF");
            }
            else
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#FF9900");
            }
        }
    }

    private void DetailImage()
    {
        string par = Request.QueryString["spbe"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[spbe] WHERE id_vendor_spbe = " + par, con);

        DataTable table = new DataTable();

        da.Fill(table);
        DataList_ProfilSpbe.DataSource = table;
        DataList_ProfilSpbe.DataBind();
    }

    protected void SavePP_Spbe_Click(object sender, EventArgs e)
    {
        string vendor2 = Request.QueryString["spbe"];
        string path2 = Server.MapPath("Images/");

        if (UploadPP_Spbe.HasFile)
        {
            int filesize1 = UploadPP_Spbe.PostedFile.ContentLength;
            if (filesize1 > 2097152)
            {
                Response.Write(@"<script language='javascript'>alert('Ukuran file lebih dari 2Mb');</script>");
            }
            else
            {
                UploadPP_Spbe.SaveAs(path2 + UploadPP_Spbe.FileName);
                string name2 = "~/Images/" + UploadPP_Spbe.FileName;
                string s2 = "UPDATE [dbo].[spbe] SET [imgpp_spbe] = '" +  name2 + "' WHERE [id_vendor_spbe] = '" + vendor2 + "'";

                SqlCommand cmd2 = new SqlCommand(s2, con);
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();
                Response.Redirect(Request.RawUrl);
            }
        }
        else
        {
        }
    }
    
    protected void DataList_GalSpbe_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        int imgid = (int)DataList_GalSpbe.DataKeys[(int)e.Item.ItemIndex];
        cmd.CommandText = "DELETE FROM [image_spbe] WHERE idimg_spbe=" + imgid;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        DataList_GalSpbe.EditItemIndex = -1;
        DataList_GalSpbe.DataBind();
        Response.Redirect(Request.RawUrl);
    }
    protected void DataList_GalSpbe_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (Session["New"] != null)
        {
            string strses = Convert.ToString(Session["New"]);
            if (strses != "admin")
            {
                var delbtn = e.Item.FindControl("DltBtn") as LinkButton;
                delbtn.Visible = false;
            }
        }
    }
    protected void Down_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        if (lk != null)
        {
            Response.AddHeader("Content-disposition", "attachment; filename=" + lk.CommandArgument );
            Response.WriteFile(Server.MapPath("" + lk.CommandArgument.ToString() ));
            Response.End();
        }
    }
    protected void GridView_DokSpbe_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_DokSpbe.PageIndex = e.NewPageIndex;
        BindGridView_DokSpbe();
    }
    protected void DownHis_Click(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        if (lk != null)
        {
            Response.AddHeader("Content-disposition", "attachment; filename=" + lk.CommandArgument);
            Response.WriteFile(Server.MapPath("" + lk.CommandArgument.ToString()));
            Response.End();
        }
    }
}