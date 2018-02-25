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

public partial class Profil_agen : System.Web.UI.Page
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
                LinkButton editbtn1 = (LinkButton)FormView_ProfilAgen.FindControl("Edit_ProfilAgen");
                LinkButton editbtn2 = (LinkButton)FormView_SarfasAgen.FindControl("Edit_SarfasAgen");
                addnewdoc.Visible = false;

                GridView_DokAgen.Columns[7].Visible = (Session["New"] == "admin");
                GridView_DokAgen.Columns[8].Visible = (Session["New"] == "admin");
                FileUpload_galeri.Visible = false;
                Button1.Visible = false;
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
            BindGridView_Agen();
            DetailImage();
        }

        string s = "DELETE FROM [histori_agen] WHERE DATEDIFF(day, GETDATE(), [dateubah_histori_agen]) = 1826";
        SqlCommand cmd = new SqlCommand(s, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void Btn_savedok_agen_Click(object sender, EventArgs e)
    {
        string vendor = Request.QueryString["agen"];
        string path = Server.MapPath("Images/");
        var awal1 = DateTime.ParseExact(Txt_datedoc_agen.Text, "dd-mm-yyyy", null).ToString("yyyy-mm-dd");
        var awal2 = DateTime.ParseExact(Txt_expdoc_agen.Text, "dd-mm-yyyy", null).ToString("yyyy-mm-dd");

        if (FileUpload_dokagen.HasFile)
        {
            int filesize = FileUpload_dokagen.PostedFile.ContentLength;
            if (vendor != null)
            {
                    FileUpload_dokagen.SaveAs(path + FileUpload_dokagen.FileName);
                    string name = "~/Images/" + FileUpload_dokagen.FileName;
                    string s = "INSERT INTO dokumen_agen(noreg_dokumen_agen, tipe_dokumen_agen, pub_dokumen_agen, date_dokumen_agen, exp_dokumen_agen,image_dokumen_agen, id_vendor_agen, rem_dokumen_agen) VALUES('" + Txt_nodok_agen.Text + "','" + Txt_tipedok_agen.Text + "','" + Txt_pubdoc_agen.Text + "','" + awal1 + "','" + awal2 + "','" + name + "','" + vendor + "','" + Txt_remdoc_agen.Text + "')";
                    string sh = "INSERT INTO histori_agen(id_vendor_agen, aksi_agen, dateawal_histori_agen, dateakhir_histori_agen, no_regdok_agen, tipedok_agen, pubdok_agen, imgdok_agen) VALUES('" + vendor + "','Tambah Dokumen Baru','" + awal1 + "','" + awal2 + "','" + Txt_nodok_agen.Text + "','" + Txt_tipedok_agen.Text + "','" + Txt_pubdoc_agen.Text + "','" + name + "')";

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
                string s = "INSERT INTO dokumen_agen(noreg_dokumen_agen, tipe_dokumen_agen, pub_dokumen_agen, date_dokumen_agen, exp_dokumen_agen, id_vendor_agen, rem_dokumen_agen) VALUES('" + Txt_nodok_agen.Text + "','" + Txt_tipedok_agen.Text + "','" + Txt_pubdoc_agen.Text + "','" + awal1 + "','" + awal2 + "','" + vendor + "','" + Txt_remdoc_agen.Text + "')";
                string sh = "INSERT INTO histori_agen(id_vendor_agen, aksi_agen, dateawal_histori_agen, dateakhir_histori_agen, no_regdok_agen, tipedok_agen, pubdok_agen) VALUES('" + vendor + "','Tambah Dokumen Baru','" + awal1 + "','" + awal2 + "','" + Txt_nodok_agen.Text + "','" + Txt_tipedok_agen.Text + "','" + Txt_pubdoc_agen.Text + "')";

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

    protected void Button1_Click(object sender, EventArgs e)
    {
        string vendor1 = Request.QueryString["agen"];
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
                string s1 = "INSERT INTO image_agen(id_vendor_agen, img_agen) VALUES('" + vendor1 + "','" + name1 + "')";

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

    protected void BindGridView_Agen()
    {
        string par = Request.QueryString["agen"].ToString();

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM dokumen_agen WHERE id_vendor_agen = " + par, con);

        con.Open();
        da.Fill(dt);
        con.Close();

        if (dt.Rows.Count > 0)
        {
            GridView_DokAgen.DataSource = dt;
            GridView_DokAgen.DataBind();
        }
    }

    protected void GridView_DokAgen_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView_DokAgen.EditIndex = -1;
        BindGridView_Agen();
    }

    protected void GridView_DokAgen_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView_DokAgen.EditIndex = e.NewEditIndex;
        BindGridView_Agen();
    }

    protected void GridView_DokAgen_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string vendor2 = Request.QueryString["agen"];
        string iddok = GridView_DokAgen.DataKeys[e.RowIndex].Value.ToString();

        TextBox dokpubsp = (TextBox)GridView_DokAgen.Rows[e.RowIndex].FindControl("TextBox5");
        TextBox dokdatesp = (TextBox)GridView_DokAgen.Rows[e.RowIndex].FindControl("TextBox2");
        TextBox dokexpsp = (TextBox)GridView_DokAgen.Rows[e.RowIndex].FindControl("TextBox3");

        FileUpload FileUpload4 = (FileUpload)GridView_DokAgen.Rows[e.RowIndex].FindControl("FileUpload4");

        string path1 = "~/Images/";
        if (FileUpload4.HasFile)
        {
            path1 += FileUpload4.FileName;
            FileUpload4.SaveAs(MapPath(path1));
        }
        else
        {
            Image img = (Image)GridView_DokAgen.Rows[e.RowIndex].FindControl("img_up");
            path1 = img.ImageUrl;
        }

        SqlCommand cmd2 = new SqlCommand("UPDATE dokumen_agen SET pub_dokumen_agen='" + dokpubsp.Text + "', date_dokumen_agen='" + dokdatesp.Text + "', exp_dokumen_agen='" + dokexpsp.Text + "', image_dokumen_agen='" + path1 + "' WHERE id_dokumen_agen=" + iddok + "", con);
        SqlCommand cmd3 = new SqlCommand("INSERT INTO [histori_agen] (aksi_agen, id_vendor_agen, dateawal_histori_agen, dateakhir_histori_agen, no_regdok_agen, tipedok_agen, pubdok_agen, imgdok_agen) SELECT ('Update Dokumen'), id_vendor_agen, date_dokumen_agen, exp_dokumen_agen, noreg_dokumen_agen, tipe_dokumen_agen, pub_dokumen_agen, image_dokumen_agen FROM [dokumen_agen] WHERE id_dokumen_agen =" + iddok, con);

        con.Open();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        con.Close();

        GridView_DokAgen.EditIndex = -1;
        BindGridView_Agen();
        Response.Redirect(Request.RawUrl);
    }

    protected void GridView_DokAgen_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView_DokAgen.DataKeys[e.RowIndex].Value.ToString();

        SqlCommand cmd1 = new SqlCommand("INSERT INTO [histori_agen] (aksi_agen, id_vendor_agen, dateawal_histori_agen, dateakhir_histori_agen, no_regdok_agen, tipedok_agen, pubdok_agen, imgdok_agen) SELECT ('Hapus Dokumen'), id_vendor_agen, date_dokumen_agen, exp_dokumen_agen, noreg_dokumen_agen, tipe_dokumen_agen, pub_dokumen_agen, image_dokumen_agen FROM [dokumen_agen] WHERE id_dokumen_agen =" + id, con);
        SqlCommand cmd = new SqlCommand("delete from dokumen_agen where id_dokumen_agen=" + id, con);
        con.Open();
        cmd1.ExecuteNonQuery();
        cmd.ExecuteNonQuery();
        con.Close();
        BindGridView_Agen();
        Response.Redirect(Request.RawUrl);
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["New"] = null;
        Response.Redirect("Login.aspx");
    }

    protected void GridView_HistoriAgen_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (drv["aksi_agen"].ToString().Equals("Tambah Dokumen Baru"))
            {
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#66FF99");
            }
            else if (drv["aksi_agen"].ToString().Equals("Update Dokumen"))
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
        string par = Request.QueryString["agen"].ToString();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[agen] WHERE id_vendor_agen = " + par, con);

        DataTable table = new DataTable();

        da.Fill(table);
        DataList_ProfilAgen.DataSource = table;
        DataList_ProfilAgen.DataBind();
    }

    protected void SavePP_Agen_Click(object sender, EventArgs e)
    {
        string vendor2 = Request.QueryString["agen"];
        string path2 = Server.MapPath("Images/");

        if (UploadPP_Agen.HasFile)
        {
            int filesize1 = UploadPP_Agen.PostedFile.ContentLength;
            if (filesize1 > 2097152)
            {
                Response.Write(@"<script language='javascript'>alert('Ukuran file lebih dari 2Mb');</script>");
            }
            else
            {
                UploadPP_Agen.SaveAs(path2 + UploadPP_Agen.FileName);
                string name2 = "~/Images/" + UploadPP_Agen.FileName;
                string s2 = "UPDATE [dbo].[agen] SET [imgpp_agen] = '" + name2 + "' WHERE [id_vendor_agen] = '" + vendor2 + "'";

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

    protected void DataList_GalAgen_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        int imgid = (int)DataList_GalAgen.DataKeys[(int)e.Item.ItemIndex];
        cmd.CommandText = "DELETE FROM [image_agen] WHERE idimg_agen=" + imgid;
        cmd.Connection.Open();
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        DataList_GalAgen.EditItemIndex = -1;
        DataList_GalAgen.DataBind();
        Response.Redirect(Request.RawUrl);
    }
    protected void DataList_GalAgen_ItemDataBound(object sender, DataListItemEventArgs e)
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
            Response.AddHeader("Content-disposition", "attachment; filename=" + lk.CommandArgument);
            Response.WriteFile(Server.MapPath("" + lk.CommandArgument.ToString()));
            Response.End();
        }
    }
    protected void GridView_DokAgen_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView_DokAgen.PageIndex = e.NewPageIndex;
        BindGridView_Agen();
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